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
        private void TextCommandServCast(string dataRaw, long sessionId, int roomId)
        {
            string commandBody = dataRaw.Substring(dataRaw.IndexOf(' ') + 1);
            ModeratorServCast(sessionId, commandBody, "Text Command");
        }

        public void ModeratorServCast(long sessionFrom, string message, string extraInfo)
        {
            if (ModHasRight(sessionFrom, "fuse_admin_servcast"))
            {
                ExecuteServCast(message);
                WhisperResponse("Servcast complete", sessionFrom);
                LogCommand(InstanceManager.Sessions.GetSession(sessionFrom).mUserInfo.userId, 0, "servcast", message, extraInfo);
            }
        }

        public void ExecuteServCast(string messageToSend)
        {
            mMessage.Init(139); //BK
            mMessage.appendString(messageToSend);
            InstanceManager.Sessions.BroadcastToAll(mMessage);
        }
    }
}
