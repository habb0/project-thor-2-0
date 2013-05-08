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

namespace ThorServer.Game.Rooms
{
    public class RoomReactor : Reactor
    {
        //2 - "room_directory": "@B"
        public void Listener2()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            if (roomId != 0)
            {
                InstanceManager.Game.Rooms.GetRoomInstance(roomId).RemoveUser(mSessionID);
            }

            int requestType = Base64Encoding.DecodeInt(mPacketBody.Substring(0, 1));
            roomId = ArgumentEncoding.decodeInt(mPacketBody.Substring(1));

            mMessage.Init(19); //@S
            SendMessage(mMessage);

            if (requestType == 1) // Public
            {
                enterRoom(roomId, false);
            }


        }

        //16 - "SUSERF": "@P"
        public void Listener16()
        {
            string searchResult = InstanceManager.Game.Navigator.GetOwnRoomSearchResult(mUserInfo.userId);

            if (searchResult != null)
            {
                mMessage.Init(16); //@P
                mMessage.appendString(searchResult);

            }
            else
            {
                mMessage.Init(57); //@y
            }

            SendMessage(mMessage);
        }

        //17 - "SRCHF": "@Q"
        public void Listener17()
        {
            string searchResult = InstanceManager.Game.Navigator.GetRoomSearchResult(mPacketBody, mUserInfo.userId);

            if (searchResult != null)
            {
                mMessage.Init(55); //@w
                mMessage.appendString(searchResult);

            }
            else
            {
                mMessage.Init(58); //@z
            }

            SendMessage(mMessage);
        }

        //17 - "GETFVRF": "@R"
        public void Listener18()
        {
            string searchResult = InstanceManager.Game.Navigator.GetFavouriteSearchResult(mUserInfo.userId, mUserInfo.iRole);
            mMessage.Init(61); // @}
            mMessage.appendString(searchResult);
            SendMessage(mMessage);
        }

