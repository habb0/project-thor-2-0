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
using System.Data;

using ThorServer.Core;
using ThorServer.Data;

namespace ThorServer.Game.External
{
    public class ExternalManager
    {
        public Dictionary<string, string> mExternalVars;
        public Dictionary<string, string> mExternalTexts;


        public ExternalManager()
        {
            CacheVars();
            CacheTexts();
        }

        private void CacheVars()
        {
            Logging.LogEvent("Caching external variables...", Logging.LogLevel.Info);
            mExternalVars = new Dictionary<string, string>();
            Database db = new Database();
            DataTable dt = db.GetDataSet("SELECT * FROM ExternalVars;").Tables[0];

            foreach (DataRow dRow in dt.Rows)
            {
                mExternalVars.Add(dRow["VarName"].ToString(), dRow["VarValue"].ToString());
            }

            Logging.LogEvent("Done caching external variables.", Logging.LogLevel.Info);
        }

        private void CacheTexts()
        {
            Logging.LogEvent("Caching external texts...", Logging.LogLevel.Info);
            mExternalTexts = new Dictionary<string, string>();
            Database db = new Database();
            DataTable dt = db.GetDataSet("SELECT * FROM ExternalTexts;").Tables[0];

            foreach (DataRow dRow in dt.Rows)
            {
                mExternalTexts.Add(dRow["TextName"].ToString(), dRow["TextValue"].ToString());
            }
            Logging.LogEvent("Done caching external texts.", Logging.LogLevel.Info);
        }

        public string GetTextValue(string textVar)
        {
            if (mExternalTexts.ContainsKey(textVar))
            {
                return mExternalTexts[textVar];
            }

            return textVar;
        }

        public string GetVarValue(string textVar)
        {
            if (mExternalVars.ContainsKey(textVar))
            {
                return mExternalVars[textVar];
            }

            return textVar;
        }
    }
}
