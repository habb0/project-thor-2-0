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

namespace ThorServer.Game.Rooms
{
    public class RoomUser
    {
        public long SessionID;
        public int RoomUserID;

        public int CurrentX;
        public int CurrentY;
        public float CurrentZ;
        public int HeadDirection = 0;
        public int BodyDirection = 0;

        public bool HasRights = false;
        public bool HasAdmin = false;

        public bool IsMoving = false;
        public List<Pathfinding.PathFinderNode> Path;
        public int TargetX;
        public int TargetY;
        public int NextX;
        public int NextY;
        public float NextZ;
        public bool MustUpdate = false;
        public bool AllowOveride = false;
        public bool UserLocked = false;

        public string LastStatus = "none";

        public bool TradeAccepted = false;
        public long TradingWith = 0;
        public List<int> TradeOffer;


        public Dictionary<string, RoomUserStatus> SpecialStates = new Dictionary<string, RoomUserStatus>();

        public UserInfo UserInfo
        {
            get
            {
                return InstanceManager.Sessions.GetSession(SessionID).mUserInfo;
            }
        }

        public class RoomUserStatus
        {
            public string StatusName;
            public double EndTime = 0;
            public bool Inifnite = false;
            public string CustomData = null;
            public bool CanWalkWithStatus = true;
            public bool IsVisible = true;

            private string Action;
            private int ActionDelay;
            private double ActionTimer;
            private int ActionLength;
            private bool IsOnAction;
            private string OldStatus; 

            private int day;

            public RoomUserStatus(string name, bool canWalk, string custData, int NumberOfSeconds, int actionDelay, int actionLength, string action, bool isVisible)
            {
                StatusName = name;
                if (NumberOfSeconds != 0)
                {
                    EndTime = DateTime.Now.TimeOfDay.TotalSeconds + NumberOfSeconds;
                    Inifnite = false;
                }
                else
                {
                    Inifnite = true;
                }
                CustomData = custData;
                CanWalkWithStatus = canWalk;

                day = DateTime.Now.Day;
                ActionDelay = actionDelay;
                ActionTimer = DateTime.Now.TimeOfDay.TotalSeconds + ActionDelay;
                ActionLength = actionLength;
                Action = action;
                OldStatus = StatusName;
                IsVisible = isVisible;
            }

            public RoomUserStatus() {}

            public bool IsStillValid()
            {
                if (!Inifnite)
                {
                    if (EndTime < DateTime.Now.TimeOfDay.TotalSeconds || day != DateTime.Now.Day)
                    {
                        return false;
                    }
                }
                if (ActionDelay > 0)
                {
                    if (ActionTimer < DateTime.Now.TimeOfDay.TotalSeconds || (day != DateTime.Now.Day && IsOnAction))
                    {
                        if (IsOnAction == true)
                        {
                            StatusName = OldStatus;
                            ActionTimer = DateTime.Now.TimeOfDay.TotalSeconds + ActionDelay;
                            IsOnAction = false;
                        }
                        else
                        {
                            ActionTimer = DateTime.Now.TimeOfDay.TotalSeconds + ActionLength;
                            StatusName = Action;
                            IsOnAction = true;
                        }
                    }
                }

                return true;
            }
        }
    }
}
