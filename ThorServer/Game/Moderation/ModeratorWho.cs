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
        private void TextCommandWho(string dataRaw, long sessionId)
        {
            string commandBody = dataRaw.Substring(dataRaw.IndexOf(' ') + 1);

            if (ModHasRight(sessionId, "fuse_who"))
            {
                StringBuilder userList = new StringBuilder();
                int userCount = 0;

                foreach(Session.SessionHandler sess in InstanceManager.Sessions.GetSessionList())
                {
                    if (sess.mUserInfo != null)
                    {
                        userCount++;
                        userList.Append(sess.mUserInfo.sUsername);
                        if (userCount % 10 == 0)
                        {
                            userList.Append(Convert.ToChar(13));
                        }
                        else
                        {
                            userList.Append(',');
                            userList.Append(' ');
                        }
                    }
                }

                mMessage.Init(139); //BK
                mMessage.appendString("Users Online: ");
                mMessage.appendInt(userCount);
                mMessage.appendChar(13);
                mMessage.appendChar(13);
                mMessage.appendString(userList.ToString());
                InstanceManager.Sessions.GetSession(sessionId).SendMessage(mMessage);
            }
        }
    }
}