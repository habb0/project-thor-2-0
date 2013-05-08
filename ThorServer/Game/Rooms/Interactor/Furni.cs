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
        private bool mHasRollers = false;
        private const float MaxStackHeight = 3.3f;

        public void RequestDecorateRoom(int itemId, int userId)
        {
            if (InstanceManager.Game.Furni.FurniExists(itemId))
            {
                FurniInfo info = InstanceManager.Game.Furni.GetFurni(itemId);

                if (info.Flags.Decoration && info.OwnerID == userId)
                {

                    if (info.FurniSprite == "wallpaper")
                    {
                        mRoomInstance.RoomInfo.Wallpaper = int.Parse(info.FurniVar);
                    }
                    else if (info.FurniSprite == "floor")
                    {
                        mRoomInstance.RoomInfo.Floor = int.Parse(info.FurniVar);
                    }

                    InstanceManager.Game.Rooms.UpdateRoom(mRoomInstance.RoomInfo);


                    ClientMessage mMessage = new ClientMessage();
                    mMessage.Init(46); //@n
                    mMessage.appendString(info.FurniSprite);
                    mMessage.appendString("/");
                    mMessage.appendString(info.FurniVar);
                    mRoomInstance.RoomBroadcast(mMessage);

                    InstanceManager.Game.Furni.DeleteFurni(info.FurniID);

                }

            }


        }
        public void RequestPickupFloorStuff(int itemId, int userId)
        {
            if (ContainsItem(itemId))
            {
                FurniInfo furni = GetFurniObject(itemId);

                if (furni != null)
                {
                    if (!furni.Flags.WallItem)
                    {
                        InstanceManager.Game.Furni.PickupItem(itemId, userId);

                        mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(mRoomInstance.RoomInfo.RoomID);

                        ClientMessage mMessage = new ClientMessage();
                        mMessage.Init(94); // A^
                        mMessage.appendInt(itemId);
                        mRoomInstance.RoomBroadcast(mMessage);

                        GenerateMaps();

                        mMessage.Init(31); //@_
                        mMessage.appendString(ClientMap);
                        mRoomInstance.RoomBroadcast(mMessage);


                        // Remove statuses on users effected by this item
                        UpdateChangedUsers(furni.PosX, furni.PosY);

                        Dictionary<int, AffectedTile> affectedTiles = GetAffectedTiles(furni);

                        foreach (AffectedTile affectedTile in affectedTiles.Values)
                        {
                            UpdateChangedUsers(affectedTile.X, affectedTile.Y);
                        }
                    }
                }
            }
        }

        public void RequestPickupWallItem(int itemId, int userId)
        {
            if (ContainsItem(itemId))
            {
                FurniInfo info = GetFurniObject(itemId);
                if (info != null)
                {
                    if (info.Flags.WallItem)
                    {
                        if (!info.Flags.StickyNote) //Can't pick up stickies
                        {
                            InstanceManager.Game.Furni.PickupItem(itemId, userId);
                            mWallFurni = InstanceManager.Game.Furni.GetRoomWallFurni(mRoomInstance.RoomInfo.RoomID);

                            ClientMessage mMessage = new ClientMessage();
                            mMessage.Init(84); // AT
                            mMessage.appendInt(itemId);
                            mRoomInstance.RoomBroadcast(mMessage);
                        }
                    }
                }
            }
        }

        public void RequestDeleteSticky(int itemId, int userId, long sessionId)
        {
            if (ContainsItem(itemId))
            {
                FurniInfo info = GetFurniObject(itemId);

                if (info.Flags.StickyNote)
                {
                    InstanceManager.Game.Furni.DeleteFurni(itemId);
                    mWallFurni = InstanceManager.Game.Furni.GetRoomWallFurni(mRoomInstance.RoomInfo.RoomID);

                    ClientMessage mMessage = new ClientMessage();
                    mMessage.Init(84); // AT
                    mMessage.appendInt(itemId);
                    mRoomInstance.RoomBroadcast(mMessage);

                }
                else
                {
                    RequestPickupWallItem(itemId, userId);
                    InstanceManager.Sessions.InvokeReactorMethod(sessionId, "UpdateHandInvoker");
                }
            }
        }

        public void RequestChangeStickyData(int itemId, string newMessage, int newItemType, long sessionId)
        {
            if (ContainsItem(itemId))
            {
                FurniInfo info = GetFurniObject(itemId);

                if (info != null)
                {
                    if (info.Flags.StickyNote)
                    {
                        if (newItemType > 0) InstanceManager.Game.Furni.SetItemType(itemId, newItemType);

                        if (newMessage.Length > 685) newMessage = newMessage.Substring(0, 685);
                        newMessage = SpecialFiltering.FilterChars("2,9,47", newMessage);

                        InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, newMessage);

                        mWallFurni = InstanceManager.Game.Furni.GetRoomWallFurni(mRoomInstance.RoomInfo.RoomID);
                        info = GetFurniObject(itemId);

                        ClientMessage message = new ClientMessage();
                        message.Init(85); //AU
                        message.appendInt(itemId);
                        message.appendChar(9);
                        message.appendString(info.FurniSprite);
                        message.appendChar(9);
                        message.appendString(" ");
                        message.appendString(info.WallLocation);
                        message.appendChar(9);
                        message.appendString(info.Col);
                        mRoomInstance.RoomBroadcast(message);
                    }
                }
            }
        }

        public void RequestWallMoveItem(int itemId, string newPos, long sessionId)
        {
            FurniInfo info = InstanceManager.Game.Furni.GetFurni(itemId);
            if (info.OwnerID == mRoomInstance.GetUser(sessionId).UserInfo.userId)
            {
                if (info.Flags.StickyNote)
                {
                    int left = int.Parse(info.FurniVar);

                    if (left > 0)
                    {
                        int newFurni = InstanceManager.Game.Furni.CreateNewFurni(info.FurniTypeId, mRoomInstance.GetUser(sessionId).UserInfo.userId);
                        left--;

                        if (left == 0)
                        {
                            InstanceManager.Game.Furni.DeleteFurni(itemId);
                        }
                        else
                        {
                            InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, left.ToString());
                        }

                        itemId = newFurni;

                    }
                    else
                    {
                        InstanceManager.Game.Furni.DeleteFurni(itemId);
                    }
                }
                newPos = WallPositionCheck(newPos);
                if (newPos != null)
                {
                    InstanceManager.Game.Furni.MoveWallItem(itemId, newPos, mRoomInstance.RoomInfo.RoomID, mRoomInstance.RoomInfo.RoomOwner);
                    mWallFurni = InstanceManager.Game.Furni.GetRoomWallFurni(mRoomInstance.RoomInfo.RoomID);
                    FurniInfo newInfo = GetFurniObject(itemId);

                    ClientMessage mMessage = new ClientMessage();
                    mMessage.Init(83); //AS
                    mMessage.appendString(ProcessWallFurniDefinition(newInfo));
                    mRoomInstance.RoomBroadcast(mMessage);
                }

            }
        }

        //This function is based on the one from "Holograph Emulator"
        public string WallPositionCheck(string wallPosition)
        {
            //:w=3,2 l=9,63 l
            try
            {
                if (wallPosition.Contains(Convert.ToChar(13))) return null;
                if (wallPosition.Contains(Convert.ToChar(9))) return null;

                string[] posD = wallPosition.Split(' ');
                if (posD[2] != "l" && posD[2] != "r")
                    return null;

                string[] widD = posD[0].Substring(3).Split(',');
                int widthX = int.Parse(widD[0]);
                int widthY = int.Parse(widD[1]);
                if (widthX < 0 || widthY < 0 || widthX > 200 || widthY > 200)
                    return null;

                string[] lenD = posD[1].Substring(2).Split(',');
                int lengthX = int.Parse(lenD[0]);
                int lengthY = int.Parse(lenD[1]);
                if (lengthX < 0 || lengthY < 0 || lengthX > 200 || lengthY > 200)
                    return null;

                return ":w=" + widthX + "," + widthY + " " + "l=" + lengthX + "," + lengthY + " " + posD[2];
            }
            catch
            {
                return null;
            }
        }


        public void RequestMoveFloorItem(int itemId, int newX, int newY, int newRot, bool firstTime, long sessionId)
        {
            FurniInfo item = GetFurniObject(itemId);
            mFloorFurni.Remove(item);
            bool result = ExecuteFloorMoveItem(item, itemId, newX, newY, newRot, firstTime, sessionId);
            if (!result)
            {
                mFloorFurni.Add(item);
            }

            SendFurniMovement(firstTime, !result, itemId, sessionId);


        }

        private bool ExecuteFloorMoveItem(FurniInfo item, int itemId, int newX, int newY, int newRot, bool firstTime, long sessionId)
        {
            int furniCount = 0;
            int rollerCount = 0;

            //Work out new affectedTiles
            Dictionary<int, AffectedTile> affectedTiles = GetAffectedTiles(item.L, item.W, newX, newY, newRot);

            //Verify the new tiles exist
            if (!ValidTile(item.PosX, item.PosY)) return false;
            foreach (AffectedTile tile in affectedTiles.Values) { if (!ValidTile(tile.X, tile.Y)) return false; }

            //Verify the user has rights, or owns the item if they are dropping it
            if (firstTime && item.OwnerID != mRoomInstance.GetUser(sessionId).UserInfo.userId) return false;
            if (!firstTime && item.RoomID != mRoomInstance.RoomInfo.RoomID) return false;

            //Verify if it's the first time and not the users room, the item is tradeable
            if (firstTime && mRoomInstance.RoomInfo.RoomOwner != mRoomInstance.GetUser(sessionId).UserInfo.userId && item.CanTrade == false) return false;

            //Calculate the new height according to the heightmap
            float newZ = mHeightMap[newX, newY];

            //Is the item trying to stack on itself?
            if (item.PosRotation == newRot && item.PosX == newX && item.PosY == newY && item.PosZ != newZ) return false;

            //Check it's not a bad heightmap tile
            if (mClientMap[newX, newY] == "x") return false;
            foreach (AffectedTile tile in affectedTiles.Values) { if (mClientMap[tile.X, tile.Y] == "x") return false; }

            //Check for players
            if (mPlayerMap[newX, newY] && !(item.PosRotation != newRot && item.PosX == newX && item.PosY == newY)) return false;
            foreach (AffectedTile tile in affectedTiles.Values) { if (mPlayerMap[tile.X, tile.Y]) return false; }

            //Get the furniture counts (not including this item)
            foreach (FurniInfo tmp in mFloorFurni) { furniCount++; if (tmp.Flags.IsRoller) rollerCount++; }

            //Get the affected objects
            List<FurniInfo> objectsOnTile = GetFurniObjects(newX, newY);
            List<FurniInfo> objectsAffected = new List<FurniInfo>();
            List<FurniInfo> objectsComplete = new List<FurniInfo>();
            foreach (AffectedTile tile in affectedTiles.Values)
            {
                List<FurniInfo> objectsTmp = GetFurniObjects(tile.X, tile.Y);
                if (objectsTmp != null)
                {
                    objectsAffected.AddRange(objectsTmp);
                }
            }

            //Check the item isn't a roller and furni exists
            if (objectsComplete.Count > 0 && item.Flags.IsRoller) return false;

            if (objectsOnTile == null) objectsOnTile = new List<FurniInfo>();
            objectsComplete.AddRange(objectsOnTile);

            if (objectsAffected == null) objectsAffected = new List<FurniInfo>();
            objectsComplete.AddRange(objectsAffected);

            //Check you can stack the item
            if (objectsComplete.Count > 0 && !item.Flags.CanStack) return false;

            //Check for nonstackable items and rollers
            foreach (FurniInfo info in objectsComplete)
            {
                if (!info.Flags.CanStackOn || (info.Flags.IsRoller && (item.W > 1 || item.L > 1))) return false;
            }

            //Rotating the item, should remain at the same height for now
            if (item.PosRotation != newRot && item.PosX == newX && item.PosY == newY) newZ = item.PosZ;

            //Are any of the other tiles higher?
            foreach (FurniInfo info in objectsAffected)
            {
                if (info.TotalHeight > newZ) newZ = info.TotalHeight;
            }

            //Impose stacking limit
            if (newZ > MaxStackHeight)
            {
                newZ = MaxStackHeight;
            }

            //Impose furni limit
            if (furniCount >= 125 && firstTime)
            {

                ClientMessage mMessage = new ClientMessage();
                mMessage.Init(139); //BK
                mMessage.appendString(InstanceManager.Game.Externals.GetTextValue("room_alert_furni_limit"));
                mRoomInstance.SendMessage(mMessage, sessionId);
                return false;
            }

            //Impose roller limit
            if (item.Flags.IsRoller)
            {
                if (rollerCount >= 10 && firstTime)
                {
                    ClientMessage mMessage = new ClientMessage();
                    mMessage.Init(139); //BK
                    mMessage.appendString(InstanceManager.Game.Externals.GetTextValue("queue_tile_limit"));
                    mRoomInstance.SendMessage(mMessage, sessionId);
                    return false;
                }
            }

            //Ensure it's a valid rotation
            if (newRot != 0 && newRot != 2 && newRot != 4 && newRot != 6 && newRot != 8) newRot = 0;

            //Move the item
            int oldX = item.PosX; int oldY = item.PosY;
            affectedTiles = GetAffectedTiles(item);
            InstanceManager.Game.Furni.MoveFloorItem(itemId, newX, newY, newZ, newRot, mRoomInstance.RoomInfo);
            mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(mRoomInstance.RoomInfo.RoomID);
            GenerateMaps();

            // Remove statuses on users affected by this item
            UpdateChangedUsers(oldX, oldY);
            foreach (AffectedTile affectedTile in affectedTiles.Values)
            {
                UpdateChangedUsers(affectedTile.X, affectedTile.Y);
            }

            return true;


        }

        public void SendFurniMovement(bool firstTime, bool badTile, int itemId, long sessionId)
        {
            FurniInfo newInfo = GetFurniObject(itemId);
            string data = ProcessFloorFurniDefinition(newInfo);

            ClientMessage mMessage = new ClientMessage();
            if (firstTime)
            {
                mMessage.Init(93); // A]
            }
            else
            {
                mMessage.Init(95); // A_
            }

            mMessage.appendString(data);

            if (!badTile)
            {
                mRoomInstance.RoomBroadcast(mMessage);

                GenerateMaps();

                mMessage.Init(31); //@_
                mMessage.appendString(ClientMap);
                mRoomInstance.RoomBroadcast(mMessage);
            }
            else
            {
                if(!firstTime)  mRoomInstance.SendMessage(mMessage, sessionId);
            }
        }

        public void TeleporterGoIn(int itemId, RoomUser user)
        {
            FurniInfo item = GetFurniObject(itemId);

            if (item != null)
            {
                if (item.Flags.IsTeleport)
                {
                    if (TilesTouching(item.PosX, item.PosY, user.CurrentX, user.CurrentY) && PlayerCheck(item.PosX, item.PosY) == false)
                    {
                        user.IsMoving = true;
                        user.TargetX = item.PosX;
                        user.TargetY = item.PosY;
                        user.AllowOveride = true;
                        user.Path.Clear();
                        PathFinderNode node = new PathFinderNode();
                        node.X = item.PosX;
                        node.Y = item.PosY;
                        user.Path.Add(node);
                    }
                }
            }
        }

        public void TeleporterActivate(int itemId, RoomUser user)
        {
            FurniInfo item = GetFurniObject(itemId);

            if (item != null)
            {
                new ProcessTeleporterDelegate(ProcessTeleporter).BeginInvoke(item, user, null, null);
            }
        }

        private delegate void ProcessTeleporterDelegate(FurniInfo info, RoomUser user);


        private void ProcessTeleporter(FurniInfo Teleporter1, RoomUser user)
        {
            FurniInfo Teleporter2 = null;

            Point invalidPoint = new Point(Teleporter1.PosX, Teleporter1.PosY);

            if (Teleporter1.PosRotation == 0 || Teleporter1.PosRotation == 2) invalidPoint.X++;
            if (Teleporter1.PosRotation == 4) invalidPoint.Y++;

            if (InstanceManager.Game.Furni.FurniExists(Teleporter1.TeleportId))
            {
                Teleporter2 = InstanceManager.Game.Furni.GetFurni(Teleporter1.TeleportId);
            }

            if (!user.UserLocked)
            {

                user.UserLocked = true;
                Thread.Sleep(1000);

                if (Teleporter1.PosX == user.CurrentX && Teleporter1.PosY == user.CurrentY)
                {

                    ClientMessage message = new ClientMessage();

                    if (Teleporter2 != null && Teleporter2.RoomID > 0 && Teleporter1.Flags.IsTeleport && Teleporter2.Flags.IsTeleport)
                    {
                        message.Init(89); //AY
                        message.appendInt(Teleporter1.FurniID);
                        message.appendString("/");
                        message.appendString(user.UserInfo.sUsername);
                        message.appendString("/");
                        message.appendString(Teleporter1.FurniSprite);
                        mRoomInstance.RoomBroadcast(message);

                        if (Teleporter2.RoomID == Teleporter1.RoomID) //Same room
                        {
                            Thread.Sleep(2000);
                            Teleporter2 = InstanceManager.Game.Furni.GetFurni(Teleporter1.TeleportId);
                            Teleporter1 = InstanceManager.Game.Furni.GetFurni(Teleporter1.FurniID);
                            if (Teleporter2.RoomID == Teleporter1.RoomID && Teleporter1.PosX == user.CurrentX && Teleporter1.PosY == user.CurrentY)
                            {
                                message.Init(92); //A\
                                message.appendInt(Teleporter2.FurniID);
                                message.appendString("/");
                                message.appendString(user.UserInfo.sUsername);
                                message.appendString("/");
                                message.appendString(Teleporter2.FurniSprite);
                                mRoomInstance.RoomBroadcast(message);
                                mPlayerMap[user.CurrentX, user.CurrentY] = false;
                                user.CurrentX = Teleporter2.PosX;
                                user.CurrentY = Teleporter2.PosY;
                                user.CurrentZ = Teleporter2.PosZ;
                                mRoomInstance.AnnounceUserStatus(user.SessionID, true);
                                mPlayerMap[user.CurrentX, user.CurrentY] = true;
                                user.UserLocked = false;
                            }
                            else
                            {
                                if (Teleporter1.PosX == user.CurrentX && Teleporter1.PosY == user.CurrentY)
                                {
                                    RequestSetStuffDataFloorItem(Teleporter1.FurniID, "TRUE", user, FurniInfo.VarTypes.TempOpen);
                                    RequestMovePlayer(user.SessionID, invalidPoint.X, invalidPoint.Y, null, true);
                                }
                                user.UserLocked = false;
                            }
                        }
                        else //In another room
                        {

                            InstanceManager.Sessions.GetSession(user.SessionID).authenticatedDoor = Teleporter2.FurniID;
                            InstanceManager.Sessions.GetSession(user.SessionID).authenticatedFlat = Teleporter2.RoomID;

                            message.Init(62); //@~
                            message.appendArgumentInt(Teleporter2.FurniID);
                            message.appendArgumentInt(Teleporter2.RoomID);
                            mRoomInstance.SendMessage(message, user.SessionID);
                        }

                    }
                    else //No linked teleporter exists
                    {
                        Thread.Sleep(700);
                        RequestSetStuffDataFloorItem(Teleporter1.FurniID, "TRUE", user, FurniInfo.VarTypes.TempOpen);
                        RequestMovePlayer(user.SessionID, invalidPoint.X, invalidPoint.Y, null, true);
                        user.UserLocked = false;
                    }


                }
            }
        }


        public void RequestSetStuffDataFloorItem(int itemId, string data, RoomUser user, FurniInfo.VarTypes overrideType)
        {
            FurniInfo item = GetFurniObject(itemId);
            ClientMessage mMessage = new ClientMessage();

            if (item != null)
            {
                if (overrideType != 0) item.VarType = overrideType;

                switch (item.VarType)
                {
                    case FurniInfo.VarTypes.TempOpen:
                        if (TilesTouching(item.PosX, item.PosY, user.CurrentX, user.CurrentY))
                        {
                            InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, "FALSE");
                            if (data == "TRUE") NotifyClientSetStuffTempOpen(itemId);

                        }
                        break;

                    case FurniInfo.VarTypes.TrueFalse:
                        if (TilesTouching(item.PosX, item.PosY, user.CurrentX, user.CurrentY))
                        {
                            if ((data == "TRUE" || data == "FALSE"))
                            {
                                InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, data);
                                NotifyClientSetStuffChange(itemId, data);
                            }

                        }
                        break;

                    case FurniInfo.VarTypes.DoorDivider:
                        if (user.HasAdmin || user.HasRights)
                        {
                            if (data == "O" || data == "C")
                            {
                                if (!PlayerCheck(item.PosX, item.PosY))
                                {
                                    InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, data);
                                    NotifyClientSetStuffChange(itemId, data);
                                    mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(mRoomInstance.RoomInfo.RoomID);
                                    GenerateMaps();
                                }

                            }
                        }
                        break;

                    case FurniInfo.VarTypes.Dice:
                        if (TilesTouching(item.PosX, item.PosY, user.CurrentX, user.CurrentY))
                        {
                            if (data == "dice_roll" || data == "dice_off")
                            {
                                int newVal = 0;
                                if (data == "dice_roll") newVal = SpecialMath.RandomNumber(1, 6);
                                bool isRoll = newVal > 0;
                                int rollVal = (item.FurniID * 38) + newVal;
                                InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, newVal.ToString());
                                NotifyClientDiceRoll(item.FurniID, rollVal, isRoll);
                            }
                        }
                        break;

                    case FurniInfo.VarTypes.Bottle:
                        if (data == "dice_roll")
                        {
                            int newVal = SpecialMath.RandomNumber(0, 7);
                            bool isRoll = newVal > 0;
                            int rollVal = (item.FurniID * 38) + newVal;
                            InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, newVal.ToString());
                            NotifyClientDiceRoll(item.FurniID, rollVal, isRoll);
                        }
                        break;

                    case FurniInfo.VarTypes.OnOff:
                        if (data == "ON" || data == "OFF")
                        {
                            InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, data);
                            NotifyClientSetStuffChange(itemId, data);
                        }
                        break;

                    case FurniInfo.VarTypes.OpenOrClosed:
                        if (data == "O" || data == "C")
                        {
                            InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, data);
                            NotifyClientSetStuffChange(itemId, data);
                        }
                        break;

                    case FurniInfo.VarTypes.NumericalOff:
                        int tmpNum = -1;

                        if (int.TryParse(data, out tmpNum) || data == "OFF")
                        {
                            if (tmpNum >= -1 && tmpNum < 10 && !(tmpNum == -1 && data == "-1"))
                            {
                                InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, data);
                                NotifyClientSetStuffChange(itemId, data);
                            }
                        }
                        break;



                }


            }
        }

        public void RequestOpenPresent(int userId, int presentId, Users.UserInfo userInfo, long sessionId)
        {
            if (ContainsItem(presentId))
            {
                FurniInfo furni = GetFurniObject(presentId);

                if (furni != null)
                {
                    if (furni.Flags.Gift)
                    {

                        GiftInfo gift = InstanceManager.Game.Furni.GetGift(presentId);
                        int newId = 0;
                        InstanceManager.Game.Catalogue.BuyItem("0", gift.PurchaseCode, gift.Payload, ref userInfo, true, ref newId);
                        InstanceManager.Game.Furni.DeleteGift(presentId);

                        InstanceManager.Game.Furni.DeleteFurni(presentId);
                        mFloorFurni = InstanceManager.Game.Furni.GetRoomFloorFurni(mRoomInstance.RoomInfo.RoomID);
                        FurniInfo info = InstanceManager.Game.Furni.GetFurni(newId);

                        ClientMessage mMessage = new ClientMessage();
                        mMessage.Init(129); //BA
                        mMessage.appendString(info.FurniSprite);
                        mMessage.appendChar(13);
                        mMessage.appendString(info.FurniSprite);

                        if (info.Flags.WallItem)
                        {
                            mMessage.appendString(" ");
                            mMessage.appendString(info.Col);
                            mMessage.appendChar(13);
                        }
                        else
                        {
                            mMessage.appendChar(13);
                            mMessage.appendInt(info.L);

                            mMessage.appendChar(13);
                            mMessage.appendInt(info.W);

                            mMessage.appendChar(13);
                            mMessage.appendString(info.Col);
                        }

                        mRoomInstance.SendMessage(mMessage, sessionId);

                        mMessage.Init(94); // A^
                        mMessage.appendInt(presentId);
                        mRoomInstance.RoomBroadcast(mMessage);

                        GenerateMaps();

                        mMessage.Init(31); //@_
                        mMessage.appendString(ClientMap);
                        mRoomInstance.RoomBroadcast(mMessage);


                    }
                }
            }
        }

        private void NotifyClientSetStuffTempOpen(int itemId)
        {
            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(88); //AX
            mMessage.appendString(itemId.ToString());
            mMessage.appendChar(2);
            mMessage.appendString("TRUE");
            mMessage.appendChar(2);
            mRoomInstance.RoomBroadcast(mMessage);
            mMessage.Init(88); //AX
            mMessage.appendString(itemId.ToString());
            mMessage.appendChar(2);
            mMessage.appendString("FALSE");
            mMessage.appendChar(2);
            new RoomInstance.RoomDelayBroadcastDelegate(mRoomInstance.RoomDelayBroadcast).BeginInvoke(mMessage, 1000, null, null);

        }

        private void NotifyClientSetStuffChange(int itemId, string data)
        {
            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(88); //AX
            mMessage.appendString(itemId.ToString());
            mMessage.appendChar(2);
            mMessage.appendString(data);
            mMessage.appendChar(2);
            mRoomInstance.RoomBroadcast(mMessage);

        }

        private void NotifyClientDiceRoll(int itemId, int rollVal, bool isRoll)
        {
            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(90); //AZ
            mMessage.appendString(itemId.ToString());
            if (isRoll) mRoomInstance.RoomBroadcast(mMessage);
            mMessage.appendString(" ");
            mMessage.appendInt(rollVal);
            if (isRoll)
            {
                new RoomInstance.RoomDelayBroadcastDelegate(mRoomInstance.RoomDelayBroadcast).BeginInvoke(mMessage, 2000, null, null);
            }
            else
            {
                mRoomInstance.RoomBroadcast(mMessage);
            }

        }

        private FurniInfo GetFurniObject(int furniId)
        {
            foreach (FurniInfo info in mFloorFurni)
            {
                if (info.FurniID == furniId)
                {
                    return info;
                }
            }

            foreach (FurniInfo info in mWallFurni)
            {
                if (info.FurniID == furniId)
                {
                    return info;
                }
            }

            return InstanceManager.Game.Furni.GetFurni(furniId);
        }

        public bool ContainsItem(int furniId)
        {
            foreach (FurniInfo info in mFloorFurni)
            {
                if (info.FurniID == furniId)
                {
                    return true;
                }
            }

            foreach (FurniInfo info in mWallFurni)
            {
                if (info.FurniID == furniId)
                {
                    return true;
                }
            }

            return false;
        }


        public List<FurniInfo> GetFurniObjects(int x, int y)
        {
            List<FurniInfo> results = new List<FurniInfo>();
            foreach (FurniInfo info in mFloorFurni)
            {
                if (info.PosX == x && info.PosY == y)
                {
                    results.Add(info);
                }

                Dictionary<int, AffectedTile> pointList = GetAffectedTiles(info);

                foreach (AffectedTile point in pointList.Values)
                {
                    if (point.X == x && point.Y == y)
                    {
                        results.Add(info);
                    }
                }

            }

            if (results.Count > 0)
            {
                return results;
            }
            else
            {
                return null;
            }
        }

        private int FindTileOffset(FurniInfo info, int x, int y)
        {
            Dictionary<int, AffectedTile> pointList = GetAffectedTiles(info);

            foreach (int tileOffset in pointList.Keys)
            {
                if (pointList[tileOffset].X == x && pointList[tileOffset].Y == y)
                {
                    return pointList[tileOffset].I;
                }
            }
            return -1;
        }

        public string BuildFloorObjectList()
        {
            int furniCount = mFloorFurni.Count();
            StringBuilder sb = new StringBuilder();

            foreach (FurniInfo info in mFloorFurni)
            {
                if (info.PublicFurni && !info.Flags.InvisibleToClient)
                {
                    sb.Append(ProcessFloorObjectDefinition(info));
                }
            }

            return sb.ToString();
        }

        public string BuildFloorFurniList()
        {
            int furniCount = 0;
            StringBuilder sb = new StringBuilder();

            foreach (FurniInfo info in mFloorFurni)
            {
                if (!info.PublicFurni && !info.Flags.InvisibleToClient)
                {
                    furniCount++;
                    sb.Append(ProcessFloorFurniDefinition(info));
                }
            }

            return ArgumentEncoding.encodeInt(furniCount) + sb.ToString();
        }

        public string BuildWallFurniList()
        {
            StringBuilder sb = new StringBuilder();

            foreach (FurniInfo info in mWallFurni)
            {
                sb.Append(ProcessWallFurniDefinition(info));
                sb.Append(Convert.ToChar(13));
            }

            return sb.ToString();
        }

        private string ProcessFloorObjectDefinition(FurniInfo info)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(info.FurniID.ToString());
            sb.Append(" ");
            sb.Append(info.FurniSprite);
            sb.Append(" ");
            sb.Append(info.PosX);
            sb.Append(" ");
            sb.Append(info.PosY);
            sb.Append(" ");
            sb.Append(info.PosZ);
            sb.Append(" ");
            sb.Append(info.PosRotation);
            sb.Append(Convert.ToChar(13).ToString());
            return sb.ToString();
        }

        private string ProcessFloorFurniDefinition(FurniInfo info)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(info.FurniID);
            sb.Append(Convert.ToChar(2));
            sb.Append(info.FurniSprite);
            sb.Append(Convert.ToChar(2));
            sb.Append(ArgumentEncoding.encodeInt(info.PosX));
            sb.Append(ArgumentEncoding.encodeInt(info.PosY));
            sb.Append(ArgumentEncoding.encodeInt(info.W));
            sb.Append(ArgumentEncoding.encodeInt(info.L));
            sb.Append(ArgumentEncoding.encodeInt(info.PosRotation));
            sb.Append(info.PosZ.ToString().Replace(',', '.'));
            sb.Append(Convert.ToChar(2));
            sb.Append(info.Col);
            sb.Append(Convert.ToChar(2));
            sb.Append(Convert.ToChar(2));
            sb.Append(ArgumentEncoding.encodeInt(info.TeleportId));
            sb.Append(info.FurniVar);
            sb.Append(Convert.ToChar(2));
            return sb.ToString();
        }

        private string ProcessWallFurniDefinition(FurniInfo wallItem)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(wallItem.FurniID.ToString());
            sb.Append(Convert.ToChar(9));
            sb.Append(wallItem.FurniSprite);
            sb.Append(Convert.ToChar(9));
            sb.Append(" ");
            sb.Append(Convert.ToChar(9));
            sb.Append(wallItem.WallLocation);
            sb.Append(Convert.ToChar(9));
            sb.Append(wallItem.Col);

            return sb.ToString();
        }








        public class AffectedTile
        {
            int mX;
            int mY;
            int mI;

            public AffectedTile(int x, int y, int i)
            {
                mX = x;
                mY = y;
                mI = i;
            }

            public int X
            {
                get
                {
                    return mX;
                }
            }

            public int Y
            {
                get
                {
                    return mY;
                }
            }

            public int I
            {
                get
                {
                    return mI;
                }
            }
        }
    }
}
