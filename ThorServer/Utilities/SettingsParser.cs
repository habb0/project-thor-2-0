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
using System.IO;

namespace ThorServer.Utilities
{
    public class SettingsParser
    {
        private Dictionary<string, string> m_settingsCollection = new Dictionary<string, string>();

        public SettingsParser(string settingsModule)
        {
            string tmpFilename = System.Windows.Forms.Application.StartupPath + "\\" + settingsModule + ".conf";

            //Verify the file exists
            if (!File.Exists(tmpFilename)) return;

            string line;

            // Read the file and parse it
            StreamReader file = new StreamReader(tmpFilename);
            while ((line = file.ReadLine()) != null)
            {
                if(line.StartsWith("#")) continue; //Comment
                if (!line.Contains('=')) continue; //Invalid line

                string[] parts = line.Split("=".ToCharArray(), 2, StringSplitOptions.None);
                m_settingsCollection.Add(parts[0], parts[1]);
            }

            file.Close();
        }

        public string GetSetting(string settingName)
        {
            if (!m_settingsCollection.ContainsKey(settingName)) return null;

            return m_settingsCollection[settingName];
        }

    }
}
