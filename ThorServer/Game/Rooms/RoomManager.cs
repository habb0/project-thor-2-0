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

using System.Data.SqlClient;

using ThorServer.Data;
using ThorServer.Core;

namespace ThorServer.Game.Rooms
{
    public class RoomManager
    {
        private Dictionary<int, RoomInstance> mRoomInstances;

        public RoomManager()
        {
            mRoomInstances = new Dictionary<int, RoomInstance>();
            ResetUsers();
        }

        public int CreateRoom(string roomName, string roomModel, string roomState, int showOwner, int owner)
        {
            int roomType = GetRoomType(roomModel);
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@roomname", roomName);
            db.sqlexecute.Parameters.AddWithValue("@roomtype", roomType);
            db.sqlexecute.Parameters.AddWithValue("@roomstate", roomState);
            db.sqlexecute.Parameters.AddWithValue("@showowner", showOwner);
            db.sqlexecute.Parameters.AddWithValue("@owner", owner);
            SqlParameter identity = new SqlParameter("@identity", SqlDbType.Int);
            identity.Value = 0;
            identity.Direction = ParameterDirection.Output;
            db.sqlexecute.Parameters.Add(identity);


            db.ExecuteSQL("INSERT INTO Rooms (RoomName, RoomType, RoomStatus, ShowOwner, RoomOwner) VALUES (@roomname, @roomtype, @roomstate, @showowner, @owner); SET @identity = @@identity;");

            db.sqlexecute.Parameters.Clear();

            return (int) identity.Value;
        }

        public void UpdateRoom(RoomInfo room)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@roomid", room.RoomID);
            db.sqlexecute.Parameters.AddWithValue("@roomname", room.RoomName);
            db.sqlexecute.Parameters.AddWithValue("@roomtype", room.RoomType);
            db.sqlexecute.Parameters.AddWithValue("@roomstate", room.RoomStatus);
            db.sqlexecute.Parameters.AddWithValue("@showowner", room.ShowOwner);
            db.sqlexecute.Parameters.AddWithValue("@owner", room.RoomOwner);
            db.sqlexecute.Parameters.AddWithValue("@description", room.RoomDescription);
            db.sqlexecute.Parameters.AddWithValue("@password", room.Password);
            db.sqlexecute.Parameters.AddWithValue("@superusers", room.SuperUsers);
            db.sqlexecute.Parameters.AddWithValue("@wallpaper", room.Wallpaper);
            db.sqlexecute.Parameters.AddWithValue("@floor", room.Floor);
            db.sqlexecute.Parameters.AddWithValue("@category", room.RoomCategory);
            db.sqlexecute.Parameters.AddWithValue("@maxusers", room.MaxUsers);

            db.ExecuteSQL("UPDATE Rooms SET RoomName = @roomname, RoomType = @roomtype, RoomStatus = @roomstate, ShowOwner = @showowner, RoomOwner = @owner, RoomDescription = @description, Password = @password, SuperUsers = @superusers,Wallpaper = @wallpaper, Floor = @floor, CategoryID = @category, MaxUsers = @maxusers WHERE RoomID = @roomid;");

            db.sqlexecute.Parameters.Clear();

            if (InstanceExists(room.RoomID))
            {
                GetRoomInstance(room.RoomID).RoomInfo = GetRoom(room.RoomID);
            }
        }

        public RoomInfo GetRoom(int roomid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            DataRow dRow = db.GetDataSet("SELECT * FROM Rooms JOIN RoomTypes ON Rooms.RoomType = RoomTypes.RoomTypeID WHERE Rooms.RoomID = @roomid;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();

            return ProduceRoomFromRow(dRow);
        }

        public void DeleteRoom(int roomid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.ExecuteSQL("DELETE FROM Furni WHERE RoomID = @roomid;");
            db.ExecuteSQL("DELETE FROM Rooms WHERE RoomID = @roomid;");
            db.sqlexecute.Parameters.Clear();
        }

        public bool RoomExists(int roomid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            int rowCount = db.getInt("SELECT COUNT(*) FROM Rooms WHERE RoomID = @roomid;");
            db.sqlexecute.Parameters.Clear();

            return (rowCount > 0);
        }

        public List<RoomInfo> GetRoomList()
        {
            Database db = new Database();
            List<RoomInfo> results = new List<RoomInfo>();

            DataTable dTable = db.GetDataSet("SELECT * FROM Rooms JOIN RoomTypes ON Rooms.RoomType = RoomTypes.RoomTypeID WHERE CategoryID = @category ORDER BY RoomOrder ASC, CurrentUsers DESC;").Tables[0];
            
            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceRoomFromRow(dRow));
            }

