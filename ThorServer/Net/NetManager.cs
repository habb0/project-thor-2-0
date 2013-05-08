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

using System.Net;
using System.Net.Sockets;

using ThorServer.Core;

namespace ThorServer.Net
{
    public class NetManager
    {
        private NetListener mNetListener;
        private Dictionary<long, NetConnection> mConnectionList;

        public NetManager()
        {
            mConnectionList = new Dictionary<long, NetConnection>();
            mNetListener = new NetListener(new NetListener.NewConnectionDelegate(NewConnection));
        }

        public bool CheckIP(string ip)
        {
            int count = 0;
            foreach (NetConnection conn in mConnectionList.Values)
            {
                if (conn.GetIP() == ip)
                {
                    count++;
                }
            }

            if (count > int.Parse(Settings.IPConnectionLimit)) return false;
            return true;
        }

        public void NewConnection(long clientid, Socket clientsocket)
        {
            InstanceManager.Sessions.AddSession(clientid);

            NetConnection tmpConnection = new NetConnection(clientid, clientsocket, 
                new NetConnection.EndConnectionDelegate(EndConnection), 
                new NetConnection.NewDataDelegate(NewData));
            
            mConnectionList.Add(clientid, tmpConnection);

            InstanceManager.Sessions.GetSession(clientid).ConnectionReady();
        }

        public void EndConnection(long clientid)
        {
            if (mConnectionList.ContainsKey(clientid))
            {
                InstanceManager.Sessions.EndSession(clientid);

                Logging.LogEvent("Connection " + clientid.ToString() + " ended.", Logging.LogLevel.Info);

                mConnectionList[clientid].Kill();
                mConnectionList.Remove(clientid);
            }
        }

        public void NewData(long clientid, string data)
        {
            InstanceManager.Sessions.NewSessionData(clientid, data);
        }

        public NetConnection GetInstance(long clientid)
        {
            if (mConnectionList.ContainsKey(clientid))
            {
                return mConnectionList[clientid];
            }
            else
            {
                return null;
            }
        }

    }
}
