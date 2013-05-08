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

using ThorServer.Game.Rooms;
using ThorServer.Utilities;
using ThorServer.Game.Furni;

namespace ThorServer.Game.Rooms.Reactors
{
    public class PoolReactor : PublicReactor
    {
        //116 - "POOLCHANGE": "At"
        public void Listener116()
        {
            RoomUser user = mRoomInstance.GetUser(mUserInfo.sUsername);
            List<FurniInfo> objects = mRoomInstance.Interactor.GetFurniObjects(user.CurrentX, user.CurrentY);

            if (objects != null)
            {
                foreach (FurniInfo info in objects)
                {
                    if (info.Flags.PoolChange)
                    {

                        mUserInfo.sPoolFigure = "";
                        
                        if(SpecialFiltering.CheckPoolFigure(mPacketBody))
                        {
                            mUserInfo.sPoolFigure = mPacketBody;
                        }

                        InstanceManager.Game.Users.UpdateUser(mUserInfo);
                        mUserInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);

                        user.UserLocked = false;
                        //Unblock the curtain position
                        int tmpX = int.Parse(info.WallLocation.Split(',')[2]);
                        int tmpY = int.Parse(info.WallLocation.Split(',')[3]);

                        mRoomInstance.Interactor.RequestMovePlayer(mSessionID, tmpX, tmpY, null, true);
                        mRoomInstance.AnnounceUser(mSessionID);
                    }
                }

            }
        }
    }
}
