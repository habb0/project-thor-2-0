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

using ThorServer.Utilities;
using ThorServer.Game.Users;

namespace ThorServer.Game.Rooms
{
    public class Navigator
    {

        public string GetOwnRoomSearchResult(int userId)
        {
            StringBuilder sb = new StringBuilder();
            List<RoomInfo> roomInfoList = InstanceManager.Game.Rooms.GetUserRoomList(userId);
            UserInfo user = InstanceManager.Game.Users.GetUser(userId);

            if (roomInfoList.Count > 0)
            {

                foreach (RoomInfo roomInfo in roomInfoList)
                {
                    sb.Append(formSpecialRoomDefinition(roomInfo, user));
                }
                return sb.ToString();
            }

            return null;
        }

        public string GetRoomSearchResult(string searchCrit, int userId)
        {
            StringBuilder sb = new StringBuilder();
            List<RoomInfo> roomInfoList = InstanceManager.Game.Rooms.GetSearchRoomList(searchCrit);
            UserInfo user = InstanceManager.Game.Users.GetUser(userId);

            if (roomInfoList.Count > 0)
            {

                foreach (RoomInfo roomInfo in roomInfoList)
                {
                    sb.Append(formSpecialRoomDefinition(roomInfo, user));
                }
                return sb.ToString();
            }

            return null;
        }

        public string GetFavouriteSearchResult(int userId, int roleId)
        {
            List<int> favouriteRooms = InstanceManager.Game.Users.GetFavouriteRooms(userId);
            UserInfo userInfo = InstanceManager.Game.Users.GetUser(userId);
            int gRooms = 0;

            StringBuilder sbGuest = new StringBuilder();
            StringBuilder sbPublic = new StringBuilder();



            foreach (int roomId in favouriteRooms)
            {
                if (InstanceManager.Game.Rooms.RoomExists(roomId))
                {
                    RoomInfo info = InstanceManager.Game.Rooms.GetRoom(roomId);
                    int categoryType = InstanceManager.Game.Rooms.GetCategory(info.RoomCategory).RoomCategoryType;
                    if (categoryType == 2) sbGuest.Append(BuildRoomResponse(info, userInfo, 0));
                    if (categoryType == 0) sbPublic.Append(BuildRoomResponse(info, userInfo, 0));
                    if (categoryType == 2) gRooms++;
                }
                else
                {
                    InstanceManager.Game.Users.DeleteFavouriteRoom(userId, roomId);
                }
            }
            StringBuilder final = new StringBuilder();
            final.Append("H" + "H" + "J" + Convert.ToChar(2) + "HHH");
            final.Append(ArgumentEncoding.encodeInt(gRooms));
            final.Append(sbGuest.ToString());
            final.Append(sbPublic.ToString());
            return final.ToString();
        }

        private string formSpecialRoomDefinition(RoomInfo roomInfo, UserInfo user)
        {
            StringBuilder sb = new StringBuilder();

            char tab = Convert.ToChar(9);

            sb.Append(roomInfo.RoomID.ToString());
            sb.Append(tab);
            sb.Append(roomInfo.RoomName);
            sb.Append(tab);
            if (roomInfo.ShowOwner == 1 || InstanceManager.Game.Roles.HasRight(user.iRole, "fuse_see_all_roomowners"))
            {
                sb.Append(InstanceManager.Game.Users.GetUser(roomInfo.RoomOwner).sUsername);
            }
            else
            {
                sb.Append("-");
            }
            sb.Append(tab);
            sb.Append(roomInfo.RoomStatus);
            sb.Append(tab);
            sb.Append("x");
            sb.Append(tab);
            sb.Append(roomInfo.CurrentUsers.ToString());
            sb.Append(tab);
            sb.Append(roomInfo.MaxUsers.ToString());
            sb.Append(tab);
            sb.Append("null");
            sb.Append(tab);
            sb.Append(roomInfo.RoomDescription);
            sb.Append(tab);
            sb.Append(roomInfo.RoomDescription);
            sb.Append(tab);
            sb.Append(Convert.ToChar(13));

            return sb.ToString();
        }

        public string GetNavigatorResponse(int navID, int hideFull, UserInfo user)
        {
            StringBuilder sb = new StringBuilder();
            RoomCategory category = InstanceManager.Game.Rooms.GetCategory(navID);

            if (category != null)
            {

                List<RoomInfo> rooms = InstanceManager.Game.Rooms.GetRoomListByCategory(navID);

                sb.Append(BuildCategoryResponse(category, hideFull, rooms.Count));

                if (rooms.Count > 0)
                {
                    foreach (RoomInfo room in rooms)
                    {
                        sb.Append(BuildRoomResponse(room, user, hideFull));
                    }
                }

                List<RoomCategory> subcategories = InstanceManager.Game.Rooms.GetSubCategoryList(navID);

                if (subcategories.Count > 0)
                {
                    foreach (RoomCategory subcat in subcategories)
                    {
                        sb.Append(BuildSubCategoryList(subcat, user.iRole));
                    }
                }
            }

            return sb.ToString();
        }

