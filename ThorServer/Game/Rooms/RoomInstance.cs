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
using System.Reflection;
using System.Threading;

using ThorServer.Utilities;
using ThorServer.Core;
using ThorServer.Game.Rooms.Reactors;
using ThorServer.Game.Rooms.Interactor;


namespace ThorServer.Game.Rooms
{
    public partial class RoomInstance
    {
        private int mRoomID;
        private RoomInfo mRoomInfo;
        private RoomInteractor mRoomInteractor;

        private Dictionary<long, RoomUser> mRoomUsers;
        private Dictionary<long, int> mMemberSessions;
        public  List<int> mRoomUserIDs;
        public Dictionary<long, int> mDoorEntries;

        public int UserCount
        {
            get
            {
                return mRoomUsers.Count;
            }
        }

        public string UserList
        {
            get
            {
                StringBuilder sb = new StringBuilder();
                foreach (RoomUser roomUser in mRoomUsers.Values)
                {
                    sb.Append(roomUser.UserInfo.sUsername);
                    sb.Append(Convert.ToChar(2));
                }
                return sb.ToString();
            }
        }

        public RoomInstance(int roomID)
        {

            mRoomID = roomID;
            mRoomInfo = InstanceManager.Game.Rooms.GetRoom(roomID);
            LoadReactor(mRoomInfo.ReactorType);
            mMemberSessions = new Dictionary<long, int>();
            mRoomUsers = new Dictionary<long, RoomUser>();
            mRoomUserIDs = new List<int>();
            mRoomInteractor = new RoomInteractor(mRoomID, this);
            mDoorEntries = new Dictionary<long, int>();

            if (RoomInfo.ReactorType == "LidoReactor" || RoomInfo.ReactorType == "RooftopReactor") Interactor.mHasPoolCam = true;
        }

        public bool BroadcastRingingUser(string userName)
        {
            mMessage.Init(91); // A[
            mMessage.appendString(userName);

            return RoomRightsBroadcast(mMessage);
        }

        public void DestroyRoom()
        {
            mRoomInteractor.DestroyInteractor();
            mRoomInteractor = null;
        }

        private RoomCommonReactor LoadReactor(string reactorName)
        {
            RoomCommonReactor reactor =  (RoomCommonReactor)Activator.CreateInstance(null, "ThorServer.Game.Rooms.Reactors." + reactorName).Unwrap();
            reactor.RegisterInstance(this);
            return reactor;
        }

        public Dictionary<long, RoomUser> Users
        {
            get
            {
                return mRoomUsers;
            }
        }

        public RoomUser GetUser(long sessionID)
        {
            if (mRoomUsers.ContainsKey(sessionID))
            {
                return mRoomUsers[sessionID];
            }
            else
            {
                return null;
            }
        }

        public RoomUser GetUser(string username)
        {
            Dictionary<long, RoomUser>.Enumerator myEnum = mRoomUsers.GetEnumerator();

            while (myEnum.MoveNext())
            {
                if (myEnum.Current.Value.UserInfo.sUsername == username)
                {
                    return myEnum.Current.Value;
                }

            }

            return null;
        }

        public RoomUser GetUser(int x, int y)
        {
            Dictionary<long, RoomUser>.Enumerator myEnum = mRoomUsers.GetEnumerator();

            while (myEnum.MoveNext())
            {
                if (myEnum.Current.Value.CurrentX == x && myEnum.Current.Value.CurrentY == y)
                {
                    return myEnum.Current.Value;
                }
            }

            return null;
        }

        public RoomUser GetUser(int roomUserId)
        {
            Dictionary<long, RoomUser>.Enumerator myEnum = mRoomUsers.GetEnumerator();

            while (myEnum.MoveNext())
            {
                if (myEnum.Current.Value.RoomUserID == roomUserId)
                {
                    return myEnum.Current.Value;
                }
            }

            return null;
        }

        private int AllocateID()
        {
            int i = 0;

            while (true)
            {
                if (!mRoomUserIDs.Contains(i))
                {
                    mRoomUserIDs.Add(i);
                    return i;
                }

                i++;
            }
        }


        public bool AddUser(long sessionID)
        {
            RoomCommonReactor reactor = LoadReactor(RoomInfo.ReactorType);
            int listenerId = InstanceManager.Sessions.GetSession(sessionID).AddListener(reactor.GetType(), reactor);
            mMemberSessions.Add(sessionID, listenerId);
            InstanceManager.Sessions.GetSession(sessionID).mRoomID = mRoomID;
            Logging.LogEvent("User " + sessionID.ToString() + " entered room " + mRoomID.ToString(), Logging.LogLevel.Debug);
            return true;
        }

