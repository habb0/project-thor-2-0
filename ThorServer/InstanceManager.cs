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
using ThorServer.Net;
using ThorServer.Session;
using ThorServer.Data;
using ThorServer.Game;
using ThorServer.Game.Misc;
using ThorServer.Utilities;
using System.Threading;

namespace ThorServer
{
    public static class InstanceManager
    {
        private static NetManager mNetManager;
        private static SessionManager mSessionManager;
        private static GameManager mGameManager;

        public static void CreateGameManager()
        {
            //Game objects
            mGameManager = new GameManager();
        }

        public static void StartServer()
        {
            
            Logging.LogEvent("Service started.", Logging.LogLevel.Info);
            
            GameConfig.VerifyDatabaseVersion();

            ThreadPool.SetMaxThreads(9999, 9999);

            //Game objects
            mGameManager = new GameManager();

            //Communication objects
            mSessionManager = new SessionManager();
            mNetManager = new NetManager();
        }


        public static class Connections
        {
            public static NetConnection GetConnection(long connectionId)
            {
                return mNetManager.GetInstance(connectionId);
            }

            public static void EndConnection(long connectionid)
            {
                mNetManager.EndConnection(connectionid);
            }

            public static bool CheckIP(string ip)
            {
               return mNetManager.CheckIP(ip);
            }
        }


        public static class Sessions
        {
            public static SessionHandler GetSession(long sessionid)
            {
                return mSessionManager.GetSession(sessionid);
            }

            public static List<SessionHandler> GetSessionList()
            {
                return mSessionManager.GetSessionList();
            }

            public static void BroadcastToAll(ClientMessage message)
            {
                mSessionManager.BroadcastToAll(message);
            }

            public static void BroadcastCallForHelp(ClientMessage message)
            {
                mSessionManager.BroadcastCFH(message);
            }

            public static void AddSession(long sessionid)
            {
                mSessionManager.StartSession(sessionid);
            }

            public static void EndSession(long sessionid)
            {
                mSessionManager.EndSession(sessionid);
            }

            public static void NewSessionData(long sessionid, string data)
            {
                mSessionManager.NewSessionData(sessionid, data);
            }

            public static long GetSessionFromUser(int userid)
            {
                return mSessionManager.GetSessionForUser(userid);
            }

            public static long GetSessionFromUser(string userName)
            {
                return mSessionManager.GetSessionForUser(userName);
            }

            public static void EnforceUniqueLogon(int userid)
            {
                mSessionManager.KillExistingSessions(userid);
            }

            public static void InvokeReactorMethod(long sessionId, string method)
            {
                mSessionManager.GetSession(sessionId).InvokeMethod(method);
            }


        }

        public static GameManager Game
        {
            get
            {
                return mGameManager;
            }
        }

    }
}
