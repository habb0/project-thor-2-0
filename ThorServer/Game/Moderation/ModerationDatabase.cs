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

using ThorServer.Data;

namespace ThorServer.Game.Moderation
{
    public class ModerationDatabase
    {

        public void BanUser(int userId, int bannerId, string message, double hours, bool banIp)
        {
            Database db = new Database();

            DateTime expireTime = DateTime.Now.AddHours(hours);

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.sqlexecute.Parameters.AddWithValue("@banner", bannerId);
            db.sqlexecute.Parameters.AddWithValue("@message", message);
            db.sqlexecute.Parameters.AddWithValue("@expires", expireTime);
            db.sqlexecute.Parameters.AddWithValue("@banip", banIp);

            db.ExecuteSQL("INSERT INTO UserBans (UserBanned, UserBanner, BanMessage, BanExpires, BanIP) VALUES (@userid, @banner, @message, @expires, @banip);");

            db.sqlexecute.Parameters.Clear();
        }

        public bool IsBanned(int userId, string ip, ref string banReason)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.sqlexecute.Parameters.AddWithValue("@expires", DateTime.Now);
            db.sqlexecute.Parameters.AddWithValue("@ip", ip);

            int res = db.getInt("SELECT COUNT(*) FROM UserBans WHERE UserBanned = @userid  AND BanExpires > @expires;");

            if (res > 0)
            {
                banReason = db.getStringValue("SELECT TOP 1 BanMessage FROM UserBans WHERE UserBanned = @userid ORDER BY BanExpires DESC;");   
            }

            if (res == 0)
            {
                res = db.getInt("SELECT COUNT(*) FROM UserBans WHERE UserBanned IN (SELECT UserID From Users WHERE LastIP = @ip)  AND BanExpires > @expires AND BanIP = 1;");
                if (res > 0)
                {
                    banReason =  db.getStringValue("SELECT TOP 1 BanMessage FROM UserBans WHERE UserBanned IN (SELECT UserID From Users WHERE LastIP = @ip) ORDER BY BanExpires DESC;");
                }
            }

            db.sqlexecute.Parameters.Clear();

            return (res > 0);
        }
    }
}
