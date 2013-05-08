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
        public bool HouseKeepingCommand(long sessionid, int issuer, int target, string command, string message)
        {
            long userSession = InstanceManager.Sessions.GetSessionFromUser(target); ;

            switch (command)
            {
                case "remotealert":

                    if (userSession != -1)
                    {
                        ExecuteAlert(userSession, message);
                        LogCommand(issuer, target, command, message, "Housekeeping");
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                case "remotekick":

                    if (userSession != -1)
                    {
                        int roomId = InstanceManager.Sessions.GetSession(userSession).mRoomID;
                        if (roomId > 0)
                        {
                            ExecuteKick(userSession, message, roomId);
                        }
                        else
                        {
                            ExecuteAlert(userSession, message);
                        }
                        LogCommand(issuer, target, command, message, "Housekeeping; Room: " + roomId.ToString());
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                case "remoteban":

                    if (userSession != -1)
                    {
                        int roomId = InstanceManager.Sessions.GetSession(userSession).mRoomID;
                        ExecuteBanVisible(userSession, message, roomId);
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                case "remoteservcast":
                    ExecuteServCast(message);
                    LogCommand(issuer, target, command, message, "Housekeeping");
                    return true;

                case "updatecredits":

                    if (userSession != -1)
                    {
                        UserInfo userInfo = InstanceManager.Game.Users.GetUser(target);
                        mMessage.Init(6); //@F
                        mMessage.appendString(userInfo.iCredits.ToString() + ".0");
                        InstanceManager.Sessions.GetSession(userSession).SendMessage(mMessage);
                        return true;
                    }
                    else
                    {
                        return false;
                    }

                case "updatehand":

                    if (userSession != -1)
                    {
                        InstanceManager.Sessions.InvokeReactorMethod(userSession, "UpdateHandInvoker");
                        return true;
                    }
                    else
                    {
                        return false;
                    }

            }

            return false;


        }
    }
}
