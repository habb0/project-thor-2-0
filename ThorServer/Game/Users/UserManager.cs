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

using ThorServer.Data;
using ThorServer.Utilities;

namespace ThorServer.Game.Users
{
    public class UserManager
    {
        public bool UserExists(string username)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@username", username);
            int tmpInt = db.getInt("SELECT COUNT(*) FROM Users WHERE Username = @username;");
            db.sqlexecute.Parameters.Clear();
            return (tmpInt > 0) ? true : false;
        }

        public int GetUserID(string username)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@username", username);
            int userId = db.getInt("SELECT UserID FROM Users WHERE Username = @username;");
            db.sqlexecute.Parameters.Clear();
            return userId;
        }

        public UserInfo GetUser(string username)
        {
            return GetUser(GetUserID(username));
        }

        public UserInfo GetUser(int userId)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            DataRow dr = db.GetDataSet("SELECT * FROM Users WHERE UserID = @userid;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();

            UserInfo tmpUser = new UserInfo();

            tmpUser.userId = userId;
            tmpUser.sUsername = dr["Username"].ToString();
            tmpUser.sPassword = dr["Password"].ToString();
            tmpUser.sFigure = dr["figure"].ToString();
            tmpUser.sSex = dr["sex"].ToString();
            tmpUser.sMission = dr["mission"].ToString();
            tmpUser.sEmail = dr["email"].ToString();
            tmpUser.sDOB = dr["dob"].ToString();
            tmpUser.sBadge = dr["CurrentBadge"].ToString();
            tmpUser.sPoolFigure = dr["poolfigure"].ToString();
            tmpUser.LastIP = dr["LastIP"].ToString();
            tmpUser.iCredits = int.Parse(dr["credits"].ToString());
            tmpUser.iTickets = int.Parse(dr["tickets"].ToString());
            tmpUser.iRole = int.Parse(dr["roleid"].ToString());
            tmpUser.ClubDaysRemaining = int.Parse(dr["ClubDaysRemaining"].ToString());
            tmpUser.ClubMonthsRemaining = int.Parse(dr["ClubMonthsRemaining"].ToString());
            tmpUser.ClubMonthsPassed = int.Parse(dr["ClubMonthsPassed"].ToString());
            tmpUser.ClubLastUpdate = (DateTime)dr["ClubLastUpdate"];
            tmpUser.LastLogin = (DateTime)dr["LastLogin"];
            

            //Work out habbo club
            if (tmpUser.ClubLastUpdate < DateTime.Now.AddDays(-1) && tmpUser.iRole == int.Parse(UserSettings.ClubRole))
            {
                TimeSpan span = DateTime.Now.Subtract(tmpUser.ClubLastUpdate);

                for (int i = 1; i <= span.Days; i++)
                {
                    tmpUser.ClubDaysRemaining--;
                    if (tmpUser.ClubDaysRemaining <= 0)
                    {
                        tmpUser.ClubDaysRemaining = 0;
                        tmpUser.ClubMonthsPassed++;
                        if (tmpUser.ClubMonthsRemaining > 0)
                        {
                            tmpUser.ClubMonthsRemaining--;
                            tmpUser.ClubDaysRemaining = 31;
                        }
                    }                  
                }

                if (tmpUser.ClubDaysRemaining > 0)
                {
                    tmpUser.iRole = int.Parse(UserSettings.ClubRole);
                }
                else
                {
                    tmpUser.iRole = int.Parse(UserSettings.DefaultRole);
                }

                tmpUser.ClubLastUpdate = DateTime.Now;
                UpdateUser(tmpUser);
            }

            tmpUser.Badges = InstanceManager.Game.Roles.GetBadges(tmpUser.iRole);

            return tmpUser;

        }

        public void LogLogin(UserInfo userinfo)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userinfo.userId);
            db.sqlexecute.Parameters.AddWithValue("@lastip", userinfo.LastIP);
            db.sqlexecute.Parameters.AddWithValue("@lastlogin", userinfo.LastLogin);
            db.ExecuteSQL("INSERT INTO Logins (UserId, IPAddress, TimeStamp) VALUES (@userid, @lastip, @lastlogin);");
        }

        public void UpdateUser(UserInfo userinfo)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userinfo.userId);
            db.sqlexecute.Parameters.AddWithValue("@username", userinfo.sUsername);
            db.sqlexecute.Parameters.AddWithValue("@password", userinfo.sPassword);
            db.sqlexecute.Parameters.AddWithValue("@figure", SpecialFiltering.FilterOnlyNumbers(userinfo.sFigure));
            db.sqlexecute.Parameters.AddWithValue("@sex", verifyUserSex(userinfo.sSex));
            db.sqlexecute.Parameters.AddWithValue("@mission", SpecialFiltering.FilterChars("2,9,10,13", userinfo.sMission));
            db.sqlexecute.Parameters.AddWithValue("@poolfigure", userinfo.sPoolFigure);
            db.sqlexecute.Parameters.AddWithValue("@email", SpecialFiltering.FilterChars("2,9,10,13", userinfo.sEmail));
            db.sqlexecute.Parameters.AddWithValue("@dob", SpecialFiltering.FilterChars("2,9,10,13", userinfo.sDOB));
            db.sqlexecute.Parameters.AddWithValue("@credits", userinfo.iCredits);
            db.sqlexecute.Parameters.AddWithValue("@tickets", userinfo.iTickets);
            db.sqlexecute.Parameters.AddWithValue("@roleid", userinfo.iRole);
            db.sqlexecute.Parameters.AddWithValue("@clubmonthsremaining", userinfo.ClubMonthsRemaining);
            db.sqlexecute.Parameters.AddWithValue("@clubmonthspassed", userinfo.ClubMonthsPassed);
            db.sqlexecute.Parameters.AddWithValue("@clubdaysremaining", userinfo.ClubDaysRemaining);
            db.sqlexecute.Parameters.AddWithValue("@lastlogin", userinfo.LastLogin);
            db.sqlexecute.Parameters.AddWithValue("@clublast", userinfo.ClubLastUpdate);
            db.sqlexecute.Parameters.AddWithValue("@lastip", userinfo.LastIP);
            db.ExecuteSQL("UPDATE users SET Username = @username, Password = @password, figure = @figure, sex = @sex, mission = @mission, email = @email, dob = @dob, credits = @credits, tickets = @tickets, roleid = @roleid, poolfigure = @poolfigure, LastLogin = @lastlogin, ClubLastUpdate = @clublast, ClubDaysRemaining = @clubdaysremaining, ClubMonthsRemaining = @clubmonthsremaining, ClubMonthsPassed = @clubmonthspassed, LastIP = @lastip WHERE UserID = @userid;");

            db.sqlexecute.Parameters.Clear();
        }

        public void SetBadge(int userid, string badge)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);
            db.sqlexecute.Parameters.AddWithValue("@currentbadge", badge);
            db.ExecuteSQL("UPDATE users SET CurrentBadge = @currentbadge WHERE UserID = @userid;");

            db.sqlexecute.Parameters.Clear();
        }

        public void CreateUser(UserInfo newUser)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@username", SpecialFiltering.FilterName( newUser.sUsername));
            db.sqlexecute.Parameters.AddWithValue("@password",newUser.sPassword);
            db.sqlexecute.Parameters.AddWithValue("@figure", SpecialFiltering.FilterOnlyNumbers(newUser.sFigure));
            db.sqlexecute.Parameters.AddWithValue("@sex", verifyUserSex(newUser.sSex));
            db.sqlexecute.Parameters.AddWithValue("@mission", SpecialFiltering.FilterChars("2,9,10,13", newUser.sMission));
            db.sqlexecute.Parameters.AddWithValue("@poolfigure", newUser.sPoolFigure);
            db.sqlexecute.Parameters.AddWithValue("@email", SpecialFiltering.FilterChars("2,9,10,13", newUser.sEmail));
            db.sqlexecute.Parameters.AddWithValue("@dob", SpecialFiltering.FilterChars("2,9,10,13", newUser.sDOB));
            db.sqlexecute.Parameters.AddWithValue("@credits", int.Parse(UserSettings.DefaultCredits));
            db.sqlexecute.Parameters.AddWithValue("@tickets", int.Parse(UserSettings.DefaultTickets));
            db.sqlexecute.Parameters.AddWithValue("@role", int.Parse(UserSettings.DefaultRole));
            db.sqlexecute.Parameters.AddWithValue("@clublast", DateTime.Now);
            db.sqlexecute.Parameters.AddWithValue("@lastlogin", DateTime.Now);
            db.sqlexecute.Parameters.AddWithValue("@lastip", newUser.LastIP);
            db.ExecuteSQL("INSERT INTO users (Username, Password, figure, sex, mission, email, dob, credits, tickets, roleid, poolfigure, ClubLastUpdate, LastLogin, LastIP) " +
                                            "VALUES (@username, @password, @figure, @sex, @mission, @email, @dob, @credits, @tickets, @role, @poolfigure, @clublast, @lastlogin, @lastip);");

            db.sqlexecute.Parameters.Clear();

        }

        private string verifyUserSex(string sexIn)
        {
            switch (sexIn.ToUpper())
            {
                case "M":
                    return sexIn.ToUpper();
                case "F":
                    return sexIn.ToUpper();
                default:
                    return "M";
            }
        }

        public byte UserLogin(string username, string password, string ip, ref string banMessage)
        {
            if (UserExists(username))
            {
                UserInfo tmpUser = GetUser(username);
                if (tmpUser.sPassword == password)
                {
                    if (InstanceManager.Game.Roles.HasRight(tmpUser.iRole, "fuse_login"))
                    {
                        if (InstanceManager.Game.Moderation.ModerationData.IsBanned(tmpUser.userId, ip, ref banMessage))
                        {
                            return 4; //Banned
                        }
                        else
                        {
                            return 0; //OK
                        }
                    }
                    else
                    {
                        return 3; //Bad permissions
                    }

                }
                else
                {
                    return 2; //Bad Password
                }

            }
            else
            {
                return 1; //Bad Username
            }
        }

        public List<int> GetFavouriteRooms(int userId)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            DataSet ds = db.GetDataSet("SELECT * FROM FavouriteRooms WHERE UserId = @userid;");
            db.sqlexecute.Parameters.Clear();

            List<int> results = new List<int>();
            if (ds.Tables[0] != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow dRow in ds.Tables[0].Rows)
                    {
                        results.Add(int.Parse(dRow["RoomID"].ToString()));
                    }
                }
            }

            return results;
        }

        public void AddFavouriteRoom(int userId, int roomId)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.sqlexecute.Parameters.AddWithValue("@roomid", roomId);
            db.ExecuteSQL("INSERT INTO FavouriteRooms (RoomID, UserId) VALUES (@roomid, @userid);");
            db.sqlexecute.Parameters.Clear();
        }

        public void DeleteFavouriteRoom(int userId, int roomId)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.sqlexecute.Parameters.AddWithValue("@roomid", roomId);
            db.ExecuteSQL("DELETE FROM FavouriteRooms WHERE UserId = @userid AND RoomID = @roomid;");
            db.sqlexecute.Parameters.Clear();
        }

    }
}
