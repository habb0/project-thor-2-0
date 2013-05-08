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

        private void HandleUserMovements()
        {
            Dictionary<long, RoomUser>.Enumerator myEnum = mRoomInstance.Users.GetEnumerator();

            while (myEnum.MoveNext())
            {
                
                RoomUser user = myEnum.Current.Value;
                user.UserLocked = true;
                if (user.IsMoving)
                {
                    if (user.Path.Count > 0)
                    {
                        WorkBestTile(user);
                        PathFinderNode nextNode = user.Path[0];
                        bool specialOcassion = (nextNode.X == user.TargetX && nextNode.Y == user.TargetY && InteractiveTile(nextNode.X, nextNode.Y) && PlayerCheck(nextNode.X, nextNode.Y) == false);
                        bool isOveride = user.AllowOveride && PlayerCheck(nextNode.X, nextNode.Y) == false;
                        user.AllowOveride = false;
                        if (TileCheck(nextNode.X, nextNode.Y, mMatrix) || specialOcassion || isOveride)
                        {
                            doPlayerUpdate(user, nextNode);
                        }
                        else
                        {
                            
                            bool playerBlock = PlayerCheck(nextNode.X, nextNode.Y);
                            byte tmpByte = 1;

                            if (playerBlock) { tmpByte = mMatrix[nextNode.X, nextNode.Y]; mMatrix[nextNode.X, nextNode.Y] = 0; }

                            List<PathFinderNode> route = WorkPath(user.SessionID, user.TargetX, user.TargetY, false);

                            if (playerBlock) mMatrix[nextNode.X, nextNode.Y] = tmpByte;

                            if (route != null)
                            {
                                if(TileCheck(route[0].X, route[0].Y, mMatrix))
                                {
                                    user.Path = route;
                                    doPlayerUpdate(user, route[0]);
                                }
                                else
                                {
                                    user.IsMoving = false;
                                    mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                                }
                            }
                            else
                            {
                                user.IsMoving = false;
                                mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                            }
                        }
                    }
                    else
                    {
                        //End of journey!
                        user.IsMoving = false;
                        CalculateTileStatusForUser(user.CurrentX, user.CurrentY, user, false);
                        mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                    }
                }
                else
                {
                    mRoomInstance.AnnounceUserStatus(user.SessionID, false);
                }
                user.UserLocked = false;
            }
        }

        private void WorkBestTile(RoomUser user)
        {
            if (user.Path.Count > 1)
            {
                PathFinderNode skipNode = user.Path[1];

                if (TilesTouching(user.CurrentX, user.CurrentY, skipNode.X, skipNode.Y))
                {
                    if (TileCheck(skipNode.X, skipNode.Y, mMatrix))
                    {
                        int checkX1 = 0;
                        int checkX2 = 0;
                        if (skipNode.X > user.CurrentX)
                        {
                            checkX1 = -1;
                            checkX2 = 1;
                        }
                        else
                        {
                            checkX1 = 1;
                            checkX2 = -1;
                        }

                        if (TileCheck(skipNode.X + checkX1, skipNode.Y, mMatrix) && TileCheck(user.CurrentX + checkX2, user.CurrentY, mMatrix))
                        {
                            PathFinderNode nextNode = user.Path[0];
                            user.Path.Remove(nextNode);
                        }
                    }
                }
            }
        }

        private void doPlayerUpdate(RoomUser user, PathFinderNode nextNode)
        {
            user.NextX = nextNode.X;
            user.NextY = nextNode.Y;
            user.NextZ = mHeightMap[user.NextX, user.NextY];
            user.Path.Remove(nextNode);
            mPlayerMap[user.CurrentX, user.CurrentY] = false;
            mPlayerMap[user.NextX, user.NextY] = true;
            int newDirection = SpecialMath.WorkDirection(user.CurrentX, user.CurrentY, user.NextX, user.NextY);
            user.HeadDirection = newDirection;
            user.BodyDirection = newDirection;
            mRoomInstance.AnnounceUserStatus(user.SessionID, true);
            user.CurrentX = user.NextX;
            user.CurrentY = user.NextY;
            user.CurrentZ = user.NextZ;
        }

        public void RequestMovePlayer(long sessionId, int NewX, int NewY, List<PathFinderNode> route, bool Override)
        {
            new DoMovePlayerDelegate(DoMovePlayer).BeginInvoke(sessionId, NewX, NewY, route, Override, null, null);
        }

        private delegate void DoMovePlayerDelegate(long sessionId, int NewX, int NewY, List<PathFinderNode> route, bool Override);
        public void DoMovePlayer(long sessionId, int NewX, int NewY, List<PathFinderNode> route, bool Override)
        {
            NewX = mRedirectMap[NewX, NewY].X;
            NewY = mRedirectMap[NewX, NewY].Y;

            RoomUser user = mRoomInstance.GetUser(sessionId);
            if (!user.UserLocked || Override)
            {
                if (route == null) route = WorkPath(sessionId, NewX, NewY, Override);
                if (route != null)
                {
                    RemoveTileStatus(user, user.CurrentX, user.CurrentY);
                    user.TargetX = NewX;
                    user.TargetY = NewY;
                    user.Path = route;
                    user.IsMoving = true;
                }
            }
        }


        private List<PathFinderNode> WorkPath(long sessionId, int NewX, int NewY, bool Overide)
        {
            bool specialOccassion = (InteractiveTile(NewX, NewY) && PlayerCheck(NewX, NewY) == false) || Overide;
            if (TileCheck(NewX, NewY, mMatrix) == true || specialOccassion)
            {
                RoomUser user = mRoomInstance.GetUser(sessionId);
                byte tmpByte = mMatrix[NewX, NewY];
                mMatrix[NewX, NewY] = 1;
                List<PathFinderNode> route = CalculatePath(user.CurrentX, user.CurrentY, NewX, NewY, mMatrix);
                mMatrix[NewX, NewY] = tmpByte;
                return route;
            }

            return null;
        }

        private void UpdateChangedUsers(int x, int y)
        {
            RoomUser user = mRoomInstance.GetUser(x, y);
            if (user != null)
            {
                CalculateTileStatusForUser(x, y, user, false);
            }
        }

        private void CalculateTileStatusForUser(int X, int Y, RoomUser user, bool isRoller)
        {
            mRoomInstance.RemoveUniqueStatus(user.SessionID, "sit");
            mRoomInstance.RemoveUniqueStatus(user.SessionID, "lay");

            List<FurniInfo> objects = GetFurniObjects(X, Y);
            if (objects != null)
            {
                foreach (FurniInfo info in objects)
                {

                    if (info.Flags.NeverBlocked)
                    {
                        mPlayerMap[X, Y] = false;
                    }

                    if (info.Flags.CanSit)
                    {
                        user.HeadDirection = info.PosRotation;
                        user.BodyDirection = info.PosRotation;
                        user.CurrentZ = info.PosZ;
                        if (!user.SpecialStates.ContainsKey("sit"))
                        {
                            user.SpecialStates.Add("sit", new RoomUser.RoomUserStatus("sit", false, info.ActionHeight.ToString().Replace(',', '.'), 0, 0, 0, null, true));
                        }
                        mRoomInstance.RemoveUniqueStatuses(user.SessionID, "carryd");
                    }
                    else if (info.Flags.CanLay)
                    {
                        user.CurrentZ = info.PosZ;
                        user.HeadDirection = info.PosRotation;
                        user.BodyDirection = info.PosRotation;
                        if (isRoller) user.CurrentZ = mHeightMap[user.CurrentX, user.CurrentY];
                        if (!user.SpecialStates.ContainsKey("lay"))
                        {
                            user.SpecialStates.Add("lay", new RoomUser.RoomUserStatus("lay", false, info.ActionHeight.ToString().Replace(',', '.'), 0, 0, 0, "", true));
                        }
                        mRoomInstance.RemoveUniqueStatuses(user.SessionID, "");
                    }
                    else if (info.Flags.PoolChange)
                    {
                        user.UserLocked = true;

                        ClientMessage message = new ClientMessage();
                        message.Init(96); //A`
                        mRoomInstance.SendMessage(message, user.SessionID);

                        message.Init(71); //AG
                        message.appendString(info.FurniVar);
                        message.appendString(" ");
                        message.appendString("close");
                        mRoomInstance.RoomBroadcast(message);

                        //Block the curtain position
                        int tmpX = int.Parse(info.WallLocation.Split(',')[0]);
                        int tmpY = int.Parse(info.WallLocation.Split(',')[1]);
                        mPlayerMap[tmpX, tmpY] = true;
                    }
                    else if (info.Flags.PoolEnter)
                    {
                        if (user.UserInfo.sPoolFigure != "")
                        {
                            mRoomInstance.RemoveUniqueStatuses(user.SessionID, "");
                            int tmpX = int.Parse(info.WallLocation.Split(',')[0]);
                            int tmpY = int.Parse(info.WallLocation.Split(',')[1]);
                            user.CurrentX = tmpX;
                            user.CurrentY = tmpY;
                            user.CurrentZ = mHeightMap[tmpX, tmpY];
                            user.IsMoving = false;
                            if (!user.SpecialStates.ContainsKey("swim"))
                            {
                                user.SpecialStates.Add("swim", new RoomUser.RoomUserStatus("swim", true, "", 0, 0, 0, null, true));
                            }

                            ClientMessage message = new ClientMessage();
                            message.Init(71); //AG
                            message.appendString(info.FurniVar);
                            message.appendString(" ");
                            message.appendString("enter");
                            mRoomInstance.RoomBroadcast(message);
                            
                            mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                            
                        }
                    }
                    else if (info.Flags.PoolExit)
                    {
                        mRoomInstance.RemoveUniqueStatuses(user.SessionID, "");
                        int tmpX = int.Parse(info.WallLocation.Split(',')[0]);
                        int tmpY = int.Parse(info.WallLocation.Split(',')[1]);
                        user.CurrentX = tmpX;
                        user.CurrentY = tmpY;
                        user.CurrentZ = mHeightMap[tmpX, tmpY];
                        user.IsMoving = false;

                        ClientMessage message = new ClientMessage();
                        message.Init(71); //AG
                        message.appendString(info.FurniVar);
                        message.appendString(" ");
                        message.appendString("exit");
                        mRoomInstance.RoomBroadcast(message);

                        mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                    }

                    
                }
            }
            else
            {
                mRoomInstance.RemoveUniqueStatuses(user.SessionID, "carryd,dance,swim");
            }
        }

        public void RemoveTileStatus(RoomUser user, int X, int Y)
        {
            mRoomInstance.RemoveUniqueStatus(user.SessionID, "sit");
            mRoomInstance.RemoveUniqueStatus(user.SessionID, "lay");

            List<FurniInfo> objects = GetFurniObjects(X, Y);
            if (objects != null)
            {
                foreach (FurniInfo info in objects)
                {
                    if (info.Flags.PoolChange)
                    {
                        ClientMessage message = new ClientMessage();
                        message.Init(71); //AG
                        message.appendString(info.FurniVar);
                        message.appendString(" ");
                        message.appendString("open");
                        mRoomInstance.RoomBroadcast(message);

                        //Unblock the curtain position
                        int tmpX = int.Parse(info.WallLocation.Split(',')[0]);
                        int tmpY = int.Parse(info.WallLocation.Split(',')[1]);
                        mPlayerMap[tmpX, tmpY] = false;


                    }

                    if (info.Flags.CanSit || info.Flags.CanLay)
                    {
                        user.CurrentZ = mHeightMap[info.PosX, info.PosY];
                    }
                }

            }
        }

        private List<PathFinderNode> CalculatePath(int StartX, int StartY, int EndX, int EndY, byte[,] Matrix)
        {
            PathFinder pathFinder = new PathFinder(Matrix);
            pathFinder.Heightmap = mHeightMap;
            pathFinder.MaxAscend = mRoomInstance.RoomInfo.MaxAscend;
            pathFinder.MaxDescend = mRoomInstance.RoomInfo.MaxDescend;
            Point Start = new Point(StartX, StartY);
            Point End = new Point(EndX, EndY);
            List<PathFinderNode> result = pathFinder.FindPath(Start, End);

            if (result != null)
            {
                //This is the current tile, we don't need this
                result.Remove(result[0]);
            }

            return result;
        }
    }
}
