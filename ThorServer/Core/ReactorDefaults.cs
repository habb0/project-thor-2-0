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

using ThorServer.Utilities;

namespace ThorServer.Core
{
    public partial class Reactor
    {
        protected void ReportError(string data, bool fatal)
        {
            if (!fatal)
            {
                mMessage.Init(33); // @a
                mMessage.appendString(data);
                SendMessage(mMessage);
            }
            else
            {
                InstanceManager.Connections.EndConnection(mSessionID);
            }
        }

        public void SendMessage(ClientMessage message)
        {
            SendMessage(message.ToString());
        }

        public void SendMessage(string message, bool logEvent)
        {
            if (logEvent)
            {
                Logging.LogEvent("Sending to " + mSessionID.ToString() + ": " + message, Logging.LogLevel.Debug);
            }
            InstanceManager.Connections.GetConnection(mSessionID).sendPacket(message);
        }

        public void SendMessage(string message)
        {
            SendMessage(message, true);
        }

        public virtual void Ping()
        {

        }

        // 196 - "PONG": "CD"
        public void Listener196(){
            InstanceManager.Sessions.GetSession(mSessionID).pingOk = true;
        }
    }
}
