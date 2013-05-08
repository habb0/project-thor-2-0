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
using System.Threading;

using ThorServer.Utilities;

namespace ThorServer.Session
{
    public class SessionManager
    {
        private Dictionary<long, SessionHandler> mSessions;
        private Thread mIdleTimer;


        public SessionManager()
        {
            mSessions = new Dictionary<long, SessionHandler>();
            mIdleTimer = new Thread(IdleTimer);
            mIdleTimer.Start();
        }

        public void StartSession(long sessionid)
        {
            mSessions.Add(sessionid, new SessionHandler(sessionid));
        }

        public void EndSession(long sessionid)
        {
            mSessions[sessionid].Cleanup();
            mSessions.Remove(sessionid);
        }

        public SessionHandler GetSession(long sessionid)
        {
            if (mSessions.ContainsKey(sessionid))
            {
                return mSessions[sessionid];
            }
            else
            {
                return null;
            }
        }

        public void NewSessionData(long sessionid, string data)
        {
            mSessions[sessionid].ProcessData(data);
        }

        public void KillExistingSessions(int userId)
        {
            long session = GetSessionForUser(userId);

            if (session != -1)
            {
                InstanceManager.Connections.EndConnection(session);
            }
        }

        public long GetSessionForUser(int userId)
        {
            Dictionary<long, SessionHandler>.Enumerator myEnum = mSessions.GetEnumerator();

            while(myEnum.MoveNext())
            {
                SessionHandler session = myEnum.Current.Value;
                if (session.mUserInfo != null)
                {
                    if (session.mUserInfo.userId == userId)
                    {
                        return session.mSessionID;
                    }
                }
            }

            return -1;
        }

        public long GetSessionForUser(string userName)
        {
            Dictionary<long, SessionHandler>.Enumerator myEnum = mSessions.GetEnumerator();

            while (myEnum.MoveNext())
            {
                SessionHandler session = myEnum.Current.Value;
                if (session.mUserInfo != null)
                {
                    if (session.mUserInfo.sUsername == userName)
                    {
                        return session.mSessionID;
                    }
                }
            }

            return -1;
        }

        public List<SessionHandler> GetSessionList()
        {
            Dictionary<long, SessionHandler>.Enumerator myEnum = mSessions.GetEnumerator();
            List<SessionHandler> result = new List<SessionHandler>();

            while (myEnum.MoveNext())
            {
                result.Add(myEnum.Current.Value);
            }

            return result;
        }

        public void BroadcastToAll(ClientMessage message)
        {
            Dictionary<long, SessionHandler>.Enumerator myEnum = mSessions.GetEnumerator();

            while (myEnum.MoveNext())
            {
                myEnum.Current.Value.SendMessage(message);
            }
        }

        public void BroadcastCFH(ClientMessage message)
        {
            Dictionary<long, SessionHandler>.Enumerator myEnum = mSessions.GetEnumerator();

            while (myEnum.MoveNext())
            {
                if (myEnum.Current.Value.receiveCFH)
                {
                    myEnum.Current.Value.SendMessage(message);
                }
            }
        }

        public void IdleTimer()
        {
            

            while (true)
            {
                List<long> toRemove = new List<long>();
                foreach (SessionHandler sess in mSessions.Values)
                {
                    if (sess.LastTime.AddMinutes(60) < DateTime.Now) toRemove.Add(sess.mSessionID);
                    if (!sess.pingOk) toRemove.Add(sess.mSessionID);
                    sess.pingOk = false;
                }

                foreach (long sessid in toRemove)
                {
                    InstanceManager.Connections.EndConnection(sessid);
                }

                //Ping
                ClientMessage message = new ClientMessage();
                message.Init(50); //@r
                BroadcastToAll(message);

                Thread.Sleep(60000);
            }
        }
    }
}
