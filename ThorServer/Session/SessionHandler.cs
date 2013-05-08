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

using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Users;
using ThorServer.Game.Rooms;
using ThorServer.Game.Messenger;
using ThorServer.Game.Furni;
using ThorServer.Game.Moderation;
using ThorServer.Game.Catalogue;

namespace ThorServer.Session
{
    public class SessionHandler : Reactor
    {

        private class ReactorCollection{
            public ReactorCollection(Type rType, Reactor rInstance) { ReactorType = rType; ReactorInstance = rInstance; }
            public Type ReactorType;
            public Reactor ReactorInstance;
        }
        private SessionCommunicationStack mStack;
        private Dictionary<int, ReactorCollection> mReactors;
        public int mRoomID = 0;
        public int authenticatedFlat = 0;
        public int authenticatedDoor = 0;
        public int waitingFlat;
        public bool pingOk = true;

        public bool receiveCFH = false;

        private int mReactorOffset = 0;

        private bool mDirtySession = false;

        protected DateTime mLastUpdate = DateTime.Now;

        public SessionHandler(long sessionid)
        {
            mSessionID = sessionid;
            mStack = new SessionCommunicationStack();
            mReactors = new Dictionary<int, ReactorCollection>();
            RegisterDefaultReactor();

        }

        public void UpdateLastTime()
        {
            mLastUpdate = DateTime.Now;
        }

        public DateTime LastTime
        {
            get
            {
                return mLastUpdate;
            }
        }

        public void MakeSessionDirty()
        {
            mDirtySession = true;
        }

        private void RegisterDefaultReactor()
        {
            mReactors.Clear();
            ReactorCollection rCol = new ReactorCollection(typeof(LoginReactor), new LoginReactor());
            mReactors.Add(0, rCol);
            mReactorOffset = 1;
        }

        public void SessionAuthenticated(UserInfo userInfo)
        {
            mUserInfo = userInfo;
            mReactors.Clear();
            ReactorCollection rCol = new ReactorCollection(typeof(UserReactor), new UserReactor());
            mReactors.Add(mReactorOffset++, rCol);
            rCol = new ReactorCollection(typeof(RoomReactor), new RoomReactor());
            mReactors.Add(mReactorOffset++, rCol);
            rCol = new ReactorCollection(typeof(MessengerReactor), new MessengerReactor());
            mReactors.Add(mReactorOffset++, rCol);
            rCol = new ReactorCollection(typeof(HandReactor), new HandReactor());
            mReactors.Add(mReactorOffset++, rCol);
            rCol = new ReactorCollection(typeof(CatalogueReactor), new CatalogueReactor());
            mReactors.Add(mReactorOffset++, rCol);

            if (InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_trade"))
            {
                rCol = new ReactorCollection(typeof(TradeReactor), new TradeReactor());
                mReactors.Add(mReactorOffset++, rCol);
            }

            if (InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "thor_moderator"))
            {
                rCol = new ReactorCollection(typeof(ModeratorReactor), new ModeratorReactor());
                mReactors.Add(mReactorOffset++, rCol);
            }

            if (InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_cfh"))
            {
                receiveCFH = true;
            }
        }

        public void UpdateUserInfo(UserInfo userInfo)
        {
            mUserInfo = userInfo;
        }

        public int AddListener(Type listenerType, Reactor listenerObject)
        {
            int listenerId = mReactorOffset++;
            ReactorCollection rCol = new ReactorCollection(listenerType, listenerObject);
            mReactors.Add(listenerId, rCol);
            return listenerId;
        }

        public void RemoveListener(int listenerId)
        {
            mReactors.Remove(listenerId);
        }

        public void ConnectionReady()
        {
            GreetClient();
        }

        private void GreetClient()
        {
            if (InstanceManager.Connections.CheckIP(InstanceManager.Connections.GetConnection(mSessionID).GetIP()))
            {
                mMessage.Init(0); // @@
                SendMessage(mMessage);
            }
            else
            {
                mDirtySession = true;
                mMessage.Init(35); // @c
                mMessage.appendString("IP Connection Limit Reached");
                SendMessage(mMessage);
                InstanceManager.Connections.EndConnection(mSessionID);
            }
        }

        public void ProcessData(string data)
        {
            mStack.newData(data);
            if (mStack.StackReady)
            {
                NewMessage(mStack.StackData);
            }
        }

        private void NewMessage(string data)
        {
            string header = data.Substring(0, 2);
            int headerId = Base64Encoding.DecodeInt(header);
            string body = "";
            if (data.Length > 2)
            {
                body = data.Substring(2);
            }

            mHeaderBody = header;
            mHeaderID = headerId;
            mPacketBody = body;
            ProcessMessage();
        }

        private void ProcessMessage()
        {
            Logging.LogEvent("Received from " + mSessionID.ToString() + ": [" + mHeaderID.ToString() + "] " + mHeaderBody + mPacketBody, Logging.LogLevel.Debug);
            if (mPacketBody.Contains(Convert.ToChar(1)))
            {
                Logging.LogEvent("Client " + mSessionID.ToString() + " sent a char 1. Ignoring packet.", Logging.LogLevel.Warning);
            }
            else
            {
                if (!mDirtySession)
                {
                    InvokeMethod("Listener" + mHeaderID.ToString());
                }
            }
        }

        public void InvokeMethod(string methodName)
        {
            StringBuilder sbListeners = new StringBuilder();
           Dictionary<int, ReactorCollection>.Enumerator myEnum = mReactors.GetEnumerator();

            while (myEnum.MoveNext())
            {
                sbListeners.Append(myEnum.Current.Value.ReactorType.Name + ", ");

                MethodInfo methodInfo = myEnum.Current.Value.ReactorType.GetMethod(methodName);
                
                if (methodInfo != null)
                {
                    myEnum.Current.Value.ReactorInstance.mHeaderBody = mHeaderBody;
                    myEnum.Current.Value.ReactorInstance.mHeaderID = mHeaderID;
                    myEnum.Current.Value.ReactorInstance.mPacketBody = mPacketBody;
                    myEnum.Current.Value.ReactorInstance.mSessionID = mSessionID;
                    myEnum.Current.Value.ReactorInstance.mUserInfo = mUserInfo;

                    try
                    {
                        myEnum.Current.Value.ReactorInstance.Ping();
                        methodInfo.Invoke(myEnum.Current.Value.ReactorInstance, null);

                    }
                    catch(Exception e)
                    {
                        Logging.LogEvent("weirderror: Client " + mSessionID.ToString() + " caused an error which was not caught in the processing stack.\r\nStack: " + e.ToString(), Logging.LogLevel.Error);
                    }

                    return;
                }
            }

            Logging.LogEvent("No listener named '" + methodName + "' for '" + mHeaderBody + mPacketBody + "' was found in this context. Reactors were '" + sbListeners.ToString().Substring(0, sbListeners.Length - 2) + "'", Logging.LogLevel.Warning);
        }

        public void Cleanup()
        {
            if (mRoomID > 0)
            {
                InstanceManager.Game.Rooms.GetRoomInstance(mRoomID).RemoveUser(mSessionID);
            }
        }
    }
}
