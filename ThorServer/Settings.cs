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

namespace ThorServer
{
    public static class Settings
    {
        private static SettingsParser m_parser;

        public static string GetSetting(string settingName)
        {
            if (m_parser == null) m_parser = new SettingsParser("Settings");
            string tmp =  m_parser.GetSetting(settingName);
            if (tmp == null) throw new Exception("Could not get setting value " + settingName);
            return tmp;
        }

        //DatabasePassword
        public static string DatabaseName
        {
            get
            {
                return GetSetting("DatabaseName");
            }
        }

        //DatabasePassword
        public static string DatabasePassword
        {
            get
            {
                return GetSetting("DatabasePassword");
            }
        }

        //DatabaseServer
        public static string DatabaseServer
        {
            get
            {
                return GetSetting("DatabaseServer");
            }
        }

        //DatabaseUser
        public static string DatabaseUser
        {
            get
            {
                return GetSetting("DatabaseUser");
            }
        }

        //IPConnectionLimit
        public static string IPConnectionLimit
        {
            get
            {
                return GetSetting("IPConnectionLimit");
            }
        }

        //ListenPort
        public static string ListenPort
        {
            get
            {
                return GetSetting("ListenPort");
            }
        }

        //LogLevel
        public static string LogLevel
        {
            get
            {
                return GetSetting("LogLevel");
            }
        }

        //DatabaseVersion
        public static string DatabaseVersion
        {
            get
            {
                return GetSetting("DatabaseVersion");
            }
        }

        //ClientClubAllowedSets
        public static string ClientClubAllowedSets
        {
            get
            {
                return GetSetting("ClientClubAllowedSets");
            }
        }
    }
}
