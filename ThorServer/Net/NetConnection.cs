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
using ThorServer.Utilities;

namespace ThorServer.Net
{
    public class NetConnection
    {
        private int idleMinutes = 0;
        private long mConnectionID;
        private Socket mSocket;
        private AsyncCallback recCallback;
        private EndConnectionDelegate mEndConnectionCallback;
        private NewDataDelegate mNewDataCallback;
        private byte[] dataBuffer = new byte[1];

        public delegate void EndConnectionDelegate(long clientid);
        public delegate void NewDataDelegate(long clientid, string data);

        public string GetIP()
        {
            return mSocket.RemoteEndPoint.ToString().Split(':')[0];
        }

        public NetConnection(long socketid, Socket socket, EndConnectionDelegate endConnectionCallback, NewDataDelegate newDataCallback)
        {
            mSocket = socket;
            mConnectionID = socketid;
            mEndConnectionCallback = endConnectionCallback;
            mNewDataCallback = newDataCallback;
            this.WaitForData();
        }

        private void WaitForData()
        {
            try
            {
                if (recCallback == null)
                {
                    CreateCallBacks();
                }
                mSocket.BeginReceive(this.dataBuffer, 0, this.dataBuffer.Length, SocketFlags.None, recCallback, null);

            }
            catch (SocketException e)
            {
                Logging.LogEvent("Unhandled socket error: " + e.ToString(), Logging.LogLevel.Error);
            }

        }

        private void OnDataReceived(IAsyncResult asyn)
        {
            try
            {

                int iRx = mSocket.EndReceive(asyn);
                if (iRx == 0)
                {
                    ConnectionEnded();
                    return;
                }
                char[] chars = new char[iRx];
                System.Text.Decoder d = Encoding.GetEncoding("iso-8859-1").GetDecoder();
                int charLen = d.GetChars(dataBuffer, 0, iRx, chars, 0);
                System.String szData = new System.String(chars);


                NewData(szData);

                WaitForData();
            }
            catch (ObjectDisposedException)
            {
                ConnectionEnded();
            }
            catch (SocketException e)
            {
                Logging.LogEvent("Unhandled socket error: " + e.ToString(), Logging.LogLevel.Error);

                ConnectionEnded();
            }
        }

        private void NewData(string data)
        {
            mNewDataCallback(mConnectionID, data);
        }

        private void ConnectionEnded()
        {
            mEndConnectionCallback(mConnectionID);
        }

        private void CreateCallBacks()
        {
            recCallback = new AsyncCallback(OnDataReceived);
        }

        public void sendPacket(string data)
        {
            byte[] toSend = Conversion.StringToByteArray(data);
            if (toSend != null)
            {
                sendRawPacket(toSend);
            }
        }

        public void sendRawPacket(byte[] data)
        {
            mSocket.Send(data);
        }

        public void Kill()
        {
            try
            {
                mSocket.Close();
            }
            catch
            {
                //TODO: Handle this in some way
            }
        }
    }
}
