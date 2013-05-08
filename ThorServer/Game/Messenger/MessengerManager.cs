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
using ThorServer.Game.Users;
using ThorServer.Utilities;
using ThorServer.Session;

namespace ThorServer.Game.Messenger
{
    public class MessengerManager
    {
        public List<MessengerBuddy> GetBuddyList(int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);

            int count = db.getInt("SELECT COUNT(*) FROM MessengerBuddies WHERE (User1 = @userid OR User2 = @userid) AND Accepted = 1 AND @userid IN (SELECT UserID From Users);");

            if (count > 0)
            {
                List<MessengerBuddy> result = new List<MessengerBuddy>();
                DataTable dt = db.GetDataSet("SELECT * FROM MessengerBuddies WHERE (User1 = @userid OR User2 = @userid) AND Accepted = 1 AND @userid IN (SELECT UserID From Users);").Tables[0];
                foreach (DataRow dRow in dt.Rows)
                {
                    result.Add(new MessengerBuddy((int)dRow["User1"], (int)dRow["User2"], (bool)dRow["Accepted"]));
                }

                return result;
            }

            return null;
        }

        public List<MessengerBuddy> GetRequests(int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);

            int count = db.getInt("SELECT COUNT(*) FROM MessengerBuddies WHERE User2 = @userid AND Accepted = 0 AND @userid IN (SELECT UserID From Users);");

            if (count > 0)
            {
                List<MessengerBuddy> result = new List<MessengerBuddy>();
                DataTable dt = db.GetDataSet("SELECT * FROM MessengerBuddies WHERE (User1 = @userid OR User2 = @userid) AND Accepted = 0 AND @userid IN (SELECT UserID From Users);").Tables[0];
                foreach (DataRow dRow in dt.Rows)
                {
                    result.Add(new MessengerBuddy((int)dRow["User1"], (int)dRow["User2"], (bool)dRow["Accepted"]));
                }

                return result;
            }

