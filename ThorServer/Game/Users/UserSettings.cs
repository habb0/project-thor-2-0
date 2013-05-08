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

namespace ThorServer.Game.Users
{
    public static class UserSettings
    {
        private static SettingsParser m_parser;

        public static string GetSetting(string settingName)
        {
            if (m_parser == null) m_parser = new SettingsParser("UserSettings");
            string tmp = m_parser.GetSetting(settingName);
            if (tmp == null) throw new Exception("Could not get setting value " + settingName);
            return tmp;
        }

        //ClubRole
        public static string ClubRole
        {
            get
            {
                return GetSetting("ClubRole");
            }
        }

        //DefaultRole
        public static string DefaultRole
        {
            get
            {
                return GetSetting("DefaultRole");
            }
        }

        //DefaultCredits
        public static string DefaultCredits
        {
            get
            {
                return GetSetting("DefaultCredits");
            }
        }

        //DefaultTickets
        public static string DefaultTickets
        {
            get
            {
                return GetSetting("DefaultTickets");
            }
        }

        //UserEmotes
        public static string UserEmotes
        {
            get
            {
                return GetSetting("UserEmotes");
            }
        }

        //MaxFavouriteRooms
        public static string MaxFavouriteRooms
        {
            get
            {
                return GetSetting("MaxFavouriteRooms");
            }
        }

        //ReferralReward
        public static string ReferralReward
        {
            get
            {
                return GetSetting("ReferralReward");
            }
        }

        //ReferredReward
        public static string ReferredReward
        {
            get
            {
                return GetSetting("ReferredReward");
            }
        }
    }
}