        //18 - "ADD_FAVORITE_ROOM": "@S"
        public void Listener19()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody.Substring(1));
            List<int> favRooms = InstanceManager.Game.Users.GetFavouriteRooms(mUserInfo.userId);
            if (favRooms.Count < int.Parse(Users.UserSettings.MaxFavouriteRooms))
            {
                if (!favRooms.Contains(roomId))
                {
                    InstanceManager.Game.Users.AddFavouriteRoom(mUserInfo.userId, roomId);
                }
            }
            else
            {
                ReportError("nav_error_toomanyfavrooms", false);
            }
        }

        //19 - "DEL_FAVORITE_ROOM": "@T"
        public void Listener20()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody.Substring(1));
            InstanceManager.Game.Users.DeleteFavouriteRoom(mUserInfo.userId, roomId);
        }

        //21 - "GETFLATINFO": "@U"
        public void Listener21()
        {

            int roomId = int.Parse(mPacketBody);

            RoomInstance roomInstance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
            RoomInfo roomInfo = roomInstance.RoomInfo;
            RoomCategory catInfo = InstanceManager.Game.Rooms.GetCategory(roomInfo.RoomCategory);

            mMessage.Init(54); //@v
            mMessage.appendArgumentInt(roomInfo.SuperUsers);
            mMessage.appendArgumentInt(InstanceManager.Game.Rooms.GetRoomStateInt(roomInfo.RoomStatus));
            mMessage.appendArgumentInt(roomId);
            if (roomInfo.ShowOwner == 1 || InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_see_all_roomowners") || roomInfo.RoomOwner == mUserInfo.userId)
            {
                mMessage.appendString(InstanceManager.Game.Users.GetUser(roomInfo.RoomOwner).sUsername);
            }
            else
            {
                mMessage.appendString("-");
            }
            mMessage.appendChar(2);
            mMessage.appendString(roomInfo.RoomModel);
            mMessage.appendChar(2);
            mMessage.appendString(roomInfo.RoomName);
            mMessage.appendChar(2);
            mMessage.appendString(roomInfo.RoomDescription);
            mMessage.appendChar(2);
            mMessage.appendArgumentInt(roomInfo.ShowOwner);
            mMessage.appendArgumentInt(catInfo.CanTrade);
            mMessage.appendArgumentInt(roomInstance.UserCount);
            mMessage.appendArgumentInt(roomInfo.MaxUsers);
            SendMessage(mMessage);
        }

        //23 - "DELETEFLAT": "@W"
        public void Listener23()
        {
            int roomId = int.Parse(mPacketBody);
            RoomInfo room = InstanceManager.Game.Rooms.GetRoom(roomId);

            if (room.RoomOwner == mUserInfo.userId)
            {
                InstanceManager.Game.Rooms.DeleteRoom(roomId);
            }
        }

        //24 - "UPDATEFLAT": "@X"
        public void Listener24()
        {
            string[] parts = mPacketBody.Split('/');
            bool invalid = false;

            int roomId = 0;
            if (!int.TryParse(parts[0], out roomId)) invalid = true;

            string roomName = SpecialFiltering.FilterChars("2,9,13,47", parts[1]);

            string roomStatus = parts[2];
            if (InstanceManager.Game.Rooms.GetRoomStateInt(roomStatus) == -1) invalid = true;

            int showOwner = 0;
            if (!int.TryParse(parts[3], out showOwner)) invalid = true;

            if (!invalid && InstanceManager.Game.Rooms.RoomExists(roomId))
            {
                RoomInfo info = InstanceManager.Game.Rooms.GetRoom(roomId);
                info.RoomName = roomName;
                info.RoomStatus = roomStatus;
                info.ShowOwner = showOwner;
                InstanceManager.Game.Rooms.UpdateRoom(info);
            }


        }

        //25 - "SETFLATINFO": "@Y"
        public void Listener25()
        {
            string rId = "";
            int roomId = 0;
            if (mPacketBody.Substring(0, 1) == "/")
                rId = mPacketBody.Split('/')[1];
            else
                rId = mPacketBody.Split('/')[0];

            if (int.TryParse(rId, out roomId))
            {
                RoomInfo roomInfo = InstanceManager.Game.Rooms.GetRoom(roomId);
                if (roomInfo.RoomOwner == mUserInfo.userId)
                {
                    string[] payLoad = mPacketBody.Split(Convert.ToChar(13));

                    for (int i = 1; i < payLoad.Length; i++)
                    {
                        string updateHeader = payLoad[i].Split('=')[0];
                        string updateBody = "";
                        if (payLoad[i].Length > updateHeader.Length + 1) updateBody = payLoad[i].Substring(updateHeader.Length + 1);

                        switch (updateHeader)
                        {
                            case "description":
                                roomInfo.RoomDescription = SpecialFiltering.FilterChars("2,9,13,47", updateBody);
                                break;

                            case "maxvisitors":
                                int maxvis = 0;
                                if(int.TryParse(updateBody, out maxvis))
                                {
                                    roomInfo.MaxUsers = maxvis;
                                }
                                break;

                            case "allsuperuser":
                                int allsuper = 0;
                                if (int.TryParse(updateBody, out allsuper))
                                {
                                    if (allsuper == 1 || allsuper == 0)
                                    {
                                        roomInfo.SuperUsers = allsuper;
                                    }
                                }
                                break;

                            case "password":
                                roomInfo.Password = SpecialFiltering.FilterChars("2,9,13,47", updateBody);
                                break;
                        }
                    }

                    InstanceManager.Game.Rooms.UpdateRoom(roomInfo);
                }
            }
        }

        //29 - "CREATEFLAT": "@]"
        public void Listener29()
        {
            string[] parts = mPacketBody.Split('/');
            bool invalid = false;

            string roomName = SpecialFiltering.FilterChars("2,9,13,47", parts[2]);
            
            string roomModel = parts[3];
            if (!InstanceManager.Game.Rooms.UserRoomExists(roomModel)) invalid = true;
            if (InstanceManager.Game.Rooms.GetUserType(roomModel) == 2)
            {
                if (!InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_use_special_room_layouts")) invalid = true;
            }
            
            string roomStatus = parts[4];
            if (InstanceManager.Game.Rooms.GetRoomStateInt(roomStatus) == -1) invalid = true;

            int showOwner = 0;
            if (!int.TryParse(parts[5], out showOwner)) invalid = true;

            if (!invalid)
            {
                int roomId = InstanceManager.Game.Rooms.CreateRoom(roomName, roomModel, roomStatus, showOwner, mUserInfo.userId);
                mMessage.Init(59); // @{
                mMessage.appendInt(roomId);
                mMessage.appendChar(13);
                mMessage.appendString(roomName);
                SendMessage(mMessage);
            }
            else
            {
                mMessage.Init(139); //BK
                mMessage.appendString(Language.roomCreationFailed);
                SendMessage(mMessage);
            }

           
        }

        //53 - "HV": "@u"
        public void Listener53()
        {
            InstanceManager.Sessions.GetSession(mSessionID).waitingFlat = 0;

            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;

            if (roomId != 0)
            {
                InstanceManager.Game.Rooms.GetRoomInstance(roomId).RemoveUser(mSessionID);
            }
        }

        //54 - "GOVIADOOR": "@v"
        public void Listener54()
        {
            int roomId = 0;
            int doorId = 0;
            string[] parts = mPacketBody.Split('/');
            if (int.TryParse(parts[0], out roomId) && int.TryParse(parts[1], out doorId))
            {
                if (InstanceManager.Sessions.GetSession(mSessionID).authenticatedFlat == roomId)
                {
                    if (InstanceManager.Sessions.GetSession(mSessionID).authenticatedDoor == doorId)
                    {
                        InstanceManager.Game.Rooms.GetRoomInstance(roomId).mDoorEntries.Add(mSessionID, doorId);
                        mMessage.Init(19); //@S
                        SendMessage(mMessage);
                    }
                }
            }
        }

        //57 - "TRYFLAT": "@y"
        public void Listener57()
        {
            int roomId = 0;
            bool result = false;
            string roomPassword = null;

            if (mPacketBody.Contains('/'))
            {
                roomId = int.Parse(mPacketBody.Split('/')[0]);
                roomPassword = mPacketBody.Split('/')[1];
            }
            else
            {
                roomId = int.Parse(mPacketBody);
            }

            

            if (!InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_enter_locked_rooms"))
            {
                if (InstanceManager.Sessions.GetSession(mSessionID).authenticatedDoor > 0 && InstanceManager.Sessions.GetSession(mSessionID).authenticatedFlat == roomId) //Entering via door
                {
                    InstanceManager.Sessions.GetSession(mSessionID).authenticatedDoor = 0;
                    result = true;
                }
                else
                {

                    RoomInfo roomInfo = InstanceManager.Game.Rooms.GetRoom(roomId);

                    if (mUserInfo.userId == roomInfo.RoomOwner)
                    {
                        result = true;
                    }
                    else
                    {
                        if (roomInfo.RoomStatus == "open") // Open
                        {
                            result = true;
                        }
                        else if (roomInfo.RoomStatus == "closed") //Doorbell
                        {
                            if (InstanceManager.Game.Rooms.InstanceExists(roomId))
                            {
                                if (InstanceManager.Game.Rooms.GetRoomInstance(roomId).BroadcastRingingUser(mUserInfo.sUsername))
                                {
                                    InstanceManager.Sessions.GetSession(mSessionID).waitingFlat = roomId;
                                }
                                else
                                {
                                    mMessage.Init(131); //BC
                                    SendMessage(mMessage);
                                }
                            }
                            else
                            {
                                mMessage.Init(131); //BC
                                SendMessage(mMessage);
                            }

                        }
                        else if (roomInfo.RoomStatus == "password") //Password
                        {
                            if (roomInfo.Password == roomPassword)
                            {
                                result = true;
                            }
                            else
                            {
                                ReportError("Incorrect flat password", false);
                            }
                        }
                    }
                }

            }
            else
            {
                result = true;
            }
           

            if (result)
            {
                InstanceManager.Sessions.GetSession(mSessionID).authenticatedFlat = roomId;
                mMessage.Init(41); // @i
                SendMessage(mMessage);
            }

            
        }

        //59 - "GOTOFLAT": "@{"
        public void Listener59()
        {
            int roomId = int.Parse(mPacketBody);
            if (roomId == InstanceManager.Sessions.GetSession(mSessionID).authenticatedFlat)
            {
                enterRoom(roomId, false);
            }
        }

        private void enterRoom(int roomId, bool overrideChecks)
        {
            RoomInstance roomInstance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
            roomInstance.AddUser(mSessionID);

            RoomInfo roomInfo = InstanceManager.Game.Rooms.GetRoom(roomId);

            if (!InstanceManager.Game.Rooms.GetCategory(roomInfo.RoomCategory).SystemCategory || InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_see_system_categories") || overrideChecks)
            {
                if (roomInstance.UserCount < roomInfo.MaxUsers || InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_enter_full_rooms") || overrideChecks)
                {

                    mMessage.Init(166); //Bf
                    mMessage.appendString("about:blank");
                    SendMessage(mMessage);

                    mMessage.Init(69); //AE
                    mMessage.appendString(roomInfo.RoomModel);
                    SendMessage(mMessage);

                    if (roomInfo.IsGuestRoom)
                    {

                        mMessage.Init(46); //@n
                        mMessage.appendString("wallpaper/");
                        mMessage.appendInt(roomInfo.Wallpaper);
                        SendMessage(mMessage);

                        mMessage.Init(46); //@n
                        mMessage.appendString("floor/");
                        mMessage.appendInt(roomInfo.Floor);
                        SendMessage(mMessage);
                    }
                }
                else
                {
                    mMessage.Init(18); // @R
                    SendMessage(mMessage);

                    mMessage.Init(139); //BK
                    mMessage.appendString(Language.roomFull);
                    SendMessage(mMessage);
                }
            }
            else
            {
                mMessage.Init(18); // @R
                SendMessage(mMessage);

                mMessage.Init(139); //BK
                mMessage.appendString("Need: fuse_see_system_categories");
                SendMessage(mMessage);
            }
        }

        //150 - NAVIGATE": "BV"
        public void Listener150()
        {
            int hideFull = ArgumentEncoding.decodeInt(mPacketBody.Substring(0, 1));
            string navId = mPacketBody.Substring(1);
            navId = navId.Substring(0, navId.Length - 1);
            int navCat = ArgumentEncoding.decodeInt(navId);
            mMessage.Init(220); //C\
            mMessage.appendString(InstanceManager.Game.Navigator.GetNavigatorResponse(navCat, hideFull, mUserInfo));
            SendMessage(mMessage);


        }

        //151 - "GETUSERFLATCATS": "BW"
        public void Listener151()
        {
            mMessage.Init(221);
            mMessage.appendString(InstanceManager.Game.Navigator.BuildPrivateCategoryResponse());
            SendMessage(mMessage);

        }

        //152 - "GETFLATCAT": "BX"
        public void Listener152()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody);
            RoomInfo info = InstanceManager.Game.Rooms.GetRoom(roomId);

            if(info != null)
            {
                mMessage.Init(222); //C^
                mMessage.appendString(ArgumentEncoding.encodeInt(info.RoomID));
                mMessage.appendString(ArgumentEncoding.encodeInt(info.RoomCategory));
                SendMessage(mMessage);
            }
        }

        //153 - "SETFLATCAT": "BY"
        public void Listener153()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody);
            int catId = ArgumentEncoding.decodeInt(mPacketBody.Substring(ArgumentEncoding.getLength(roomId)) + 1);
            RoomInfo info = InstanceManager.Game.Rooms.GetRoom(roomId);
            RoomCategory cat = InstanceManager.Game.Rooms.GetCategory(catId);

            if (info != null && cat != null)
            {
                if (cat.PlayerCategory)
                {
                    info.RoomCategory = catId;
                    InstanceManager.Game.Rooms.UpdateRoom(info);
                }
            }
        }

        //154 - "GETSPACENODEUSERS": "BZ"
        public void Listener154()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody);
            string payload = "";

            if(InstanceManager.Game.Rooms.InstanceExists(roomId))
            {
                payload = InstanceManager.Game.Rooms.GetRoomInstance(roomId).UserList;
            }

            mMessage.Init(223); //C_
            mMessage.appendString(payload);
            SendMessage(mMessage);

        }

        //155 - "REMOVEALLRIGHTS": "B["
        public void Listener155()
        {
            int roomId = ArgumentEncoding.decodeInt(mPacketBody);
            RoomInfo info = InstanceManager.Game.Rooms.GetRoom(roomId);

            if (mUserInfo.userId == info.RoomOwner)
            {
                InstanceManager.Game.Rooms.DeleteAllRights(roomId);
            }
        }

        //182 - "GETINTERST": "Bv"
        public void Listener182()
        {
            mMessage.Init(258); //DB
            mMessage.appendInt(0);
            SendMessage(mMessage);
        }
    }
}