            return null;
        }

        public MessengerBuddy GetBuddy(int myid, int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@myid", myid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);

            int count = db.getInt("SELECT COUNT(*) FROM MessengerBuddies WHERE (User1 = @userid OR User2 = @userid) AND (User1 = @myid OR User2 = @myid) AND Accepted = 1 AND @userid IN (SELECT UserID From Users);");

            if (count > 0)
            {
                List<MessengerBuddy> result = new List<MessengerBuddy>();
                DataRow dRow = db.GetDataSet("SELECT * FROM MessengerBuddies WHERE (User1 = @userid OR User2 = @userid) AND (User1 = @myid OR User2 = @myid) AND Accepted = 1 AND @userid IN (SELECT UserID From Users);").Tables[0].Rows[0];
                return (new MessengerBuddy((int)dRow["User1"], (int)dRow["User2"], (bool)dRow["Accepted"]));

            }

            return null;
        }

        public void AddBuddy(int myid, int userid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@myid", myid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);

            db.ExecuteSQL("INSERT INTO MessengerBuddies (User1, User2, Accepted) VALUES (@myid, @userid, 0);");

            db.sqlexecute.Parameters.Clear();
        }

        public void RejectBuddy(int myid, int userid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@myid", myid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);

            db.ExecuteSQL("DELETE FROM MessengerBuddies WHERE User1 = @userid AND User2 = @myid AND Accepted = 0;");

            db.sqlexecute.Parameters.Clear();
        }

        public void AcceptBuddy(int myid, int userid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@myid", myid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);

            db.ExecuteSQL("UPDATE MessengerBuddies SET Accepted = 1 WHERE User1 = @userid AND User2 = @myid;");

            db.sqlexecute.Parameters.Clear();
        }

        public void RejectAllBuddys(int myid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@myid", myid);

            db.ExecuteSQL("DELETE FROM MessengerBuddies WHERE User2 = @myid AND Accepted = 0;");

            db.sqlexecute.Parameters.Clear();
        }

        public void DeleteBuddy(int myid, int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.sqlexecute.Parameters.AddWithValue("@myid", myid);

            db.ExecuteSQL("DELETE FROM MessengerBuddies WHERE (User1 = @userid AND User2 = @myid) OR (User1 = @myid AND User2 = @userid) ");

            db.sqlexecute.Parameters.Clear();

        }

        public string BuildSearchResponse(string username)
        {
            ClientMessage mMessage = new ClientMessage();
            mMessage.Init(128); //B@
            mMessage.appendString("MESSENGER");
            mMessage.appendChar(2);

            if (InstanceManager.Game.Users.UserExists(username))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(username);

                mMessage.appendArgumentInt(user.userId);
                mMessage.appendString(user.sUsername);
                mMessage.appendChar(2);

                SessionHandler sess = InstanceManager.Sessions.GetSession(InstanceManager.Sessions.GetSessionFromUser(user.userId));

                if (user.sSex == "M") mMessage.appendArgumentInt(1);
                if (user.sSex == "F") mMessage.appendArgumentInt(0);

                if (sess != null)
                {
                    mMessage.appendChar(2);
                    mMessage.appendArgumentInt(1);
                    mMessage.appendString("Online");
                    mMessage.appendChar(2);
                }
                else
                {
                    mMessage.appendChar(2);
                    mMessage.appendArgumentInt(0);
                    mMessage.appendString(InstanceManager.Game.Externals.GetTextValue("BuddyNotHere"));
                    mMessage.appendChar(2);
                }

                mMessage.appendString(user.LastLogin.ToString("dd-MM-yyyy HH:mm:ss"));
                mMessage.appendChar(2);
                mMessage.appendString(user.sFigure);
                mMessage.appendChar(2);

            }
            else
            {
                mMessage.appendArgumentInt(0);
            }

            return mMessage.ToString();

        }

        public string BuildBuddyList(int userId)
        {
            List<MessengerBuddy> buddies = GetBuddyList(userId);
            StringBuilder sb = new StringBuilder();

            if (buddies != null)
            {

                foreach (MessengerBuddy buddy in buddies)
                {
                    UserInfo buddyUser = buddy.User1Info;
                    if (buddyUser.userId == userId) buddyUser = buddy.User2Info;
                    sb.Append(BuildMessengerBuddyResponse(buddyUser));
                }
                return sb.ToString();
            }
            return null;
        }





        public string BuildMessengerBuddyResponse(UserInfo buddyUser)
        {
            ClientMessage mMessage = new ClientMessage();
            SessionHandler sess = InstanceManager.Sessions.GetSession(InstanceManager.Sessions.GetSessionFromUser(buddyUser.userId));

            mMessage.Init(137); //BI
            mMessage.appendArgumentInt(buddyUser.userId);
            mMessage.appendString(buddyUser.sUsername);
            mMessage.appendChar(2);
            mMessage.appendString(buddyUser.MessengerStatus);
            mMessage.appendChar(2);

            if (sess != null)
            {
                mMessage.appendArgumentInt(1);
                if (sess.mRoomID == 0)
                {
                    mMessage.appendString(InstanceManager.Game.Externals.GetTextValue("BuddyEntry"));
                }
                else
                {
                    mMessage.appendString(InstanceManager.Game.Rooms.GetRoom(sess.mRoomID).RoomName);
                }
                mMessage.appendChar(2);

            }
            else
            {
                mMessage.appendArgumentInt(0);
                mMessage.appendChar(2);
                mMessage.appendString(buddyUser.LastLogin.ToString("dd-MM-yyyy HH:mm:ss"));
                mMessage.appendChar(2);
            }

            return mMessage.ToString();
        }


        public class MessengerBuddy
        {

            public MessengerBuddy(int user1, int user2, bool accepted)
            {
                User1 = user1;
                User2 = user2;
                Accepted = accepted;
                User1Info = InstanceManager.Game.Users.GetUser(User1);
                User2Info = InstanceManager.Game.Users.GetUser(User2);
            }

            public int User1;
            public int User2;
            public bool Accepted;
            public UserInfo User1Info;
            public UserInfo User2Info;
        }
    }
}
