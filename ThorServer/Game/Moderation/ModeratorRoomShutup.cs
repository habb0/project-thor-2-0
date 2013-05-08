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
        private void TextCommandRoomShutup(long sessionId, int roomId)
        {
            ModeratorRoomShutup(roomId, sessionId);
        }

        public void ModeratorRoomShutup(int roomTo, long sessionFrom)
        {
            if (ModHasRight(sessionFrom, "fuse_room_mute"))
            {
                ExecuteRoomShutup(roomTo, InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId);
                WhisperResponse("Executed room shutup", sessionFrom);
                LogCommand(InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId, roomTo, "roomshutup", "", "Text Command");
            }
        }

        public void ExecuteRoomShutup(int roomTo, int ignoreUser)
        {
            RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomTo);
            foreach (RoomUser user in instance.Users.Values)
            {
                if (user.UserInfo.userId != ignoreUser)
                {
                    if (!instance.HasUniqueStatus(user.SessionID, "mute"))
                    {
                        instance.GetUser(user.SessionID).SpecialStates.Add("mute", new RoomUser.RoomUserStatus("mute", true, "", 0, 0, 0, null, false));
                    }
                }

            }
        }
    }
}
