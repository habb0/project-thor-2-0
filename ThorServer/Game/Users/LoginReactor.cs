/*
Thor Server Project
Copyright 2008 Joe Hegarty


This file is part of The Thor Server Project.

The Thor Server Project is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Thor Server Project is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with The Thor Server Project.  If not, see <http://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ThorServer.Core;
using ThorServer.Utilities;

namespace ThorServer.Game.Users
{
    public class LoginReactor : Reactor
    {
        int loginTries = 0;

        //4 - "TRY_LOGIN": "@D"
        public void Listener4()
        {
            loginTries++;

            if (loginTries > 3)
            {
                mMessage.Init(35); // @c
                mMessage.appendString("Too many login attempts");
                SendMessage(mMessage);
                InstanceManager.Connections.EndConnection(mSessionID);
            }
            else
            {
                string username = FuseMessage.getArgument(1, mPacketBody);
                string password = FuseMessage.getArgument(2, mPacketBody);
                ProcessLogin(username, password);
            }
            
        }

        //42 - "APPROVENAME": "@j"
        public void Listener42()
        {
            mMessage.Init(36); //@d
            if (InstanceManager.Game.Users.UserExists(SpecialFiltering.FilterName(FuseMessage.getArgument(1, mPacketBody))) == true || FuseMessage.getArgument(1, mPacketBody).ToUpper().Contains("MOD-"))
            {
                mMessage.appendString("PA"); //Taken
            }
            else
            {
                mMessage.appendString("H"); //Free
            }
            SendMessage(mMessage);
        }

        //43 - "REGISTER": "@k"
        public void Listener43()
        {
            //Registration packet breaks the standard structured argument rule - Handle this exception:
            mPacketBody = mPacketBody.Replace("A@", "@E");

            //Get arguments
            UserInfo newUser = new UserInfo();
            newUser.sUsername = FuseMessage.getStructured(2, mPacketBody);
            if (newUser.sUsername.Length > 16) newUser.sUsername =  newUser.sUsername.Substring(0, 16);
            newUser.sUsername = SpecialFiltering.FilterName(newUser.sUsername);

            

            if (!InstanceManager.Game.Users.UserExists(newUser.sUsername) && newUser.sUsername.Length > 0 && !newUser.sUsername.ToUpper().Contains("MOD-")) 
            {
                newUser.sPassword = FuseMessage.getStructured(3, mPacketBody);
                newUser.sFigure = FuseMessage.getStructured(4, mPacketBody);
                newUser.sSex = FuseMessage.getStructured(5, mPacketBody);
                newUser.sMission = FuseMessage.getStructured(6, mPacketBody);
                newUser.sEmail = FuseMessage.getStructured(7, mPacketBody);
                newUser.sDOB = FuseMessage.getStructured(8, mPacketBody);
                newUser.LastIP = InstanceManager.Connections.GetConnection(mSessionID).GetIP();
                InstanceManager.Game.Users.CreateUser(newUser);
                ProcessLogin(newUser.sUsername, newUser.sPassword);
            }
            else
            {
                ReportError("user", false);
            }
        }

        //46 - "AC": "@n"
        public void Listener46()
        {
            mMessage.Init(271); //DO
            SendMessage(mMessage);
        }

        //197 - "APPROVEEMAIL": "CE"  
        public void Listener197()
        {
            mMessage.Init(271); //DO
            SendMessage(mMessage);
        }

        //202 - "GENERATEKEY": "CJ"
        public void Listener202()
        {
            mMessage.Init(8); //@H
            mMessage.appendString(Settings.ClientClubAllowedSets);
            SendMessage(mMessage);
            mMessage.Init(257); //DA
            mMessage.appendString("RAHIIIKHJIPAIQAdd-MM-yyyy" + Convert.ToChar(2));
            SendMessage(mMessage);
        }

        //203 - "APPROVE_PASSWORD": "CK"
        public void Listener203()
        {
            mMessage.Init(282); //DZ
            mMessage.appendString("H"); //Fine
            SendMessage(mMessage);
        }

        //999 - "HOUSEKEEPING0": "Og"
        public void Listener999()
        {
            if (InstanceManager.Connections.GetConnection(mSessionID).GetIP() == "127.0.0.1")
            {
                string command= FuseMessage.getArgument(1, mPacketBody);
                int issuer = int.Parse(FuseMessage.getArgument(2, mPacketBody));
                int target = int.Parse(FuseMessage.getArgument(3, mPacketBody));
                string message = FuseMessage.getArgument(4, mPacketBody);
                if (InstanceManager.Game.Moderation.HouseKeepingCommand(mSessionID, issuer, target, command, message))
                {
                    SendMessage("ACK");
                }
                else
                {
                    SendMessage("BAD");
                }
            }
            else
            {
                SendMessage("BAD");
            }

            InstanceManager.Sessions.GetSession(mSessionID).MakeSessionDirty();
        }





        private void ProcessLogin(string username, string password)
        {
            string banMessage = "Banned";
            byte logonResult = InstanceManager.Game.Users.UserLogin(username, password, InstanceManager.Connections.GetConnection(mSessionID).GetIP(), ref banMessage);
            if (logonResult == 0)
            {
                mUserInfo = InstanceManager.Game.Users.GetUser(username);
                mUserInfo.LastLogin = DateTime.Now;
                mUserInfo.LastIP = InstanceManager.Connections.GetConnection(mSessionID).GetIP();
                InstanceManager.Game.Users.LogLogin(mUserInfo);
                InstanceManager.Game.Users.UpdateUser(mUserInfo);
                mUserInfo = InstanceManager.Game.Users.GetUser(username);

                //Kill existing connections
                InstanceManager.Sessions.EnforceUniqueLogon(mUserInfo.userId);

                mMessage.Init(2); //@B
                mMessage.appendString(InstanceManager.Game.Roles.GenerateRightsList(mUserInfo.iRole));
                SendMessage(mMessage);
                mMessage.Init(3); //@C
                SendMessage(mMessage);

                mMessage.Init(8); //@H
                mMessage.appendString(Settings.ClientClubAllowedSets);
                SendMessage(mMessage);

                InstanceManager.Sessions.GetSession(mSessionID).SessionAuthenticated(mUserInfo);

            }
            else if (logonResult == 1) //Bad user
            {
                ReportError("login incorrect: Wrong username", false);
            }
            else if (logonResult == 2 || logonResult == 3) //Bad password or permissions
            {
                ReportError("login incorrect: Wrong password", false);
            }
            else if (logonResult == 4) // Banned
            {
                UserInfo info = InstanceManager.Game.Users.GetUser(username);
                mMessage.Init(35); //@c
                mMessage.appendString(banMessage);
                SendMessage(mMessage);
                InstanceManager.Sessions.GetSession(mSessionID).MakeSessionDirty();
            }
        }
    }
}