        public void RemoveUser(long sessionID)
        {
            InstanceManager.Sessions.GetSession(sessionID).mRoomID = 0;

            if (mMemberSessions.ContainsKey(sessionID))
            {
                InstanceManager.Sessions.GetSession(sessionID).RemoveListener(mMemberSessions[sessionID]);
                mMemberSessions.Remove(sessionID);
            }

            if (mRoomUsers.ContainsKey(sessionID))
            {
                mRoomInteractor.RemoveTileStatus(mRoomUsers[sessionID], mRoomUsers[sessionID].CurrentX, mRoomUsers[sessionID].CurrentY);
                mRoomInteractor.FreeTile(mRoomUsers[sessionID].CurrentX, mRoomUsers[sessionID].CurrentY);

                mMessage.Init(29); //@]
                mMessage.appendInt(mRoomUsers[sessionID].RoomUserID);
                RoomBroadcast(mMessage);

                mRoomUserIDs.Remove(mRoomUsers[sessionID].RoomUserID);
                mRoomUsers.Remove(sessionID);



            }

            Logging.LogEvent("User " + sessionID.ToString() + " left room " + mRoomID.ToString(), Logging.LogLevel.Debug);

            InstanceManager.Game.Rooms.UpdateUsers(mRoomInfo.RoomID, mRoomUsers.Count);

            if (UserCount == 0)
            {
                InstanceManager.Game.Rooms.DestroyRoomInstance(mRoomID);
            }
        }

        public void ActivateUser(long sessionID)
        {

            RoomUser newUser = new RoomUser();
            newUser.RoomUserID = AllocateID();
            newUser.SessionID = sessionID;

            if (!mDoorEntries.ContainsKey(sessionID))
            {
                newUser.CurrentX = mRoomInfo.StartX;
                newUser.CurrentY = mRoomInfo.StartY;
                newUser.CurrentZ = mRoomInfo.StartZ;
            }
            else
            {
                Furni.FurniInfo teleporter = InstanceManager.Game.Furni.GetFurni(mDoorEntries[sessionID]);
                newUser.CurrentX = teleporter.PosX;
                newUser.CurrentY = teleporter.PosY;
                newUser.CurrentZ = teleporter.PosZ;

            }

            mRoomUsers.Add(sessionID, newUser);


            AnnounceUser(sessionID);

            if (mDoorEntries.ContainsKey(sessionID))
            {
                Furni.FurniInfo teleporter = InstanceManager.Game.Furni.GetFurni(mDoorEntries[sessionID]);
                mMessage.Init(92); //A\
                mMessage.appendInt(teleporter.FurniID);
                mMessage.appendString("/");
                mMessage.appendString(newUser.UserInfo.sUsername);
                mMessage.appendString("/");
                mMessage.appendString(teleporter.FurniSprite);
                RoomBroadcast(mMessage);
                mDoorEntries.Remove(sessionID);
            }

            CalculateRights(ref newUser, sessionID);

            //Send all the user statuses
            foreach (RoomUser roomUser in mRoomUsers.Values)
            {
                SendUserStatus(roomUser.SessionID, true, newUser.SessionID);
            }

            InstanceManager.Game.Rooms.UpdateUsers(mRoomInfo.RoomID, mRoomUsers.Count);



        }

