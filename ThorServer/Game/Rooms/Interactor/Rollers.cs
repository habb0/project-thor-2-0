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

using ThorServer.Game.Furni;
using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Rooms;
using ThorServer.Game.Rooms.Pathfinding;

namespace ThorServer.Game.Rooms.Interactor
{
    public partial class RoomInteractor
    {
        private StringBuilder mRollerBroadcast = new StringBuilder();
        private double mRollerNext = DateTime.Now.TimeOfDay.TotalSeconds + 2;
        private int mRollerDay = DateTime.Now.DayOfYear;

        private void HandleRollerActions()
        {
            if (mHasRollers)
            {
                if (DateTime.Now.TimeOfDay.TotalSeconds > mRollerNext || mRollerDay != DateTime.Now.DayOfYear)
                {
                    try
                    {
                        List<int> excludeUsers = new List<int>();
                        List<int> excludeFurni = new List<int>();
                        foreach (FurniInfo roller in mFloorFurni)
                        {
                            //Is this a roller ?
                            if (roller.Flags.IsRoller)
                            {
                                float rollerOffset = roller.HeightOffset;

                                //Work out next tile
                                int nextX = roller.PosX;
                                int nextY = roller.PosY;
                                if (roller.PosRotation == 0) nextY--;
                                if (roller.PosRotation == 2) nextX++;
                                if (roller.PosRotation == 4) nextY++;
                                if (roller.PosRotation == 6) nextX--;
                                float nextZ = 0;

                                if (ValidTile(nextX, nextY))
                                {

                                    nextX = mRedirectMap[nextX, nextY].X;
                                    nextY = mRedirectMap[nextX, nextY].Y;

                                    //Get data on current tile
                                    RoomUser userCurrent = mRoomInstance.GetUser(roller.PosX, roller.PosY);
                                    List<FurniInfo> furniCurrent = GetFurniObjects(roller.PosX, roller.PosY);

                                    //Get data on next tile
                                    bool isBlockedNext = !TileCheck(nextX, nextY, mMatrix);
                                    List<FurniInfo> furniNext = GetFurniObjects(nextX, nextY);

                                    //Roller on next tile? Can a user sit there?
                                    bool isRollerOnNext = false;
                                    bool isSitOnNext = false;
                                    bool isFloormatOnNext = false;
                                    bool overrideDoormat = false;
                                    if (furniNext != null)
                                    {
                                        foreach (FurniInfo fInfo in furniNext)
                                        {
                                            if (fInfo.Flags.IsRoller) isRollerOnNext = true;
                                            if (fInfo.Flags.CanSit || fInfo.Flags.CanLay)
                                            {
                                                isSitOnNext = true;
                                            }

                                            if (fInfo.VarType == FurniInfo.VarTypes.DoorDivider)
                                            {
                                                isBlockedNext = true;
                                            }

                                            if (fInfo.Flags.Doormat)
                                            {
                                                isBlockedNext = true;
                                                isFloormatOnNext = true;
                                            }

                                            if (!fInfo.Flags.CanPath)
                                            {
                                                overrideDoormat = true;
                                            }

                                        }
                                    }

                                    //If the next tile is blocked, we can't do anything
                                    if (isFloormatOnNext) isFloormatOnNext = !overrideDoormat;
                                    bool notUserBlock = (isSitOnNext || isFloormatOnNext) && !isRollerOnNext && !PlayerCheck(nextX, nextY);
                                    if (isBlockedNext && !notUserBlock) continue;



                                    //Update furni
                                    if (furniCurrent != null && !isBlockedNext)
                                    {
                                        foreach (FurniInfo fInfo in furniCurrent)
                                        {
                                            if (!fInfo.Flags.IsRoller && !excludeFurni.Contains(fInfo.FurniID))
                                            {
                                                nextZ = fInfo.PosZ;
                                                if (!isRollerOnNext) nextZ -= rollerOffset;
                                                UpdateRollerFurni(fInfo, nextX, nextY, nextZ, !isRollerOnNext, roller.FurniID);
                                                mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(mRoomInstance.RoomInfo.RoomID);
                                                GenerateMaps();
                                                excludeFurni.Add(fInfo.FurniID);
                                            }
                                        }
                                    }

                                    //Update user
                                    if (userCurrent != null)
                                    {
                                        if (!userCurrent.IsMoving && !excludeUsers.Contains(userCurrent.RoomUserID))
                                        {
                                            nextZ = userCurrent.CurrentZ;
                                            if (!isRollerOnNext) nextZ -= rollerOffset;
                                            UpdateRollerUser(userCurrent, nextX, nextY, nextZ, !isRollerOnNext, roller.FurniID);
                                            excludeUsers.Add(userCurrent.RoomUserID);
                                        }
                                    }

                                }
                            }

                            mRoomInstance.RoomBroadcast(mRollerBroadcast.ToString());
                            mRollerBroadcast.Remove(0, mRollerBroadcast.Length);

                            mRollerNext = DateTime.Now.TimeOfDay.TotalSeconds + 2;
                            mRollerDay = DateTime.Now.DayOfYear;
                        }
                    }
                    catch (Exception e)
                    {
                        Logging.LogEvent("Roller Error! Disabling rollers in this room. Stack " + e.ToString(), Logging.LogLevel.Error);
                        mHasRollers = false;
                    }
                }
            }
        }

