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

namespace ThorServer.Game.Catalogue
{
    public class CatalogueManager
    {

        public List<string> GetPurchaseCodes()
        {
            Database db = new Database();
            List<string> results = new List<string>();

            DataTable table = db.GetDataSet("SELECT * FROM CatalogueItems;").Tables[0];

            foreach (DataRow dRow in table.Rows)
            {
                results.Add(dRow["PurchaseCode"].ToString());
            }

            return results;
        }

        public bool BuyItem(string isGift, string purchaseCode, string packetBody, ref Users.UserInfo info, bool noCredits, ref int newId)
        {
            info = InstanceManager.Game.Users.GetUser(info.userId);

            ClientMessage mMessage = new ClientMessage();
            
            try
            {
                if (purchaseCode == "special_floor" || purchaseCode == "special_wallpaper")
                {


                    string type = "";
                    if (purchaseCode == "special_floor") type = "floor";
                    if (purchaseCode == "special_wallpaper") type = "wallpaper";
                    int decorationId = int.Parse(packetBody.Split(Convert.ToChar(13))[4]);
                    int typeId = InstanceManager.Game.Furni.GetTypeFromSprite(type);

                    if (typeId > 0)
                    {
                        if (info.iCredits >= 2 || noCredits)
                        {


                            if (!noCredits)
                            {
                                info.iCredits -= 2;
                                InstanceManager.Game.Users.UpdateUser(info);
                                info = InstanceManager.Game.Users.GetUser(info.userId);
                            }

                            if (isGift == "1")
                            {
                                string targetUser = packetBody.Split(Convert.ToChar(13))[6];
                                string desc = SpecialFiltering.FilterChars("2,9,10,13,47", packetBody.Split(Convert.ToChar(13))[7]);
                                if (desc.Length > 202) desc = desc.Substring(0, 202);

                                if (InstanceManager.Game.Users.UserExists(targetUser))
                                {
                                    Users.UserInfo giftUser = InstanceManager.Game.Users.GetUser(targetUser);

                                    newId = InstanceManager.Game.Furni.CreateNewFurni(InstanceManager.Game.Furni.GetRandomPresentDefinition(), giftUser.userId);
                                    Furni.GiftInfo gift = new ThorServer.Game.Furni.GiftInfo();
                                    gift.GiftId = newId;
                                    gift.PurchaseCode = purchaseCode;
                                    gift.Payload = packetBody;
                                    InstanceManager.Game.Furni.AddGift(gift);
                                    InstanceManager.Game.Furni.SetStuffDataFloorItem(newId, "!" + desc);

                                    long tmpSession = InstanceManager.Sessions.GetSessionFromUser(giftUser.userId);
                                    if (tmpSession != -1)
                                    {
                                        InstanceManager.Sessions.InvokeReactorMethod(tmpSession, "UpdateHandInvoker");
                                    }
                                    return true;
                                }


                            }
                            else
                            {


                                int itemId = InstanceManager.Game.Furni.CreateNewFurni(typeId, info.userId);
                                newId = itemId;
                                InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, decorationId.ToString());
                                return true;
                            }

                            
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        return true;
                    }
                }
                else
                {

                    CatalogueItemInfo item = InstanceManager.Game.Catalogue.GetCatalogueItem(purchaseCode);
                    if (item != null)
                    {
                        if (!item.StaffOnly || InstanceManager.Game.Roles.HasRight(info.iRole, "fuse_staff_catalogue") || noCredits)
                        {
                            if (info.iCredits >= item.ItemCost || noCredits)
                            {

                                if (!noCredits)
                                {
                                    info.iCredits -= item.ItemCost;
                                    InstanceManager.Game.Users.UpdateUser(info);
                                    info = InstanceManager.Game.Users.GetUser(info.userId);
                                }

                                if (isGift == "1")
                                {
                                    string targetUser = packetBody.Split(Convert.ToChar(13))[6];
                                    string desc = SpecialFiltering.FilterChars("2,9,10,13,47", packetBody.Split(Convert.ToChar(13))[7]);
                                    if (desc.Length > 202) desc = desc.Substring(0, 202);

                                    if (InstanceManager.Game.Users.UserExists(targetUser))
                                    {
                                        Users.UserInfo giftUser = InstanceManager.Game.Users.GetUser(targetUser);

                                        newId = InstanceManager.Game.Furni.CreateNewFurni(InstanceManager.Game.Furni.GetRandomPresentDefinition(), giftUser.userId);
                                        Furni.GiftInfo gift = new ThorServer.Game.Furni.GiftInfo();
                                        gift.GiftId = newId;
                                        gift.PurchaseCode = purchaseCode;
                                        gift.Payload = packetBody;
                                        InstanceManager.Game.Furni.AddGift(gift);
                                        InstanceManager.Game.Furni.SetStuffDataFloorItem(newId, "!" + desc);
                                        long tmpSession = InstanceManager.Sessions.GetSessionFromUser(giftUser.userId);
                                        if (tmpSession != -1)
                                        {
                                            InstanceManager.Sessions.InvokeReactorMethod(tmpSession, "UpdateHandInvoker");
                                        }
                                        return true;
                                    }


                                }
                                else
                                {
                                    int itemId = InstanceManager.Game.Furni.CreateNewFurni(item.FurniType, info.userId);
                                    newId = itemId;
                                    if (purchaseCode.StartsWith("special_teleporter_"))
                                    {
                                        int itemId2 = InstanceManager.Game.Furni.CreateNewFurni(item.FurniType, info.userId);
                                        InstanceManager.Game.Furni.SetTeleportID(itemId, itemId2);
                                        InstanceManager.Game.Furni.SetTeleportID(itemId2, itemId);
                                    }

                                    if (item.Sticky)
                                    {
                                        InstanceManager.Game.Furni.SetStuffDataFloorItem(itemId, "20");
                                    }

                                    return true;
                                }
                            }
                            else
                            {
                                return false;
                            }
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch
            {
                return false;
            }

            return false;
        }

        public List<CataloguePage> GetPages()
        {
            Database db = new Database();
            List<CataloguePage> results = new List<CataloguePage>();

            DataTable table =  db.GetDataSet("SELECT * FROM CataloguePages ORDER BY PageOrder ASC;").Tables[0];

            foreach (DataRow dRow in table.Rows)
            {
                results.Add(ProcessCataloguePageDataRow(dRow));
            }

            return results;
        }

        public CataloguePage GetPage(string pageName)
        {
            Database db = new Database();
            List<CataloguePage> results = new List<CataloguePage>();
            db.sqlexecute.Parameters.AddWithValue("@pagename", pageName);
            DataRow dRow = db.GetDataSet("SELECT * FROM CataloguePages WHERE PageName = @pagename;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();
            return ProcessCataloguePageDataRow(dRow);
        }

        private CataloguePage ProcessCataloguePageDataRow(DataRow dRow)
        {
            CataloguePage cp = new CataloguePage();

            cp.PageId = (int)dRow["PageID"];
            cp.PageName = dRow["PageName"].ToString();
            cp.PageVisibleName = dRow["PageVisibleName"].ToString();
            cp.PageOrder = (int)dRow["PageOrder"];
            cp.PageLayout = dRow["PageLayout"].ToString();
            cp.PageImageTitle = dRow["PageImageTitle"].ToString();
            cp.PageSideImage = dRow["PageSideImage"].ToString();
            cp.PageDescription = dRow["PageDescription"].ToString();
            cp.PageLabel = dRow["PageLabel"].ToString();
            cp.PageAdditional = dRow["PageAdditional"].ToString();
            cp.StaffOnly = (bool) dRow["StaffOnly"];

            return cp;
        }

        public List<CatalogueItemInfo> GetCatalogueItems(int pageId)
        {
            Database db = new Database();
            List<CatalogueItemInfo> results = new List<CatalogueItemInfo>();

            db.sqlexecute.Parameters.AddWithValue("@catpageid", pageId);
            DataTable table = db.GetDataSet("SELECT * FROM CatalogueItems JOIN FurniDefinitions ON FurniDefinitions.FurniDefinitionID = CatalogueFurniType JOIN CataloguePages ON CatalogueItems.CataloguePageID = CataloguePages.PageID WHERE CataloguePageID = @catpageid;").Tables[0];
            db.sqlexecute.Parameters.Clear();

            foreach (DataRow dRow in table.Rows)
            {
                results.Add(ProcessCatalogueItemInfoDataRow(dRow));
            }

            return results;
        }

        public List<CatalogueItemInfo> GetAllCatalogueItems()
        {
            Database db = new Database();
            List<CatalogueItemInfo> results = new List<CatalogueItemInfo>();

            DataTable table = db.GetDataSet("SELECT * FROM CatalogueItems JOIN FurniDefinitions ON FurniDefinitions.FurniDefinitionID = CatalogueFurniType JOIN CataloguePages ON CatalogueItems.CataloguePageID = CataloguePages.PageID;").Tables[0];

            foreach (DataRow dRow in table.Rows)
            {
                results.Add(ProcessCatalogueItemInfoDataRow(dRow));
            }

            return results;
        }

        public CatalogueItemInfo GetCatalogueItem(string purchaseCode)
        {
            Database db = new Database();
            List<CatalogueItemInfo> results = new List<CatalogueItemInfo>();

            db.sqlexecute.Parameters.AddWithValue("@purchasecode", purchaseCode);
            DataRow dRow = db.GetDataSet("SELECT * FROM CatalogueItems JOIN FurniDefinitions ON FurniDefinitions.FurniDefinitionID = CatalogueFurniType JOIN CataloguePages ON CatalogueItems.CataloguePageID = CataloguePages.PageID WHERE PurchaseCode = @purchasecode;").Tables[0].Rows[0];
            db.sqlexecute.Parameters.Clear();


            return ProcessCatalogueItemInfoDataRow(dRow);
        }

        private CatalogueItemInfo ProcessCatalogueItemInfoDataRow(DataRow dRow)
        {
            CatalogueItemInfo cItem = new CatalogueItemInfo();

            cItem.FurniSprite = dRow["Sprite"].ToString();
            cItem.WallItem =  dRow["Flags"].ToString().Contains('V');
            cItem.Col = dRow["Col"].ToString();
            cItem.FurniName = InstanceManager.Game.Furni.GetItemName(cItem.WallItem, cItem.FurniSprite, cItem.Col);
            cItem.FurniDesc = InstanceManager.Game.Furni.GetItemDesc(cItem.WallItem, cItem.FurniSprite, cItem.Col);
            cItem.W = (int) dRow["W"];
            cItem.L = (int)dRow["L"];
            cItem.ItemCost = (int) dRow["ItemCost"];
            cItem.HandType = dRow["HandType"].ToString();
            cItem.PurchaseCode = dRow["PurchaseCode"].ToString();
            cItem.FurniType = (int) dRow["CatalogueFurniType"];
            cItem.Sticky = dRow["Flags"].ToString().Contains('N');
            cItem.StaffOnly = (bool)dRow["StaffOnly"];
            return cItem;
        }

        public bool VoucherValid(string voucherCode)
        {
            Database db = new Database();
           
            db.sqlexecute.Parameters.AddWithValue("@vouchercode", voucherCode);
            int res = db.getInt("SELECT COUNT(*) FROM Vouchers WHERE VoucherCode = @vouchercode AND Redeemed = 0;");
            db.sqlexecute.Parameters.Clear();

            return res > 0;
        }

        public bool VoucherExists(string voucherCode)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@vouchercode", voucherCode);
            int res = db.getInt("SELECT COUNT(*) FROM Vouchers WHERE VoucherCode = @vouchercode;");
            db.sqlexecute.Parameters.Clear();

            return res > 0;
        }

        public int GetVoucherAmount(string voucherCode)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@vouchercode", voucherCode);
            int res = db.getInt("SELECT VoucherAmount FROM Vouchers WHERE VoucherCode = @vouchercode;");
            db.sqlexecute.Parameters.Clear();

            return res;
        }

        public void MarkVoucherAsRedeemed(string voucherCode, int userId)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@vouchercode", voucherCode);
            db.sqlexecute.Parameters.AddWithValue("@userid", userId);
            db.ExecuteSQL("UPDATE Vouchers SET Redeemed = 1, RedeemedBy = @userid WHERE VoucherCode = @vouchercode;");
            db.sqlexecute.Parameters.Clear();
        }

        public void CreateVoucher(string voucherCode, int amount)
        {
            Database db = new Database();

            db.sqlexecute.Parameters.AddWithValue("@vouchercode", voucherCode);
            db.sqlexecute.Parameters.AddWithValue("@amount", amount);
            db.ExecuteSQL("INSERT INTO Vouchers (VoucherCode, VoucherAmount, Redeemed, RedeemedBy) VALUES (@vouchercode, @amount, 0, 0);");
            db.sqlexecute.Parameters.Clear();
        }
    }
}
