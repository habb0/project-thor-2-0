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
using ThorServer.Game.Users;

namespace ThorServer.Game.Messenger
{
    public class MessengerReactor : Reactor
    {
        //12 - "MESSENGERINIT": "@L"
        public void Listener12()
        {
            mMessage.Init(12); //L
            SendMessage(mMessage);

            List<MessengerManager.MessengerBuddy> frs = InstanceManager.Game.Messenger.GetRequests(mUserInfo.userId);

            if (frs != null)
            {
                foreach (MessengerManager.MessengerBuddy buddy in frs)
                {
                    int userId = buddy.User1;
                    UserInfo user = InstanceManager.Game.Users.GetUser(userId);
                    mMessage.Init(132); //BD
                    mMessage.appendArgumentInt(user.userId);
                    mMessage.appendString(user.sUsername);
                    mMessage.appendChar(2);
                    SendMessage(mMessage);
                }
                
            }
        }

        //15 -  "MESSENGER_UPDATE": "@O"
        public void Listener15()
        {
            string response = InstanceManager.Game.Messenger.BuildBuddyList(mUserInfo.userId);
            if (response != null)
            {
                SendMessage(response);
            }
        }

        //37 - "MESSENGER_ACCEPTBUDDY": "@e"
        public void Listener37()
        {
                int userid = ArgumentEncoding.decodeInt(mPacketBody);
                InstanceManager.Game.Messenger.AcceptBuddy(mUserInfo.userId, userid);
                Listener15();
        }

        //38 - "MESSENGER_DECLINEBUDDY": "@f"
        public void Listener38()
        {
            if (ArgumentEncoding.decodeInt(mPacketBody.Substring(1)) == 0)
            {
                InstanceManager.Game.Messenger.RejectAllBuddys(mUserInfo.userId);
            }
            else
            {
                int userid = ArgumentEncoding.decodeInt(mPacketBody.Substring(1));

                InstanceManager.Game.Messenger.RejectBuddy(mUserInfo.userId, userid);
            }
        }


        //39 - "MESSENGER_REQUESTBUDDY": "@g"
        public void Listener39()
        {
            string username = FuseMessage.getArgument(1, mPacketBody);
            if (InstanceManager.Game.Users.UserExists(username))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(username);
                if (InstanceManager.Game.Messenger.GetBuddy(mUserInfo.userId, user.userId) == null)
                {
                    InstanceManager.Game.Messenger.AddBuddy(mUserInfo.userId, user.userId);

                    if (InstanceManager.Sessions.GetSessionFromUser(user.userId) != -1)
                    {
                        mMessage.Init(132); //BD
                        mMessage.appendArgumentInt(mUserInfo.userId);
                        mMessage.appendString(mUserInfo.sUsername);
                        mMessage.appendChar(2);
                        InstanceManager.Sessions.GetSession(InstanceManager.Sessions.GetSessionFromUser(user.userId)).SendMessage(mMessage);
                    }
                }
            }
        }

        //40 - "MESSENGER_REMOVEBUDDY": "@h"
        public void Listener40()
        {
            int userid = ArgumentEncoding.decodeInt(mPacketBody.Substring(1));
            InstanceManager.Game.Messenger.DeleteBuddy(mUserInfo.userId, userid);

            mMessage.Init(138); //BJ
            mMessage.appendArgumentInt(1);
            mMessage.appendArgumentInt(userid);
            SendMessage(mMessage);
        }

        //41 - "FINDUSER": "@i"
        public void Listener41()
        {
            string username = FuseMessage.getArgument(1, mPacketBody);
            string response = InstanceManager.Game.Messenger.BuildSearchResponse(username);
            if (response != null)
            {
                SendMessage(response);
            }
        }
    }
}
