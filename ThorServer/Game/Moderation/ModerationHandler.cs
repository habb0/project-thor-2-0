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

using ThorServer.Utilities;
using ThorServer.Game.Users;

namespace ThorServer.Game.Moderation
{
    public partial class ModerationHandler
    {
        private ClientMessage mMessage = new ClientMessage();
        private ModerationDatabase mModDatabase = new ModerationDatabase();

        public ModerationDatabase ModerationData
        {
            get
            {
                return mModDatabase;
            }
        }

        public void TextCommandProcess(ref string input, long sessionId, int roomId)
        {
            if (input.Length > 1)
            {
                string theMessage = input.Substring(1);
                string theCommand = "";
                if (theMessage.Contains(' '))
                {
                    theCommand = theMessage.Split(' ')[0];
                }
                else
                {
                    theCommand = theMessage;
                }



                    switch (theCommand)
                    {
                        case "alert":
                            input = null;
                            TextCommandAlert(theMessage, sessionId, roomId);
                            return;

                        case "kick":
                            input = null;
                            TextCommandKick(theMessage, sessionId, roomId);
                            return;

                        case "softkick":
                            input = null;
                            TextCommandSoftKick(theMessage, sessionId, roomId);
                            return;

                        case "roomalert":
                            input = null;
                            TextCommandRoomAlert(theMessage, sessionId, roomId);
                            return;

                        case "roomkick":
                            input = null;
                            TextCommandRoomKick(theMessage, sessionId, roomId);
                            return;

                        case "shutup":
                            input = null;
                            TextCommandShutup(theMessage, sessionId, roomId);
                            return;

                        case "unmute":
                            input = null;
                            TextCommandUnmute(theMessage, sessionId, roomId);
                            return;

                        case "roomshutup":
                            input = null;
                            TextCommandRoomShutup(sessionId, roomId);
                            return;

                        case "roomunmute":
                            input = null;
                            TextCommandRoomUnmute(sessionId, roomId);
                            return;

                        case "ban":
                            input = null;
                            TextCommandBan(theMessage, sessionId, roomId, false);
                            return;

                        case "superban":
                            input = null;
                            TextCommandBan(theMessage, sessionId, roomId, true);
                            return;

                        case "servcast":
                            input = null;
                            TextCommandServCast(theMessage, sessionId, roomId);
                            return;

                        case "whereis":
                            input = null;
                            TextCommandWhereIs(theMessage, sessionId);
                            return;

                        case "who":
                            input = null;
                            TextCommandWho(theMessage, sessionId);
                            break;

                       //Removing this next part is ILLEGAL. DO NOT REMOVE IT!
                        case "identify":
                            input = null;
                            WhisperResponse("Thor Server Copyright Joe Hegarty (Joeh / Adus) 2008. Licensed Under GNU AGPL Version 3.", sessionId);
                            return;

                    }

                }
            
        }

        private void WhisperResponse(string response, long sessionid)
        {
            if (sessionid > 0)
            {
                int roomId = InstanceManager.Sessions.GetSession(sessionid).mRoomID;
                if (roomId > 0)
                {
                    int roomUser = InstanceManager.Game.Rooms.GetRoomInstance(roomId).GetUser(sessionid).RoomUserID;
                    ClientMessage mMessage = new ClientMessage();
                    mMessage.Init(25); //@Y
                    mMessage.appendString(ArgumentEncoding.encodeInt(roomUser));
                    mMessage.appendString(response);
                    mMessage.appendChar(2);
                    InstanceManager.Game.Rooms.GetRoomInstance(roomId).SendMessage(mMessage, sessionid);
                }
            }
        }

        private bool ModHasRight(long sessionId, string right)
        {
            UserInfo moderator = InstanceManager.Sessions.GetSession(sessionId).mUserInfo;
            int roleId = moderator.iRole;
            return InstanceManager.Game.Roles.HasRight(roleId, right);
        }
    }
}