        public void CalculateRights(ref RoomUser newUser, long sessionID)
        {
            newUser.HasAdmin = false;
            newUser.HasRights = false;

            if (newUser.SpecialStates.ContainsKey("flatctrl"))
            {
                newUser.SpecialStates.Remove("flatctrl");
            }

            if (newUser.UserInfo.userId == RoomInfo.RoomOwner)
            {
                newUser.HasAdmin = true;
                newUser.HasRights = true;
            }

            if (InstanceManager.Game.Roles.HasRight(newUser.UserInfo.iRole, "fuse_any_room_controller")) { newUser.HasAdmin = true; newUser.HasRights = true; }
            if (InstanceManager.Game.Roles.HasRight(newUser.UserInfo.iRole, "fuse_any_room_rights")) newUser.HasRights = true;
            
            if (InstanceManager.Game.Rooms.HasRights(mRoomInfo.RoomID, newUser.UserInfo.userId)) newUser.HasRights = true;

            //Owner Check
            if (newUser.HasAdmin || newUser.HasRights)
            {
                mMessage.Init(42); //@j
                SendMessage(mMessage, sessionID);
                if (newUser.HasAdmin)
                {
                    mMessage.Init(47); //@o
                    SendMessage(mMessage, sessionID);
                }
                newUser.SpecialStates.Add("flatctrl", new RoomUser.RoomUserStatus("flatctrl", true, "useradmin", 0, 0, 0, null, true));
            }

            if (!newUser.HasRights)
            {
                if (mRoomInfo.SuperUsers > 0) newUser.HasRights = true;

                // Superusers
                if (newUser.HasRights && !newUser.HasAdmin)
                {
                    mMessage.Init(42); //@j
                    SendMessage(mMessage, sessionID);
                    newUser.SpecialStates.Add("flatctrl", new RoomUser.RoomUserStatus("flatctrl", true, "onlyfurniture", 0, 0, 0, null, true));
                }
            }

            

            newUser.MustUpdate = true;
        }

        public RoomInfo RoomInfo
        {
            get
            {
                return mRoomInfo;
            }

            set
            {
                mRoomInfo = value;
            }
        }

        public bool RoomRightsBroadcast(ClientMessage message)
        {
            Logging.LogEvent("Rights broadcasting to room " + mRoomID.ToString() + ": " + message.ToString(), Logging.LogLevel.Debug);
            return RoomRightsBroadcast(message.ToString());
        }

        public bool RoomRightsBroadcast(string message)
        {
            bool doneOne = false;
            foreach (int sessionId in mMemberSessions.Keys)
            {
                if (mRoomUsers[sessionId].HasRights || mRoomUsers[sessionId].HasAdmin)
                {
                    InstanceManager.Sessions.GetSession(sessionId).SendMessage(message, false);
                    doneOne = true;
                }
            }

            return doneOne;
        }


        public delegate void RoomDelayBroadcastDelegate(ClientMessage message, int milli);

        public void RoomDelayBroadcast(ClientMessage message, int milli)
        {
            Thread.Sleep(milli);
            RoomBroadcast(message);
        }

        public void RoomBroadcast(ClientMessage message)
        {
            Logging.LogEvent("Broadcasting to room " + mRoomID.ToString() + ": " + message.ToString(), Logging.LogLevel.Debug);
            RoomBroadcast(message.ToString());
        }

        public void RoomBroadcast(string message)
        {
            foreach (int sessionId in mMemberSessions.Keys)
            {
                InstanceManager.Sessions.GetSession(sessionId).SendMessage(message, false);
            }
        }

        public void RoomTalkBroadcast(int sourceX, int sourceY, string chat, int roomUser)
        {
            Logging.LogEvent("Chatting to room " + mRoomID.ToString() + ": " + chat, Logging.LogLevel.Debug);
            foreach (int sessionId in mMemberSessions.Keys)
            {
                if (mRoomUsers.ContainsKey(sessionId))
                {
                    string currentChat = chat;
                    int xDistance = Math.Abs(sourceX - mRoomUsers[sessionId].CurrentX);
                    int yDistance = Math.Abs(sourceY - mRoomUsers[sessionId].CurrentY);

                    if (xDistance >= 6 || yDistance >= 6) //Garble text
                    {
                        for (int i = 0; i < chat.Length; i++)
                        {
                            if (SpecialMath.RandomNumber(0, 10) > 5 && chat[i] != ' ') currentChat = currentChat.Replace(chat[i], '.');
                        }
                    }

                    if (xDistance < 9 && yDistance < 9) // User can at least partially hear
                    {
                        mMessage.Init(24); //@X
                        mMessage.appendString(ArgumentEncoding.encodeInt(roomUser));
                        mMessage.appendString(currentChat);
                        mMessage.appendChar(2);
                        InstanceManager.Sessions.GetSession(sessionId).SendMessage(mMessage.ToString(), false);
                    }


                }
            }
        }

        public void SendMessage(ClientMessage message, long sessionId)
        {
            SendMessage(message.ToString(), sessionId);
        }

        public void SendMessage(string message, long sessionId)
        {
            InstanceManager.Sessions.GetSession(sessionId).SendMessage(message);
        }



        public RoomInteractor Interactor
        {
            get
            {
                return mRoomInteractor;
            }
        }
    }
}
