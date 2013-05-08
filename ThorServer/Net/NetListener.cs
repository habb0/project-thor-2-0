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
using System.Text;
using System.Net;
using System.Net.Sockets;

using ThorServer.Core;

namespace ThorServer.Net
{
    public class NetListener
    {
        private Socket mListener = null;
        private long mClientCount = 0;
        private NewConnectionDelegate mConnectionCallback;
       
        public delegate void NewConnectionDelegate(long clientid, Socket clientsocket);

        public NetListener(NewConnectionDelegate connectionCallback)
        {
            mConnectionCallback = connectionCallback;
            this.StartListening();
        }

        private void StartListening()
        {
            int portNumber = int.Parse(Settings.ListenPort);
            mListener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            IPEndPoint ipLocal = new IPEndPoint(IPAddress.Any, portNumber);
            mListener.Bind(ipLocal);
            mListener.Listen(5);
            mListener.BeginAccept(new AsyncCallback(OnClientConnect), null);
            Logging.LogEvent("Listening on port " + Settings.ListenPort + ", waiting for connections.", Logging.LogLevel.Info);
        }

        private void OnClientConnect(IAsyncResult asyn)
        {
            try
            {
                mClientCount++;
                Socket tmpSock = mListener.EndAccept(asyn);
                Logging.LogEvent("Client " + tmpSock.RemoteEndPoint.ToString() + " connected and was assigned Client ID " + mClientCount.ToString() + ".", Logging.LogLevel.Info);

                mListener.BeginAccept(new AsyncCallback(OnClientConnect), null);

                mConnectionCallback(mClientCount, tmpSock);

            }
            catch (ObjectDisposedException)
            {
                Logging.LogEvent("Socket closed before accept completed.", Logging.LogLevel.Warning);
            }
            catch (SocketException e)
            {
                Logging.LogEvent("Unhandled socket error: " + e.ToString(), Logging.LogLevel.Error);
            }
        }
    }
}
