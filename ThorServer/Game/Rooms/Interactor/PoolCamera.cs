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
using System.Drawing;
using System.Timers;
using System.Threading;

using ThorServer.Game.Furni;
using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Rooms;
using ThorServer.Game.Rooms.Pathfinding;

namespace ThorServer.Game.Rooms.Interactor
{
    public partial class RoomInteractor
    {

        private double mCameraNext = DateTime.Now.TimeOfDay.TotalSeconds + 10;
        private int mCameraDay = DateTime.Now.DayOfYear;

        public bool mHasPoolCam = false;

        private void HandlePoolCamera()
        {
            
            if (DateTime.Now.TimeOfDay.TotalSeconds > mCameraNext || mCameraDay != DateTime.Now.DayOfYear)
            {
                if (SpecialMath.RandomNumber(0, 10) > 5)
                {
                    int randomTarget = mRoomInstance.mRoomUserIDs[SpecialMath.RandomNumber(0, mRoomInstance.mRoomUserIDs.Count - 1)];

                    int targetCamera = 1;
                    if (SpecialMath.RandomNumber(0, 10) > 5) targetCamera = 2;
                    SendCameraPacket("setcamera " + targetCamera.ToString());

                    string transition = "fade";
                    if (SpecialMath.RandomNumber(0, 10) > 5) transition = "cameraPan";
                    SendCameraPacket("transition " + transition);

                    SendCameraPacket("targetcamera " + randomTarget.ToString());


                }

                mCameraNext = DateTime.Now.TimeOfDay.TotalSeconds + 5;
                mCameraDay = DateTime.Now.DayOfYear;
            }
        }

        private void SendCameraPacket(string action)
        {
            ClientMessage mMessage = new ClientMessage();

            mMessage.Init(71); //AG
            mMessage.appendString("cam1 ");
            mMessage.appendString(action);
            mRoomInstance.RoomBroadcast(mMessage);
        }
    }
}
