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
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using ThorServer.Data;

namespace ThorHousekeeping
{
    public class ReferralManager
    {
        public bool HasBeenReferred(int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@referred", userId);
            int res = db.getInt("SELECT COUNT(*) FROM Referrals WHERE Referred = @referred;");
            db.sqlexecute.Parameters.Clear();

            return res > 0;
        }

        public void AddReferral(int referrer, int referred)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@userid", referrer);
            db.sqlexecute.Parameters.AddWithValue("@referred", referred);
            db.ExecuteSQL("INSERT INTO Referrals (UserId, Referred) VALUES (@userid, @referred);");
            db.sqlexecute.Parameters.Clear();

        }
    }
}
