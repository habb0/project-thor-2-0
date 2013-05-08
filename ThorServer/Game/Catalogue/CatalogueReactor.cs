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

using ThorServer.Core;
using ThorServer.Utilities;

namespace ThorServer.Game.Catalogue
{
    public class CatalogueReactor : Reactor
    {
        //100 - "GPRC": "Ad"
        public void Listener100()
        {
            mUserInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);

            string purchaseCode = mPacketBody.Split(Convert.ToChar(13))[3];
            string isGift = mPacketBody.Split(Convert.ToChar(13))[5];
            int newId = 0;
            if (InstanceManager.Game.Catalogue.BuyItem(isGift, purchaseCode, mPacketBody, ref mUserInfo, false, ref newId))
            {
                mMessage.Init(67); //AC
                SendMessage(mMessage);

                mMessage.Init(6); //@F
                mMessage.appendString(mUserInfo.iCredits.ToString() + ".0");
                SendMessage(mMessage);

                InstanceManager.Sessions.InvokeReactorMethod(mSessionID, "UpdateHandInvoker");
            }
            else
            {
                mMessage.Init(68); // AD
                SendMessage(mMessage);
            }

        }


        //101 - "GCIX": "Ae"
        public void Listener101()
        {
            mMessage.Init(126); //A~

            List<CataloguePage> pages = InstanceManager.Game.Catalogue.GetPages();

            foreach (CataloguePage page in pages)
            {
                if (!page.StaffOnly || InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_staff_catalogue"))
                {
                    mMessage.appendString(page.PageName);
                    mMessage.appendChar(9);
                    mMessage.appendString(page.PageVisibleName);
                    mMessage.appendChar(13);
                }
            }

            SendMessage(mMessage);
        }

        //102 - "GCAP": "Af"
        public void Listener102()
        {
            mMessage.Init(127); //A

            string pageName = mPacketBody.Split('/')[1];
            CataloguePage page = InstanceManager.Game.Catalogue.GetPage(pageName);
            if (!page.StaffOnly || InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_staff_catalogue"))
            {
                //Page index
                mMessage.appendString("i:");
                mMessage.appendString(page.PageName);
                mMessage.appendChar(13);

                //Page Public Name
                mMessage.appendString("n:");
                mMessage.appendString(page.PageVisibleName);
                mMessage.appendChar(13);

                //Page Layout
                mMessage.appendString("l:");
                mMessage.appendString(page.PageLayout);
                mMessage.appendChar(13);

                //Image Header
                if (page.PageImageTitle != "")
                {
                    mMessage.appendString("g:");
                    mMessage.appendString(page.PageImageTitle);
                    mMessage.appendChar(13);
                }

                //Side Image
                if (page.PageSideImage != "")
                {
                    mMessage.appendString("e:");
                    mMessage.appendString(page.PageSideImage);
                    mMessage.appendChar(13);
                }

                //Description
                if (page.PageDescription != "")
                {
                    mMessage.appendString("h:");
                    mMessage.appendString(page.PageDescription);
                    mMessage.appendChar(13);
                }

                //Page Label
                if (page.PageLabel != "")
                {
                    mMessage.appendString("h:");
                    mMessage.appendString(page.PageLabel);
                    mMessage.appendChar(13);
                }

                //Page Additional
                if (page.PageAdditional != "")
                {
                    mMessage.appendString(page.PageAdditional.Replace('|', Convert.ToChar(13)));
                    mMessage.appendChar(13);
                }

                List<CatalogueItemInfo> items = InstanceManager.Game.Catalogue.GetCatalogueItems(page.PageId);

                if (items.Count > 0)
                {
                    foreach (CatalogueItemInfo item in items)
                    {
                        mMessage.appendString("p:");
                        mMessage.appendString(item.FurniName);
                        mMessage.appendChar(9);
                        mMessage.appendString(item.FurniDesc);
                        mMessage.appendChar(9);
                        mMessage.appendInt(item.ItemCost);
                        mMessage.appendChar(9);
                        mMessage.appendChar(9);
                        mMessage.appendString(item.HandType.ToLower());
                        mMessage.appendChar(9);
                        mMessage.appendString(item.FurniSprite);

                        if (item.WallItem)
                        {
                            mMessage.appendString(" ");
                            if (!item.Sticky)
                            {
                                mMessage.appendString(item.Col);
                            }
                            else
                            {
                                mMessage.appendInt(20);
                            }
                            mMessage.appendChar(9);
                            mMessage.appendChar(9);
                            mMessage.appendChar(9);
                        }
                        else
                        {
                            mMessage.appendChar(9);
                            mMessage.appendInt(0);
                            mMessage.appendChar(9);
                            mMessage.appendInt(item.W);
                            mMessage.appendString(",");
                            mMessage.appendInt(item.L);
                            mMessage.appendChar(9);
                        }

                        mMessage.appendString(item.PurchaseCode);

                        mMessage.appendChar(9);

                        if (!item.WallItem)
                        {
                            mMessage.appendString(item.Col);
                        }

                        mMessage.appendChar(13);
                    }
                }

                SendMessage(mMessage);
            }

        }


        //129 - "REDEEM_VOUCHER": "BA"
        public void Listener129()
        {
            string voucherCode = FuseMessage.getArgument(1, mPacketBody);

            if (InstanceManager.Game.Catalogue.VoucherValid(voucherCode))
            {
                mUserInfo.iCredits += InstanceManager.Game.Catalogue.GetVoucherAmount(voucherCode);
                InstanceManager.Game.Catalogue.MarkVoucherAsRedeemed(voucherCode, mUserInfo.userId);

                InstanceManager.Game.Users.UpdateUser(mUserInfo);
                mUserInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);

                mMessage.Init(6); //@F
                mMessage.appendString(mUserInfo.iCredits.ToString() + ".0");
                SendMessage(mMessage);

                mMessage.Init(212); //CT
                SendMessage(mMessage);
            }
            else
            {
                mMessage.Init(213); //CU
                mMessage.appendInt(1);
                SendMessage(mMessage);
            }
        }

        //190 - "SCR_BUY": "B~"
        public void Listener190()
        {
            if (FuseMessage.getArgument(1, mPacketBody) == "club_habbo")
            {
                int months = 0;
                int deduct = 9999;
                int purchaseType = ArgumentEncoding.decodeInt(mPacketBody.Substring(12));
                if (purchaseType == 1)
                {
                    deduct = 25;
                    months = 1;
                }
                if (purchaseType == 2)
                {
                    deduct = 60;
                    months = 3;
                }
                if (purchaseType == 3)
                {
                    deduct = 105;
                    months = 6;
                }

                if (mUserInfo.iCredits - deduct >= 0)
                {
                    mUserInfo.iCredits -= deduct;
                    for (int i = 1; i <= months; i++)
                    {
                        if (mUserInfo.ClubDaysRemaining == 0)
                        {
                            mUserInfo.ClubDaysRemaining = 31;
                        }
                        else
                        {
                            mUserInfo.ClubMonthsRemaining++;
                        }
                        if (mUserInfo.iRole == int.Parse(Users.UserSettings.DefaultRole))
                        {
                            mUserInfo.iRole = int.Parse(Users.UserSettings.ClubRole);
                        }
                        
                    }
                    mUserInfo.ClubLastUpdate = DateTime.Now;

                    InstanceManager.Game.Users.UpdateUser(mUserInfo);
                    mUserInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);

                    mMessage.Init(2); //@B
                    mMessage.appendString(InstanceManager.Game.Roles.GenerateRightsList(mUserInfo.iRole));
                    SendMessage(mMessage);

                    mMessage.Init(8); //@H
                    mMessage.appendString(Settings.ClientClubAllowedSets);
                    SendMessage(mMessage);

                    mMessage.Init(6); //@F
                    mMessage.appendString(mUserInfo.iCredits.ToString() + ".0");
                    SendMessage(mMessage);

                    mMessage.Init(7); //@G
                    mMessage.appendString("club_habbo");
                    mMessage.appendChar(2);
                    mMessage.appendArgumentInt(mUserInfo.ClubDaysRemaining);
                    mMessage.appendArgumentInt(mUserInfo.ClubMonthsPassed);
                    mMessage.appendArgumentInt(mUserInfo.ClubMonthsRemaining);
                    mMessage.appendArgumentInt(1);
                    SendMessage(mMessage);   

                    mMessage.Init(229); //Ce
                    int badgeCount = InstanceManager.Game.Roles.GetBadgeCount(mUserInfo.iRole);
                    mMessage.appendString(ArgumentEncoding.encodeInt(badgeCount));
                    if (badgeCount > 0)
                    {
                        mMessage.appendString(InstanceManager.Game.Roles.GenerateBadgeList(mUserInfo.iRole));
                        mUserInfo.Badges = InstanceManager.Game.Roles.GetBadges(mUserInfo.iRole);
                    }
                    mMessage.appendString("HH");
                    SendMessage(mMessage);
                }
            }
        }
    }
}