            return results;
        }

        public List<RoomInfo> GetRoomListByCategory(int categoryId)
        {
            Database db = new Database();
            List<RoomInfo> results = new List<RoomInfo>();

            db.sqlexecute.Parameters.AddWithValue("@catid", categoryId);
            DataTable dTable = db.GetDataSet("SELECT TOP 50 * FROM Rooms JOIN RoomTypes ON Rooms.RoomType = RoomTypes.RoomTypeID WHERE CategoryID = @catid ORDER BY RoomOrder ASC, CurrentUsers DESC;").Tables[0];
            db.sqlexecute.Parameters.Clear();

            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceRoomFromRow(dRow));
            }

            return results;
        }

        public void UpdateUsers(int roomId, int currentUsers)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomId);
            db.sqlexecute.Parameters.AddWithValue("@currentusers", currentUsers);
            db.ExecuteSQL("UPDATE Rooms SET CurrentUsers = @currentusers WHERE RoomID = @roomid;");
            db.sqlexecute.Parameters.Clear();
        }

        public void ResetUsers()
        {
            Database db = new Database();

            db.ExecuteSQL("UPDATE Rooms SET CurrentUsers = 0;");
            db.sqlexecute.Parameters.Clear();
        }

        public List<RoomInfo> GetUserRoomList(int userId)
        {
            Database db = new Database();
            List<RoomInfo> results = new List<RoomInfo>();

            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            DataTable dTable = db.GetDataSet("SELECT TOP 50 * FROM Rooms JOIN RoomTypes ON Rooms.RoomType = RoomTypes.RoomTypeID WHERE RoomOwner = @userid ORDER BY CurrentUsers DESC;").Tables[0];
            db.sqlexecute.Parameters.Clear();

            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceRoomFromRow(dRow));
            }

            return results;
        }

        public List<RoomInfo> GetSearchRoomList(string criteria)
        {
            Database db = new Database();
            List<RoomInfo> results = new List<RoomInfo>();

            db.sqlexecute.Parameters.AddWithValue("@criteria", criteria);
            db.sqlexecute.Parameters.AddWithValue("@plain", criteria.Replace("%", ""));
            DataTable dTable = db.GetDataSet("SELECT TOP 50 * FROM Rooms JOIN RoomTypes ON Rooms.RoomType = RoomTypes.RoomTypeID JOIN Users ON Users.UserID = Rooms.RoomOwner WHERE (Username = @plain OR RoomName LIKE @criteria) AND RoomOwner > 0 ORDER BY CurrentUsers DESC;").Tables[0];
            db.sqlexecute.Parameters.Clear();

            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceRoomFromRow(dRow));
            }

            return results;
        }

        private RoomInfo ProduceRoomFromRow(DataRow dRow)
        {
            RoomInfo roomInfo = new RoomInfo();

            roomInfo.RoomID = int.Parse(dRow["RoomID"].ToString());
            roomInfo.RoomName = dRow["RoomName"].ToString();
            roomInfo.RoomDescription = dRow["RoomDescription"].ToString();
            roomInfo.RoomStatus = dRow["RoomStatus"].ToString();
            roomInfo.RoomOwner = int.Parse(dRow["RoomOwner"].ToString());
            roomInfo.RoomType = int.Parse(dRow["RoomType"].ToString());
            roomInfo.RoomCategory = int.Parse(dRow["CategoryID"].ToString());
            roomInfo.TypeName = dRow["FriendlyName"].ToString();
            roomInfo.RoomModel = dRow["RoomModel"].ToString();
            roomInfo.DefaultHeightmap = dRow["DefaultHeightmap"].ToString().Replace('|', Convert.ToChar(13));
            roomInfo.StartX = int.Parse(dRow["StartX"].ToString());
            roomInfo.StartY = int.Parse(dRow["StartY"].ToString());
            roomInfo.StartZ = int.Parse(dRow["StartZ"].ToString());
            roomInfo.MaxUsers = int.Parse(dRow["MaxUsers"].ToString());
            roomInfo.Wallpaper = int.Parse(dRow["Wallpaper"].ToString());
            roomInfo.Floor = int.Parse(dRow["Floor"].ToString());
            roomInfo.ReactorType = dRow["ReactorType"].ToString();
            roomInfo.CCTs = dRow["CCTs"].ToString();
            roomInfo.IsGuestRoom = bool.Parse(dRow["Guest"].ToString());
            roomInfo.SuperUsers = int.Parse(dRow["SuperUsers"].ToString());
            roomInfo.ShowOwner = int.Parse(dRow["ShowOwner"].ToString());
            roomInfo.UserType = int.Parse(dRow["UserType"].ToString());
            roomInfo.Password = dRow["Password"].ToString();
            roomInfo.CurrentUsers = int.Parse(dRow["CurrentUsers"].ToString());
            roomInfo.UserType = int.Parse(dRow["UserType"].ToString());
            roomInfo.MaxAscend = float.Parse(dRow["MaxAscend"].ToString());
            roomInfo.MaxDescend  = float.Parse(dRow["MaxDescend"].ToString());

            return roomInfo;
        }

        public RoomInstance GetRoomInstance(int roomId)
        {
            if (!InstanceExists(roomId))
            {
                Logging.LogEvent("Creating room instance " + roomId.ToString(), Logging.LogLevel.Info);
                mRoomInstances.Add(roomId, new RoomInstance(roomId));
            }

            return mRoomInstances[roomId];
        }

        public bool InstanceExists(int roomId)
        {
            return mRoomInstances.ContainsKey(roomId);
        }

        public void DestroyRoomInstance(int roomId)
        {
            if (InstanceExists(roomId))
            {
                Logging.LogEvent("Destroying room instance " + roomId.ToString(), Logging.LogLevel.Info);

                mRoomInstances[roomId].DestroyRoom();
                mRoomInstances[roomId] = null;
                mRoomInstances.Remove(roomId);
            }
        }

        public List<RoomCategory> GetCategoryList()
        {
            Database db = new Database();
            List<RoomCategory> results = new List<RoomCategory>();

            DataTable dTable = db.GetDataSet("SELECT * FROM RoomCategories;").Tables[0];

            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceCategoryFromRow(dRow));
            }

            return results;
        }

        public List<RoomCategory> GetSubCategoryList(int parentId)
        {
            Database db = new Database();
            List<RoomCategory> results = new List<RoomCategory>();

            db.sqlexecute.Parameters.AddWithValue("@parent", parentId);
            DataTable dTable = db.GetDataSet("SELECT * FROM RoomCategories WHERE RoomCategoryParent = @parent ORDER BY CategoryOrder ASC;").Tables[0];
            db.sqlexecute.Parameters.Clear();

            foreach (DataRow dRow in dTable.Rows)
            {
                results.Add(ProduceCategoryFromRow(dRow));
            }

            return results;
        }

        public int GetRoomType(string modelName)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@modelname", modelName);
            int rest = db.getInt("SELECT RoomTypeID FROM RoomTypes WHERE RoomModel = @modelname;");
            db.sqlexecute.Parameters.Clear();
            return rest;
        }

        public bool UserRoomExists(string modelName)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@modelname", modelName);
            int rest = db.getInt("SELECT COUNT(RoomTypeID) FROM RoomTypes WHERE RoomModel = @modelname AND Guest = 1;");
            db.sqlexecute.Parameters.Clear();
            return rest > 0;
        }

        public int GetUserType(string modelName)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@modelname", modelName);
            int rest = db.getInt("SELECT UserType FROM RoomTypes WHERE RoomModel = @modelname;");
            db.sqlexecute.Parameters.Clear();
            return rest;
        }

        public RoomCategory GetCategory(int catId)
        {
            try
            {
                Database db = new Database();

                db.sqlexecute.Parameters.AddWithValue("@catid", catId);
                DataRow dRow = db.GetDataSet("SELECT * FROM RoomCategories WHERE RoomCategoryID = @catid;").Tables[0].Rows[0];
                db.sqlexecute.Parameters.Clear();

                return ProduceCategoryFromRow(dRow);
            }
            catch
            {
                return null;
            }
        }

        private RoomCategory ProduceCategoryFromRow(DataRow dRow)
        {
            try
            {
                RoomCategory roomCat = new RoomCategory();

                roomCat.CategoryID = int.Parse(dRow["RoomCategoryID"].ToString());
                roomCat.CategoryName = dRow["RoomCategoryName"].ToString();
                roomCat.ParentCategory = int.Parse(dRow["RoomCategoryParent"].ToString());
                roomCat.RoomCategoryType = int.Parse(dRow["RoomCategoryType"].ToString());
                roomCat.CanTrade = int.Parse(dRow["CanTrade"].ToString());
                roomCat.IsVisible = (bool)dRow["IsVisible"];
                roomCat.PlayerCategory = (bool)dRow["PlayerCategory"];
                roomCat.SystemCategory = (bool)dRow["SystemCategory"];

                return roomCat;
            }
            catch
            {
                return null;
            }
        }

        public int GetRoomStateInt(string state)
        {
            switch (state)
            {
                case "open":
                    return 0;
                case "closed":
                    return 1;
                case "password":
                    return 2;
                default:
                    return -1;
            }
        }

        public string GetRoomStateString(int state)
        {
            switch(state)
            {
                case 0:
                    return "open";
                case 1:
                    return "closed";
                case 2:
                    return "password";
                default:
                    return "unknown"; 
            }
        }

        public bool HasRights(int roomid, int userid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);
            int rowCount = db.getInt("SELECT COUNT(*) FROM RoomRights WHERE RoomID = @roomid AND UserID = @userid;");
            db.sqlexecute.Parameters.Clear();

            return (rowCount > 0);
        }

        public void AddRights(int roomid, int userid)
        {
            if (HasRights(roomid, userid)) return;

            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);
            db.ExecuteSQL("INSERT INTO RoomRights (RoomID, UserID) VALUES (@roomid, @userid);");
            db.sqlexecute.Parameters.Clear();

        }

        public void DeleteRights(int roomid, int userid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.sqlexecute.Parameters.AddWithValue("@userid", userid);
            db.ExecuteSQL("DELETE FROM RoomRights WHERE RoomID = @roomid AND UserID = @userid;");
            db.sqlexecute.Parameters.Clear();

        }

        public void DeleteAllRights(int roomid)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.ExecuteSQL("DELETE FROM RoomRights WHERE RoomID = @roomid;");
            db.sqlexecute.Parameters.Clear();

        }


    }
}
