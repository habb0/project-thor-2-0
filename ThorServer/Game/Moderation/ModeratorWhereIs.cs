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
        private void TextCommandWhereIs(string dataRaw, long sessionId)
        {
            string commandBody = dataRaw.Substring(dataRaw.IndexOf(' ') + 1);


            
            if (ModHasRight(sessionId, "fuse_whereis"))
            {
                if (InstanceManager.Game.Users.UserExists(commandBody))
                {
                    UserInfo userInfo = InstanceManager.Game.Users.GetUser(commandBody);
                    long userSession = InstanceManager.Sessions.GetSessionFromUser(userInfo.userId);
                    if (userSession != -1)
                    {
                        int roomId = InstanceManager.Sessions.GetSession(userSession).mRoomID;

                        if (roomId > 0)
                        {
                            RoomInfo roomInfo = InstanceManager.Game.Rooms.GetRoom(roomId);

                            WhisperResponse("User '" + commandBody + "' is in the room '" + roomInfo.RoomName + "'", sessionId);
                        }
                        else
                        {
                            WhisperResponse("User '" + commandBody + "' is on the front page.", sessionId);
                        }
                    }
                    else
                    {
                        WhisperResponse("User '" + commandBody + "' is not online.", sessionId);
                    }
                }
                else
                {
                    WhisperResponse("Could not find user '" + commandBody + "'", sessionId);
                }
            }
        }
    }
}