        private void UpdateRollerFurni(FurniInfo info, int nextX, int nextY, float nextZ, bool isLastRoller, int rollerId)
        {
            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(230); // Cf
            mMessage.appendArgumentInt(info.PosX);
            mMessage.appendArgumentInt(info.PosY);

            mMessage.appendArgumentInt(nextX);
            mMessage.appendArgumentInt(nextY);

            mMessage.appendArgumentInt(1);

            mMessage.appendArgumentInt(info.FurniID);

            mMessage.appendString(info.PosZ.ToString().Replace(',', '.'));
            mMessage.appendChar(2);
            mMessage.appendString(nextZ.ToString().Replace(',', '.'));
            mMessage.appendChar(2);

            mMessage.appendArgumentInt(rollerId);

            mRollerBroadcast.Append(mMessage.ToString());

            info.PosX = nextX;
            info.PosY = nextY;
            info.PosZ = nextZ;
            InstanceManager.Game.Furni.MoveFloorItem(info.FurniID, info.PosX, info.PosY, info.PosZ, info.PosRotation, mRoomInstance.RoomInfo);
        }

        private void UpdateRollerUser(RoomUser user, int newX, int newY, float newZ, bool isLastRoller, int rollerId)
        {
            user.NextX = newX;
            user.NextY = newY;
            user.NextZ = newZ;

            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(230); // Cf
            mMessage.appendArgumentInt(user.CurrentX);
            mMessage.appendArgumentInt(user.CurrentY);

            mMessage.appendArgumentInt(user.NextX);
            mMessage.appendArgumentInt(user.NextY);

            mMessage.appendArgumentInt(0);

            mMessage.appendArgumentInt(rollerId);

            mMessage.appendString("J");

            mMessage.appendArgumentInt(user.RoomUserID);

            mMessage.appendString(user.CurrentZ.ToString().Replace(',', '.'));
            mMessage.appendChar(2);
            mMessage.appendString(user.NextZ.ToString().Replace(',', '.'));
            mMessage.appendChar(2);

            mRollerBroadcast.Append(mMessage.ToString());

            mPlayerMap[user.CurrentX, user.CurrentY] = false;
            user.CurrentX = user.NextX;
            user.CurrentY = user.NextY;
            user.CurrentZ = user.NextZ;
            user.MustUpdate = true;
            mPlayerMap[user.CurrentX, user.CurrentY] = true;

            if (isLastRoller)
            {
                CalculateTileStatusForUser(user.CurrentX, user.CurrentY, user, true);
            }
        }
    }
}
