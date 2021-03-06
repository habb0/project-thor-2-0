﻿/*
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

namespace ThorServer.Game.Rooms.Reactors
{
    public class PublicReactor : RoomCommonReactor
    {
        //80 - "CARRYDRINK": "AP"
        public void Listener80()
        {
            if (mPacketBody.Length < 30)
            {
                if (!mRoomInstance.HasUniqueStatus(mSessionID, "swim"))
                {
                    string drinkName = SpecialFiltering.FilterChars("13,47", mPacketBody);
                    mRoomInstance.RemoveUniqueStatuses(mSessionID, "wave");
                    ApplyUniqueStatus("carryd", 120, drinkName, true, 13, 1, "drink");
                }
            }
        }
    }
}
