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
using ThorServer.Game.Rooms;
using ThorServer.Game.Rooms.Interactor;

namespace ThorServer.Game.Furni
{
    public class TradeReactor : Reactor
    {


        //68 - "TRADE_UNACCEPT": "AD"
        public void Listener68()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            if (roomId > 0)
            {
                RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
                RoomUser thisUser = instance.GetUser(mSessionID);

                if (thisUser.SpecialStates.ContainsKey("trd"))
                {
                    RoomUser targetUser = instance.GetUser(thisUser.TradingWith);
                    thisUser.TradeAccepted = false;
                    targetUser.TradeAccepted = false;
                    RefreshTrades(thisUser.SessionID, targetUser.SessionID);
                }
            }
        }

        //69 - "TRADE_ACCEPT": "AE"
        public void Listener69()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            if (roomId > 0)
            {
                RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
                RoomUser thisUser = instance.GetUser(mSessionID);

                if (thisUser.SpecialStates.ContainsKey("trd"))
                {
                    thisUser.TradeAccepted = true;
                    RoomUser targetUser = instance.GetUser(thisUser.TradingWith);
                    if (thisUser.TradeAccepted && targetUser.TradeAccepted)
                    {
                        bool isSafe = true;
                        foreach (int itemid in targetUser.TradeOffer)
                        {
                            if (InstanceManager.Game.Furni.GetFurni(itemid).RoomID != 0)
                            {
                                isSafe = false;
                                break;
                            }
                        }

                        foreach (int itemid in thisUser.TradeOffer)
                        {
                            if (InstanceManager.Game.Furni.GetFurni(itemid).RoomID != 0)
                            {
                                isSafe = false;
                                break;
                            }
                        }

                        if (isSafe)
                        {

                            foreach (int itemid in targetUser.TradeOffer)
                            {
                                InstanceManager.Game.Furni.PickupItem(itemid, thisUser.UserInfo.userId);
                            }

                            foreach (int itemid in thisUser.TradeOffer)
                            {
                                InstanceManager.Game.Furni.PickupItem(itemid, targetUser.UserInfo.userId);
                            }

                            AbortTrade(thisUser.SessionID, targetUser.SessionID);
                        }
                        else
                        {
                            thisUser.TradeAccepted = false;
                            targetUser.TradeAccepted = false;
                            RefreshTrades(thisUser.SessionID, targetUser.SessionID);
                        }
                    }
                    else
                    {
                        RefreshTrades(thisUser.SessionID, targetUser.SessionID);
                    }
                }
            }
        }

        //70 - "TRADE_CLOSE": "AF"
        public void Listener70()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            if (roomId > 0)
            {
                RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
                RoomUser thisUser = instance.GetUser(mSessionID);

                if (thisUser.SpecialStates.ContainsKey("trd"))
                {
                    RoomUser targetUser = instance.GetUser(thisUser.TradingWith);
                    AbortTrade(thisUser.SessionID, targetUser.SessionID);
                }
            }
        }


        //71 - "TRADE_OPEN": "AG"
        public void Listener71()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            int targetUserRoomUser = 0;
            if (roomId > 0)
            {
                if (int.TryParse(mPacketBody, out targetUserRoomUser))
                {
                    RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
                    RoomUser thisUser = instance.GetUser(mSessionID);
                    RoomUser targetUser = instance.GetUser(targetUserRoomUser);

                    if (!thisUser.SpecialStates.ContainsKey("trd") && !targetUser.SpecialStates.ContainsKey("trd"))
                    {
                        thisUser.TradingWith = targetUser.SessionID;
                        targetUser.TradingWith = thisUser.SessionID;
                        thisUser.TradeOffer = new List<int>();
                        targetUser.TradeOffer = new List<int>();
                        thisUser.TradeAccepted = false;
                        targetUser.TradeAccepted = false;
                        thisUser.SpecialStates.Add("trd", new RoomUser.RoomUserStatus("trd", true, "", 0, 0, 0, null, true));
                        targetUser.SpecialStates.Add("trd", new RoomUser.RoomUserStatus("trd", true, "", 0, 0, 0, null, true));
                        instance.AnnounceUserStatus(thisUser.SessionID, true);
                        instance.AnnounceUserStatus(targetUser.SessionID, true);
                        RefreshTrades(thisUser.SessionID, targetUser.SessionID);
                    }
                }
            }
        }

        //72 - "TRADE_ADDITEM": "AH"
        public void Listener72()
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            int itemId = 0;
            if (roomId > 0)
            {
                if (int.TryParse(mPacketBody, out itemId))
                {
                    RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
                    RoomUser thisUser = instance.GetUser(mSessionID);
                    if (thisUser.SpecialStates.ContainsKey("trd"))
                    {
                        RoomUser targetUser = instance.GetUser(thisUser.TradingWith);


                        if (InstanceManager.Game.Furni.FurniExists(itemId))
                        {
                            FurniInfo furni = InstanceManager.Game.Furni.GetFurni(itemId);

                            if (furni.CanTrade)
                            {
                                if (furni.OwnerID == thisUser.UserInfo.userId && furni.RoomID == 0)
                                {
                                    if (!thisUser.TradeOffer.Contains(furni.FurniID))
                                    {
                                        thisUser.TradeAccepted = false;
                                        targetUser.TradeAccepted = false;
                                        thisUser.TradeOffer.Add(furni.FurniID);
                                        RefreshTrades(thisUser.SessionID, targetUser.SessionID);
                                    }
                                }
                            }
                            else
                            {
                                mMessage.Init(139); //BK
                                mMessage.appendString(InstanceManager.Game.Externals.GetTextValue("room_cant_trade"));
                                InstanceManager.Sessions.GetSession(thisUser.SessionID).SendMessage(mMessage);
                            }
                        }
                    }
                }
            }
        }

        private void AbortTrade(long user1id, long user2id)
        {
            mMessage.Init(110); //An

            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);

            RoomUser user1 = instance.GetUser(user1id);
            RoomUser user2 = instance.GetUser(user2id);

            user1.TradingWith = 0;
            user1.TradeAccepted = false;
            user1.TradeOffer.Clear();
            
            if (user1.SpecialStates.ContainsKey("trd"))
            {
                user1.SpecialStates.Remove("trd");
            }

            instance.AnnounceUserStatus(user1.SessionID, true);
            InstanceManager.Sessions.InvokeReactorMethod(user1.SessionID, "UpdateHandInvoker");
            InstanceManager.Sessions.GetSession(user1.SessionID).SendMessage(mMessage);
            
            user2.TradingWith = 0;
            user2.TradeAccepted = false;
            user2.TradeOffer.Clear();
            
            if (user2.SpecialStates.ContainsKey("trd"))
            {
                user2.SpecialStates.Remove("trd");
            }

            instance.AnnounceUserStatus(user2.SessionID, true);
            InstanceManager.Sessions.InvokeReactorMethod(user2.SessionID, "UpdateHandInvoker");
            InstanceManager.Sessions.GetSession(user2.SessionID).SendMessage(mMessage);
            

        }

        private void RefreshTrades(long user1id, long user2id)
        {
            int roomId = InstanceManager.Sessions.GetSession(mSessionID).mRoomID;
            RoomInstance instance = InstanceManager.Game.Rooms.GetRoomInstance(roomId);
            RoomUser user1 = instance.GetUser(user1id);
            RoomUser user2 = instance.GetUser(user2id);
            if (roomId > 0)
            {
                if (user1.TradingWith == user2.SessionID && user2.TradingWith == user1.SessionID)
                {
                    SendTradeInfo(user1, user2);
                    SendTradeInfo(user2, user1);
                }
            }
        }

        private void SendTradeInfo(RoomUser currentUser, RoomUser otherUser)
        {
            mMessage.Init(108); //Al
            mMessage.appendString(currentUser.UserInfo.sUsername);
            mMessage.appendChar(9);
            mMessage.appendString(currentUser.TradeAccepted.ToString().ToLower());
            mMessage.appendChar(9);

            if (currentUser.TradeOffer.Count > 0)
            {
                mMessage.appendString(BuildTradeList(currentUser.TradeOffer));
            }

            mMessage.appendChar(13);

            mMessage.appendString(otherUser.UserInfo.sUsername);
            mMessage.appendChar(9);
            mMessage.appendString(otherUser.TradeAccepted.ToString().ToLower());
            mMessage.appendChar(9);

            if (otherUser.TradeOffer.Count > 0)
            {
                mMessage.appendString(BuildTradeList(otherUser.TradeOffer));
            }

            InstanceManager.Sessions.GetSession(currentUser.SessionID).SendMessage(mMessage);
        }

        private string BuildTradeList(List<int> ids)
        {
            int counter = 0;
            StringBuilder sb = new StringBuilder();
            foreach (int itemId in ids)
            {
                FurniInfo info = InstanceManager.Game.Furni.GetFurni(itemId);

                sb.Append("SI");
                sb.Append(Convert.ToChar(30));
                sb.Append(info.FurniID);
                sb.Append(Convert.ToChar(30));
                sb.Append(counter);
                sb.Append(Convert.ToChar(30));

                if (info.Flags.WallItem) sb.Append("I");
                if (!info.Flags.WallItem) sb.Append("S");
                sb.Append(Convert.ToChar(30));
                sb.Append(info.FurniID);
                sb.Append(Convert.ToChar(30));
                sb.Append(info.FurniSprite);
                sb.Append(Convert.ToChar(30));

                if (!info.Flags.WallItem)
                {
                    sb.Append(info.L);
                    sb.Append(Convert.ToChar(30));
                    sb.Append(info.W);
                    sb.Append(Convert.ToChar(30));
                    sb.Append(info.FurniVar);
                    sb.Append(Convert.ToChar(30));
                }

                sb.Append(info.Col);
                sb.Append(Convert.ToChar(30));
                sb.Append(counter);
                sb.Append(Convert.ToChar(30));
                sb.Append("/");

                counter++;
            }

            return sb.ToString();
        }
    }
}
