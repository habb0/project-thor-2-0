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
        private void TextCommandRoomKick(string dataRaw, long sessionId, int roomId)
        {
            string commandBody = dataRaw.Substring(dataRaw.IndexOf(' ') + 1);
            ModeratorRoomKick(roomId, sessionId, commandBody, "Text Command");
        }

        public void ModeratorRoomKick(int roomTo, long sessionFrom, string message, string extraInfo)
        {
            if (ModHasRight(sessionFrom, "fuse_room_kick"))
            {
                ExecuteRoomKick(roomTo, message, InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId);
                WhisperResponse("Executed room kick", sessionFrom);
                LogCommand(InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId, roomTo, "roomkick", message, extraInfo);
            }
        }

        public void ExecuteRoomKick(int roomTo, string messageToSend, int ignoreUser)
        {
            List<long> removeUsers = new List<long>();
            Dictionary<long, RoomUser> users = InstanceManager.Game.Rooms.GetRoomInstance(roomTo).Users;

            foreach (RoomUser user in users.Values)
            {
                if (user.UserInfo.userId != ignoreUser)
                {
                    mMessage.Init(18); // @R
                    InstanceManager.Sessions.GetSession(user.SessionID).SendMessage(mMessage);

                    mMessage.Init(33); // @a
                    mMessage.appendString("mod_warn/");
                    mMessage.appendString(messageToSend);
                    InstanceManager.Sessions.GetSession(user.SessionID).SendMessage(mMessage);

                    removeUsers.Add(user.SessionID);
                }
            }

            foreach (long sess in removeUsers)
            {
                InstanceManager.Game.Rooms.GetRoomInstance(roomTo).RemoveUser(sess);
            }
        }
    }
}
