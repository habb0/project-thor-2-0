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

using ThorServer.Game.Users;

using ThorServer.Game.Rooms;

namespace ThorServer.Game.Moderation
{
    public partial class ModerationHandler
    {
        private void TextCommandBan(string dataRaw, long sessionId, int roomId, bool superBan)
        {
            string commandBody = dataRaw.Substring(dataRaw.IndexOf(' ') + 1);

            if (commandBody.Contains(' '))
            {
                string user = commandBody.Substring(0, commandBody.IndexOf(' '));
                string tmpVal = commandBody.Substring(commandBody.IndexOf(' ') + 1);
                if (tmpVal.Contains(' '))
                {
                    string banLength = tmpVal.Substring(0, tmpVal.IndexOf(' '));
                    string messageToSend = tmpVal.Substring(tmpVal.IndexOf(' ') + 1);
                    int banHours;

                    if (int.TryParse(banLength, out banHours))
                    {

                        RoomUser userInfo = InstanceManager.Game.Rooms.GetRoomInstance(roomId).GetUser(user);
                        RoomUser userBanner = InstanceManager.Game.Rooms.GetRoomInstance(roomId).GetUser(sessionId);

                        if (userInfo != null)
                        {
                            ModeratorBan(userInfo, userInfo.UserInfo.userId, userBanner.UserInfo.userId, messageToSend, banHours, userInfo.SessionID, sessionId, superBan, superBan, "Text Command");
                        }
                    }
                }
            }
        }

        public void ModeratorBan(RoomUser user, int userToBan, int userBanner, string message, int numHours, long sessionTo, long sessionFrom, bool banMachine, bool banIp, string extraInfo)
        {
            if (ModHasRight(sessionFrom, "fuse_ban"))
            {
                int roomId = InstanceManager.Sessions.GetSession(sessionTo).mRoomID;

                ExecuteBan(sessionTo, message, roomId, userToBan, userBanner, numHours, banIp);
                if (user != null)
                {
                    WhisperResponse("Ban issued to " + user.UserInfo.sUsername, sessionFrom);
                    LogCommand(InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId, user.UserInfo.userId, "ban", "Length:" + numHours.ToString() + "\r\nMessage:" + message, extraInfo);
                }
            }
        }



        public void ExecuteBan(long sessionToAlert, string messageToSend, int roomId, int userBan, int userBanner, int banLen, bool banIp)
        {
            
            InstanceManager.Game.Moderation.ModerationData.BanUser(userBan, userBanner, messageToSend, banLen, banIp);
            ExecuteBanVisible(sessionToAlert, messageToSend, roomId);           
        }

        public void ExecuteBanVisible(long sessionToAlert, string messageToSend, int roomId)
        {
            mMessage.Init(18); // @R
            InstanceManager.Sessions.GetSession(sessionToAlert).SendMessage(mMessage);

            mMessage.Init(35); //@c
            mMessage.appendString(messageToSend);

            InstanceManager.Sessions.GetSession(sessionToAlert).SendMessage(mMessage);
            InstanceManager.Sessions.GetSession(sessionToAlert).MakeSessionDirty();

            if (roomId > 0)
            {
                InstanceManager.Game.Rooms.GetRoomInstance(roomId).RemoveUser(sessionToAlert);
            }
        }
    }
}
