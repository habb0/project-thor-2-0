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

namespace ThorServer.Game.Rooms
{
    public class RoomInfo
    {
        public int RoomID;
        public string RoomName;
        public string RoomDescription;
        public string RoomStatus;
        public int RoomOwner = 0;
        public int RoomType;
        public int RoomCategory;
        public string TypeName;
        public string RoomModel;
        public string DefaultHeightmap;
        public int StartX;
        public int StartY;
        public int StartZ;
        public bool GuestRoom;
        public int MaxUsers;
        public int Wallpaper;
        public int Floor;
        public string ReactorType;
        public string CCTs;
        public bool IsGuestRoom;
        public int SuperUsers;
        public int ShowOwner;
        public int UserType;
        public string Password;
        public int CurrentUsers;
        public float MaxAscend;
        public float MaxDescend;

    }

    public class RoomCategory
    {
        public int CategoryID;
        public string CategoryName;
        public int ParentCategory;
        public int RoomCategoryType;
        public int CanTrade;
        public bool IsVisible;
        public bool PlayerCategory;
        public bool SystemCategory;
    }
}
