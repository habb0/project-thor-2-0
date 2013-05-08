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

namespace ThorServer.Game.Furni
{
    public class FurniManager
    {

        public List<FurniInfo> GetRoomFloorFurni(int roomId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomId);
            DataTable dt = db.GetDataSet("SELECT * FROM Furni JOIN FurniDefinitions ON Furni.FurniTypeID = FurniDefinitions.FurniDefinitionID WHERE RoomID = @roomid;").Tables[0];
            db.sqlexecute.Parameters.Clear();
            List<FurniInfo> results = new List<FurniInfo>();
            foreach (DataRow dRow in dt.Rows)
            {
                FurniInfo info = ProcessDataRow(dRow);

                if (!info.Flags.WallItem)
                {
                    results.Add(info);
                }
            }

            return results;
        }

        public List<FurniInfo> GetRoomWallFurni(int roomId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@roomid", roomId);
            DataTable dt = db.GetDataSet("SELECT * FROM Furni JOIN FurniDefinitions ON Furni.FurniTypeID = FurniDefinitions.FurniDefinitionID WHERE RoomID = @roomid").Tables[0];
            db.sqlexecute.Parameters.Clear();
            List<FurniInfo> results = new List<FurniInfo>();
            foreach (DataRow dRow in dt.Rows)
            {
                FurniInfo info = ProcessDataRow(dRow);

                if (info.Flags.WallItem)
                {
                    results.Add(info);
                }
            }

            return results;
        }

        public List<FurniInfo> GetHandFurniList(int ownerId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@ownerid", ownerId);
            DataTable dt = db.GetDataSet("SELECT * FROM Furni JOIN FurniDefinitions ON Furni.FurniTypeID = FurniDefinitions.FurniDefinitionID WHERE OwnerID = @ownerid AND RoomID = 0;").Tables[0];
            db.sqlexecute.Parameters.Clear();
            List<FurniInfo> results = new List<FurniInfo>();
            foreach (DataRow dRow in dt.Rows)
            {
                results.Add(ProcessDataRow(dRow));
            }

            return results;
        }

        public FurniInfo GetFurni(int furniId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniId);
            DataRow dRow = db.GetDataSet("SELECT * FROM Furni JOIN FurniDefinitions ON Furni.FurniTypeID = FurniDefinitions.FurniDefinitionID WHERE FurniID = @furniid;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();
            
            return ProcessDataRow(dRow);
        }

        public bool FurniExists(int furniId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniId);
            int res = db.getInt("SELECT COUNT(*) FROM Furni WHERE FurniID = @furniid;");
            db.sqlexecute.Parameters.Clear();

