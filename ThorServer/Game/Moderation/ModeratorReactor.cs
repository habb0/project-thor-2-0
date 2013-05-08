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

using ThorServer.Session;
using ThorServer.Game.Users;

namespace ThorServer.Game.Moderation
{
    public class ModeratorReactor : Reactor
    {
        private string mPayload;


        //48 - "PICK_CRYFORHELP": "@p"
        public void Listener48()
        {
            int callId = ArgumentEncoding.decodeInt(FuseMessage.getArgument(1, mPacketBody));

            InstanceManager.Game.Moderation.PickupCallForHelp(callId, mUserInfo);
        }

        //198 - "CHANGECALLCATEGORY": "CF"
        public void Listener198()
        {
            string payload = FuseMessage.getArgument(1, mPacketBody);
            int callId = ArgumentEncoding.decodeInt(payload);
            int priority = ArgumentEncoding.decodeInt(mPacketBody.Substring(payload.Length + 2));
            InstanceManager.Game.Moderation.UpgradeCFH(callId, priority, mUserInfo);
        }

        //199 - "MESSAGETOCALLER": "CG"
        public void Listener199()
        {
            int callId = ArgumentEncoding.decodeInt(FuseMessage.getArgument(1, mPacketBody));
            string message = FuseMessage.getArgument(2, mPacketBody);
            message = SpecialFiltering.FilterChars("2,9", message);
            InstanceManager.Game.Moderation.ReplyCallForHelp(callId, message, mUserInfo);
        }

        //200 - "MODERATIONACTION": "CH"
        public void Listener200()
        {
            int commandCat = ArgumentEncoding.decodeInt(mPacketBody.Substring(0, 1));
            int commandId = ArgumentEncoding.decodeInt(mPacketBody.Substring(1, 1));
            mPayload = mPacketBody.Substring(2);

            //User Command
            if (commandCat == 0)
            {
                switch (commandId)
                {
                    case 0: //Alert
                        DoAlert();
                        break;

                    case 1: //Kick
                        DoKick();
                        break;

                    case 2: //Ban
                        DoBan();
                        break;
                }
            }

            //Room Command
            if (commandCat == 1)
            {
                switch (commandId)
                {
                    case 0: //Room Alert
                        DoRoomAlert();
                        break;

                    case 1: //Room Kick
                        DoRoomKick();
                        break;

                }
            }
        }

        private void DoAlert()
        {
            string alertMessage = FuseMessage.getArgument(1, mPayload);
            string alertExtra = FuseMessage.getArgument(2, mPayload);
            string alertUser = FuseMessage.getArgument(3, mPayload);

            long targetSession = InstanceManager.Sessions.GetSessionFromUser(alertUser);

            if(targetSession != -1){
                InstanceManager.Game.Moderation.ModeratorAlert(null, targetSession, mSessionID, alertMessage, alertExtra);
            }
        }

        private void DoKick()
        {
            string alertMessage = FuseMessage.getArgument(1, mPayload);
            string alertExtra = FuseMessage.getArgument(2, mPayload);
            string alertUser = FuseMessage.getArgument(3, mPayload);

            long targetSession = InstanceManager.Sessions.GetSessionFromUser(alertUser);

            if (targetSession != -1)
            {
                InstanceManager.Game.Moderation.ModeratorKick(null, targetSession, mSessionID, alertMessage, alertExtra);
            }
        }

        private void DoBan()
        {
            string banReason = FuseMessage.getArgument(1, mPayload);
            string banExtra = FuseMessage.getArgument(2, mPayload);
            string banUser = FuseMessage.getArgument(3, mPayload);
            string banLast = mPayload.Substring(FuseMessage.getArgumentEnd(3, mPayload));
            
            int banHours = ArgumentEncoding.decodeInt(banLast);
            bool banIp = ArgumentEncoding.decodeInt(banLast.Substring(ArgumentEncoding.getLength(banHours) + 1)) > 0;
            bool banMachine = ArgumentEncoding.decodeInt(banLast.Substring(ArgumentEncoding.getLength(banHours))) > 0;

            long targetSession = InstanceManager.Sessions.GetSessionFromUser(banUser);

            if (targetSession != -1)
            {
                UserInfo user = InstanceManager.Sessions.GetSession(targetSession).mUserInfo;
                InstanceManager.Game.Moderation.ModeratorBan(null, user.userId, mUserInfo.userId, banReason, banHours, targetSession, mSessionID, banMachine, banIp, banExtra);
            }
        }

        private void DoRoomAlert()
        {
            string alertMessage = FuseMessage.getArgument(1, mPayload);
            string alertExtra = FuseMessage.getArgument(2, mPayload);

            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;

            if (roomId > 0)
            {
                InstanceManager.Game.Moderation.ModeratorRoomAlert(roomId, mSessionID, alertMessage, alertExtra);
            }
        }

        private void DoRoomKick()
        {
            string alertMessage = FuseMessage.getArgument(1, mPayload);
            string alertExtra = FuseMessage.getArgument(2, mPayload);

            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;

            if (roomId > 0)
            {
                InstanceManager.Game.Moderation.ModeratorRoomKick(roomId, mSessionID, alertMessage, alertExtra) ;
            }
        }
    }
}