        private string BuildSubCategoryList(RoomCategory category, int userRole)
        {
            List<RoomInfo> rooms = InstanceManager.Game.Rooms.GetRoomListByCategory(category.CategoryID);
            StringBuilder sb = new StringBuilder();
            if (category.IsVisible || (category.SystemCategory && InstanceManager.Game.Roles.HasRight(userRole, "fuse_see_system_categories")))

            {
                sb.Append(ArgumentEncoding.encodeInt(category.CategoryID));
                sb.Append(ArgumentEncoding.encodeInt(0));
                sb.Append(category.CategoryName);
                sb.Append(Convert.ToChar(2));

                int maxUsers = 0;
                int currentUsers = 0;

                if (rooms.Count > 0)
                {
                    foreach (RoomInfo room in rooms)
                    {
                        maxUsers += room.MaxUsers;
                        currentUsers += room.CurrentUsers;
                    }
                }
                    sb.Append(ArgumentEncoding.encodeInt(currentUsers));
                    sb.Append(ArgumentEncoding.encodeInt(maxUsers));
                    sb.Append(ArgumentEncoding.encodeInt(category.ParentCategory));
                
            }
            return sb.ToString();
        }

        private string BuildCategoryResponse(RoomCategory category, int hideFull, int roomCount)
        {
            StringBuilder sb = new StringBuilder();
                sb.Append(ArgumentEncoding.encodeInt(hideFull));
                sb.Append(ArgumentEncoding.encodeInt(category.CategoryID));
                sb.Append(ArgumentEncoding.encodeInt(category.RoomCategoryType));
                sb.Append(category.CategoryName); // Name
                sb.Append(Convert.ToChar(2));
                sb.Append(ArgumentEncoding.encodeInt(0));
                sb.Append(ArgumentEncoding.encodeInt(10000));
                sb.Append(ArgumentEncoding.encodeInt(category.ParentCategory));
                if (category.RoomCategoryType == 2) //Guest
                {
                    sb.Append(ArgumentEncoding.encodeInt(roomCount));
                }
            return sb.ToString();

        }

        private string BuildRoomResponse(RoomInfo room, UserInfo user, int hideFull)
        {
            int categoryType = InstanceManager.Game.Rooms.GetCategory(room.RoomCategory).RoomCategoryType;

            StringBuilder sb = new StringBuilder();

            if (hideFull == 1 && room.CurrentUsers >= room.MaxUsers)
            {
                return "";
            }

            if (categoryType == 2) // Guest
            {
                sb.Append(ArgumentEncoding.encodeInt(room.RoomID));
                sb.Append(room.RoomName);
                sb.Append(Convert.ToChar(2));
                if (room.ShowOwner == 1 || InstanceManager.Game.Roles.HasRight(user.iRole, "fuse_see_all_roomowners"))
                {
                    sb.Append(InstanceManager.Game.Users.GetUser(room.RoomOwner).sUsername);
                }
                else
                {
                    sb.Append("-");
                }
                sb.Append(Convert.ToChar(2));
                sb.Append(room.RoomStatus);
                sb.Append(Convert.ToChar(2));
                sb.Append(ArgumentEncoding.encodeInt(room.CurrentUsers));
                sb.Append(ArgumentEncoding.encodeInt(room.MaxUsers));
                sb.Append(room.RoomDescription);
                sb.Append(Convert.ToChar(2));
            }

            if (categoryType == 0) //Public
            {
                sb.Append(ArgumentEncoding.encodeInt(room.RoomID));
                sb.Append(ArgumentEncoding.encodeInt(1));
                sb.Append(room.RoomName);
                sb.Append(Convert.ToChar(2));
                sb.Append(ArgumentEncoding.encodeInt(room.CurrentUsers));
                sb.Append(ArgumentEncoding.encodeInt(room.MaxUsers));
                sb.Append(ArgumentEncoding.encodeInt(room.RoomCategory));
                sb.Append(room.RoomDescription);
                sb.Append(Convert.ToChar(2));
                sb.Append(ArgumentEncoding.encodeInt(room.RoomID));
                sb.Append(ArgumentEncoding.encodeInt(0));
                sb.Append(room.CCTs);
                sb.Append(Convert.ToChar(2));
                sb.Append(ArgumentEncoding.encodeInt(0));
                sb.Append(ArgumentEncoding.encodeInt(1));
            }
            return sb.ToString();

        }

        public string BuildPrivateCategoryResponse()
        {
            StringBuilder sb = new StringBuilder();
            int catCount = 0;

            List<RoomCategory> subcategories = InstanceManager.Game.Rooms.GetSubCategoryList(4);

            if (subcategories.Count > 0)
            {
                foreach (RoomCategory subcat in subcategories)
                {
                    if (subcat.PlayerCategory)
                    {
                        catCount++;
                        sb.Append(ArgumentEncoding.encodeInt(subcat.CategoryID));
                        sb.Append(subcat.CategoryName);
                        sb.Append(Convert.ToChar(2));
                    }
                }
            }

            StringBuilder result = new StringBuilder(ArgumentEncoding.encodeInt(catCount));
            result.Append(sb.ToString());
            return result.ToString();
        }
    }
}