            return res > 0;
        }

        public int GetStickyType(string colour)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@colour", colour);
            int res = db.getInt("SELECT COUNT(*) FROM FurniDefinitions WHERE Col = @colour AND Flags LIKE '%N%';");
            

            if (res > 0)
            {
                res = db.getInt("SELECT FurniDefinitionID FROM FurniDefinitions WHERE Col = @colour AND Flags LIKE '%N%';");
            }

            db.sqlexecute.Parameters.Clear();

            return res;
        }

        public int GetTypeFromSprite(string sprite)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@sprite", sprite);
            int res = db.getInt("SELECT COUNT(*) FROM FurniDefinitions WHERE Sprite = @sprite;");


            if (res > 0)
            {
                res = db.getInt("SELECT FurniDefinitionID FROM FurniDefinitions WHERE Sprite = @sprite;");
            }

            db.sqlexecute.Parameters.Clear();

            return res;
        }

        public void MoveFloorItem(int furniID, int newX, int newY, float newZ, int newRot, Rooms.RoomInfo rInfo)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniID);
            db.sqlexecute.Parameters.AddWithValue("@newx", newX);
            db.sqlexecute.Parameters.AddWithValue("@newy", newY);
            db.sqlexecute.Parameters.AddWithValue("@newz", newZ);
            db.sqlexecute.Parameters.AddWithValue("@newrot", newRot);
            db.sqlexecute.Parameters.AddWithValue("@roomid", rInfo.RoomID);
            db.sqlexecute.Parameters.AddWithValue("@owner", rInfo.RoomOwner);

            db.ExecuteSQL("UPDATE Furni SET PosX = @newx, PosY = @newy, PosZ = @newz, PosRotation = @newrot, RoomID = @roomid, OwnerID = @owner WHERE FurniID = @furniid;");

            db.sqlexecute.Parameters.Clear();
        }

        public int CreateNewFurni(int furniTypeID, int userId)
        {
            Database db = new Database();

            SqlParameter identity = new SqlParameter("@identity", SqlDbType.Int);
            identity.Value = 0;
            identity.Direction = ParameterDirection.Output;
            db.sqlexecute.Parameters.Add(identity);
            db.sqlexecute.Parameters.AddWithValue("@furnitype", furniTypeID);
            db.sqlexecute.Parameters.AddWithValue("@owner", userId);

            db.ExecuteSQL("INSERT INTO Furni (FurniTypeID, OwnerID) VALUES (@furnitype, @owner); SET @identity = @@identity;");

            db.sqlexecute.Parameters.Clear();

            return (int)identity.Value;
        }

        public void SetStuffDataFloorItem(int furniID, string stuffdata)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniID);
            db.sqlexecute.Parameters.AddWithValue("@stuff", stuffdata);
            db.ExecuteSQL("UPDATE Furni SET FurniVar = @stuff WHERE FurniID = @furniid;");
            db.sqlexecute.Parameters.Clear();
        }

        public void SetTeleportID(int furniID, int teleId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniID);
            db.sqlexecute.Parameters.AddWithValue("@tele", teleId);
            db.ExecuteSQL("UPDATE Furni SET TeleportID = @tele WHERE FurniID = @furniid;");
            db.sqlexecute.Parameters.Clear();
        }

        public void SetItemType(int furniID, int itemType)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniID);
            db.sqlexecute.Parameters.AddWithValue("@type", itemType);
            db.ExecuteSQL("UPDATE Furni SET FurniTypeID = @type WHERE FurniID = @furniid;");
            db.sqlexecute.Parameters.Clear();
        }

        public void DeleteFurni(int furniID)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furniID);
            db.ExecuteSQL("DELETE FROM Furni WHERE FurniID = @furniid;");
            db.sqlexecute.Parameters.Clear();
        }

        public void MoveWallItem(int furnID, string newPos, int roomid, int owner)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furnID);
            db.sqlexecute.Parameters.AddWithValue("@newpos", newPos);
            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.sqlexecute.Parameters.AddWithValue("@owner", owner);

            db.ExecuteSQL("UPDATE Furni SET WallLocation = @newpos, RoomID = @roomid, OwnerID = @owner WHERE FurniID = @furniid;");

            db.sqlexecute.Parameters.Clear();
        }

        public void PickupItem(int furnID, int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@furniid", furnID);
            db.sqlexecute.Parameters.AddWithValue("@ownerid", userId);

            db.ExecuteSQL("UPDATE Furni SET OwnerID = @ownerid, PosX = 0, PosY = 0, PosZ = 0, PosRotation = 0, RoomID = 0, WallLocation = '' WHERE FurniID = @furniid;");

            db.sqlexecute.Parameters.Clear();
        }

        private FurniInfo ProcessDataRow(DataRow dRow)
        {
            FurniInfo info = new FurniInfo();

            
            info.FurniID = int.Parse(dRow["FurniID"].ToString());
            info.RoomID = int.Parse(dRow["RoomID"].ToString());
            info.FurniDefinitionID= int.Parse(dRow["FurniDefinitionID"].ToString());
            info.PosX = int.Parse(dRow["PosX"].ToString());
            info.PosY = int.Parse(dRow["PosY"].ToString());
            info.PosZ = float.Parse(dRow["PosZ"].ToString());
            info.W = int.Parse(dRow["W"].ToString());
            info.L = int.Parse(dRow["L"].ToString());
            info.Col = dRow["Col"].ToString();
            info.PosRotation = int.Parse(dRow["PosRotation"].ToString());
            info.OwnerID = int.Parse(dRow["OwnerID"].ToString());
            info.FurniSprite = dRow["Sprite"].ToString();
            info.FurniFlags = dRow["Flags"].ToString();
            info.FurniVar = dRow["FurniVar"].ToString();
            info.HeightOffset = float.Parse(dRow["HeightOffset"].ToString());
            info.HandType = dRow["HandType"].ToString();
            info.WallLocation = dRow["WallLocation"].ToString();
            info.VarType = (FurniInfo.VarTypes) int.Parse(dRow["VarType"].ToString());
            info.FurniName = GetItemName(info.Flags.WallItem, info.FurniSprite, info.Col);
            info.FurniDesc = GetItemDesc(info.Flags.WallItem, info.FurniSprite, info.Col);
            info.TeleportId = (int)dRow["TeleportId"];
            info.FurniTypeId = (int)dRow["FurniTypeID"];
            info.ActionHeight = float.Parse(dRow["ActionHeight"].ToString());
            info.CanTrade = (bool)dRow["CanTrade"];
            info.PublicFurni = (bool)dRow["PublicFurni"];
            info.ProcessFlags();

            return info;
            
        }

        public int GetRandomPresentDefinition()
        {
            Database db = new Database();
            return db.getInt("SELECT TOP 1 FurniDefinitionID FROM FurniDefinitions WHERE Flags LIKE '%G%' ORDER BY NEWID();");
        }

        public void AddGift(GiftInfo info)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@giftid", info.GiftId);
            db.sqlexecute.Parameters.AddWithValue("@purchasecode", info.PurchaseCode);
            db.sqlexecute.Parameters.AddWithValue("@payload", info.Payload);

            db.ExecuteSQL("INSERT INTO Gifts (GiftID, PurchaseCode, Payload) VALUES (@giftid, @purchasecode, @payload);");

            db.sqlexecute.Parameters.Clear();

        }

        public GiftInfo GetGift(int giftId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@giftid", giftId);
            DataRow dRow = db.GetDataSet("SELECT * FROM Gifts Where GiftID = @giftid;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();

            GiftInfo info = new GiftInfo();

            info.GiftId = (int)dRow["GiftID"];
            info.Payload = dRow["Payload"].ToString();
            info.PurchaseCode = dRow["PurchaseCode"].ToString();

            return info;
        }

        public void DeleteGift(int giftId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@giftid", giftId);
            db.ExecuteSQL("DELETE FROM Gifts Where GiftID = @giftid;");
            db.sqlexecute.Parameters.Clear();
        }

        public string GetItemName(bool wallItem, string sprite, string extra)
        {
            if (wallItem)
            {
                if (sprite == "poster")
                {
                    return InstanceManager.Game.Externals.GetTextValue("poster_" + extra + "_name");
                }
                else
                {
                    return InstanceManager.Game.Externals.GetTextValue("wallitem_" + sprite + "_name");
                }
                
            }
            else
            {
                return InstanceManager.Game.Externals.GetTextValue("furni_" + sprite + "_name");
            }
        }

        public string GetItemDesc(bool wallItem, string sprite, string extra)
        {
            if (wallItem)
            {
                if (sprite == "poster")
                {
                    return InstanceManager.Game.Externals.GetTextValue("poster_" + extra + "_desc");
                }
                else
                {
                    return InstanceManager.Game.Externals.GetTextValue("wallitem_" + sprite + "_desc");
                }

            }
            else
            {
                return InstanceManager.Game.Externals.GetTextValue("furni_" + sprite + "_desc");
            }
        }
    }
}
