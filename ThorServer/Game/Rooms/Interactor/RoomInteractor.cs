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
        private List<Furni.FurniInfo> mFloorFurni;
        private List<Furni.FurniInfo> mWallFurni;
        private RoomInstance mRoomInstance;

        private string mDefaultHeightmap;
        private string[,] mClientMap;
        private byte[,] mMatrix;
        private Thread mThread;
        private bool[,] mPlayerMap;
        private float[,] mHeightMap;
        private Point[,] mRedirectMap;

        private const int FrameTime = 470;

        public RoomInteractor(int roomId, RoomInstance rInstance)
        {
            mRoomInstance = rInstance;
            mDefaultHeightmap = mRoomInstance.RoomInfo.DefaultHeightmap;
            mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(roomId);
            mWallFurni = InstanceManager.Game.Furni.GetRoomWallFurni(roomId);
            GenerateMaps();
            mPlayerMap = new bool[mMatrix.GetUpperBound(0), mMatrix.GetUpperBound(1)];
            
            mThread = new Thread(RoomWorker);
            mThread.Start();

        }

        void RoomWorker()
        {
            while (true)
            {
                try
                {
                    HighResolutionTime.Start();
                    HandleUserMovements();
                    HandleRollerActions();
                    if (mHasPoolCam) HandlePoolCamera();
                    
                    double numberMilli = HighResolutionTime.GetTime();

                    if (numberMilli < FrameTime) Thread.Sleep(FrameTime - (int)numberMilli);
                }
                catch(Exception e)
                {
                    Logging.LogEvent("A room error occured. Stack trace: " + e.ToString(), Logging.LogLevel.Error);
                }
               
            }
        }

        public void DestroyInteractor()
        {
            mThread.Abort();
            mThread = null;
        }

    }
}
