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

using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Rooms;
using ThorServer.Game.Furni;

namespace ThorServer.Game.Rooms.Reactors
{
    public class FlatReactor : RoomCommonReactor
    {
        //28 - "GETDOORFLAT": "@\"
        public void Listener28()
        {
            int itemId = 0;

            if (int.TryParse(mPacketBody, out itemId))
            {
                mRoomInstance.Interactor.TeleporterActivate(itemId, mRoomInstance.GetUser(mSessionID));
            }
        }

        //66 - "FLATPROPBYITEM": "AB"
        public void Listener66()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasRights || rUser.HasAdmin)
            {
                int itemId = int.Parse(mPacketBody.Split('/')[1]);
                string decorationType = mPacketBody.Split('/')[0];

                if (decorationType != "wallpaper" && decorationType != "floor")
                    return;

                mRoomInstance.Interactor.RequestDecorateRoom(itemId, rUser.UserInfo.userId);
                InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
            }
        }

        //67 - "ADDSTRIPITEM": "AC"
        public void Listener67()
        {
            string[] part = mPacketBody.Split(" ".ToCharArray());

            if (part[0] == "new")
            {
                RoomUser rUser = mRoomInstance.GetUser(mSessionID);
                int furniId = int.Parse(part[2]);
                if (rUser.HasAdmin)
                {
                    if (part[1] == "stuff")
                    {
                        mRoomInstance.Interactor.RequestPickupFloorStuff(furniId, mUserInfo.userId);
                        InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
                    }
                    else if (part[1] == "item")
                    {
                        mRoomInstance.Interactor.RequestPickupWallItem(furniId, mUserInfo.userId);
                        InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
                    }
                }
            }
        }


        //73 - "MOVESTUFF": "AI"
        public void Listener73()
        {
            string[] data = mPacketBody.Split(" ".ToCharArray());

            int id = int.Parse(data[0]);
            int x = int.Parse(data[1]);
            int y = int.Parse(data[2]);
            int rot = int.Parse(data[3]);

            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasRights || rUser.HasAdmin)
            {
                mRoomInstance.Interactor.RequestMoveFloorItem(id, x, y, rot, false, mSessionID);
            }
            else
            {
                mRoomInstance.Interactor.SendFurniMovement(false, false, id, mSessionID);
            }
        }

        //74 - "SETSTUFFDATA": "AJ"
        public void Listener74()
        {
            string sItemId = FuseMessage.getArgument(1, mPacketBody);
            string sData = SpecialFiltering.FilterChars("2,9,13,47", FuseMessage.getArgument(2, mPacketBody));
            int itemId;

            if (int.TryParse(sItemId, out itemId))
            {
                mRoomInstance.Interactor.RequestSetStuffDataFloorItem(itemId, sData, mRoomInstance.GetUser(mSessionID), 0);
            }
        }

        //76 - "THROW_DICE": "AL"
        public void Listener76()
        {
            int itemId = 0;
            if (int.TryParse(mPacketBody, out itemId))
            {
                mRoomInstance.Interactor.RequestSetStuffDataFloorItem(itemId, "dice_roll", mRoomInstance.GetUser(mSessionID), 0);
            }
        }

        //77 - "DICE_OFF": "AM"
        public void Listener77()
        {
            int itemId = 0;
            if (int.TryParse(mPacketBody, out itemId))
            {
                mRoomInstance.Interactor.RequestSetStuffDataFloorItem(itemId, "dice_off", mRoomInstance.GetUser(mSessionID), 0);
            }
        }

        //78 - "PRESENTOPEN": "AN"
        public void Listener78()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            int furniId = int.Parse(mPacketBody);
            if (rUser.HasAdmin)
            {
                mRoomInstance.Interactor.RequestOpenPresent(mUserInfo.userId, furniId, mUserInfo, mSessionID);
                InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");

            }
        }

        //80 - "CARRYDRINK": "AP"
        public void Listener80()
        {
            int drinkId;

            if (int.TryParse(mPacketBody, out drinkId))
            {
                mRoomInstance.RemoveUniqueStatuses(mSessionID, "wave");
                ApplyUniqueStatus("carryd", 120, drinkId.ToString(), true, 13, 1, "drink");
            }
        }

        //81 - "INTODOOR": "AQ"
        public void Listener81()
        {
            int itemId = 0;

            if (int.TryParse(mPacketBody, out itemId))
            {
                mRoomInstance.Interactor.TeleporterGoIn(itemId, mRoomInstance.GetUser(mSessionID));
            }
        }

        //83 - "G_IDATA": "AS"
        public void Listener83()
        {
            int itemId = 0;

            if (int.TryParse(mPacketBody, out itemId))
            {
                if (InstanceManager.Game.Furni.FurniExists(itemId))
                {
                    FurniInfo info = InstanceManager.Game.Furni.GetFurni(itemId);

                    mMessage.Init(48); //@p
                    mMessage.appendInt(itemId);
                    mMessage.appendChar(9);
                    mMessage.appendString(info.Col);
                    mMessage.appendString(" ");
                    mMessage.appendString(info.FurniVar);
                    SendMessage(mMessage);
                }
            }
        }

        //84 - "SETITEMDATA": "AT"
        public void Listener84()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasRights || rUser.HasAdmin)
            {
                int itemId = 0;
                if (int.TryParse(mPacketBody.Substring(0, mPacketBody.IndexOf("/")), out itemId))
                {
                    string colour = mPacketBody.Substring(itemId.ToString().Length + 1, 6);
                    int stickieType = InstanceManager.Game.Furni.GetStickyType(colour);
                    string message = mPacketBody.Substring(itemId.ToString().Length + 7);
                    mRoomInstance.Interactor.RequestChangeStickyData(itemId, message, stickieType, mSessionID);
                }
            }
        }

        //85 - "REMOVEITEM": "AU"
        public void Listener85()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasAdmin)
            {
                int itemId = 0;
                if (int.TryParse(mPacketBody, out itemId))
                {
                    mRoomInstance.Interactor.RequestDeleteSticky(itemId, mUserInfo.userId, mSessionID);

                }
            }
        }

        //90 - "PLACESTUFF": "AZ"
        public void Listener90()
        {
            int itemID = int.Parse(mPacketBody.Split(' ')[0]);

            FurniInfo info = InstanceManager.Game.Furni.GetFurni(itemID);

            if (info.Flags.Decoration) return;

            if (info.Flags.WallItem) //Wall item
            {
                string newPos = mPacketBody.Substring(itemID.ToString().Length + 1);

                RoomUser rUser = mRoomInstance.GetUser(mSessionID);
                if (rUser.HasRights || rUser.HasAdmin)
                {
                    mRoomInstance.Interactor.RequestWallMoveItem(itemID, newPos, mSessionID);
                    InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
                }

            }
            else // Floor Item
            {
                string[] data = mPacketBody.Split(' ');

                int x = int.Parse(data[1]);
                int y = int.Parse(data[2]);
                int rot = 0;

                RoomUser rUser = mRoomInstance.GetUser(mSessionID);
                if (rUser.HasRights || rUser.HasAdmin)
                {
                    mRoomInstance.Interactor.RequestMoveFloorItem(itemID, x, y, rot, true, mSessionID);
                    InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
                }

            }
        }



        //96 - "ASSIGNRIGHTS": "A`"
        public void Listener96()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasAdmin)
            {
                RoomUser target = mRoomInstance.GetUser(mPacketBody);

                InstanceManager.Game.Rooms.AddRights(mRoomInstance.RoomInfo.RoomID, target.UserInfo.userId);
                mRoomInstance.CalculateRights(ref target, target.SessionID);
            }
        }

        //97 - "REMOVERIGHTS": "Aa"
        public void Listener97()
        {
            RoomUser rUser = mRoomInstance.GetUser(mSessionID);
            if (rUser.HasAdmin)
            {
                RoomUser target = mRoomInstance.GetUser(mPacketBody);
                InstanceManager.Game.Rooms.DeleteRights(mRoomInstance.RoomInfo.RoomID, target.UserInfo.userId);
                mRoomInstance.CalculateRights(ref target, target.SessionID);
            }
        }

        //98 - "LETUSERIN": "Ab"
        public void Listener98()
        {
            if (mRoomInstance.GetUser(mSessionID).HasRights || mRoomInstance.GetUser(mSessionID).HasAdmin)
            {
                string userName = FuseMessage.getArgument(1, mPacketBody);
                string letIn = mPacketBody.Substring(mPacketBody.Length - 1);
                Session.SessionHandler session = InstanceManager.Sessions.GetSession(InstanceManager.Sessions.GetSessionFromUser(userName));
                if (session.waitingFlat == mRoomInstance.RoomInfo.RoomID)
                {
                    session.waitingFlat = 0;
                    if (Base64Encoding.DecodeInt(letIn) == 0)
                    {
                        mMessage.Init(131); //BC
                    }
                    else
                    {
                        session.authenticatedFlat = mRoomInstance.RoomInfo.RoomID;
                        mMessage.Init(41); // @i 
                    }
                    session.SendMessage(mMessage);
                }
            }
        }
    }
}
