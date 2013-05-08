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
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;

using ThorServer;
using ThorServer.Utilities;

namespace ThorHousekeeping
{
    public class ServerCommunicator
    {
        public bool SendModCommandToServer(string command, int issuer, int target, string message)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(Base64Encoding.EncodeInt(999, 2));

            sb.Append(Base64Encoding.EncodeInt(command.Length, 2));
            sb.Append(command);

            sb.Append(Base64Encoding.EncodeInt(issuer.ToString().Length, 2));
            sb.Append(issuer);

            sb.Append(Base64Encoding.EncodeInt(target.ToString().Length, 2));
            sb.Append(target);

            sb.Append(Base64Encoding.EncodeInt(message.Length, 2));
            sb.Append(message);

            string packet = Base64Encoding.EncodeInt(sb.Length, 3) + sb.ToString();

            IPEndPoint ip = new IPEndPoint(IPAddress.Parse("127.0.0.1"),int.Parse(Settings.ListenPort));

            Socket server = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                server.Connect(ip);
            }
            catch
            {
                return false;
            }


                byte[] data = new byte[1024];
                int receivedDataLength = server.Receive(data);
                string stringData = Encoding.ASCII.GetString(data, 0, receivedDataLength);

                if (stringData == "@@" + Convert.ToChar(1))
                {

                    server.Send(Encoding.ASCII.GetBytes(packet));
                    data = new byte[1024];
                    receivedDataLength = server.Receive(data);
                    stringData = Encoding.ASCII.GetString(data, 0, receivedDataLength);
                }

                

            server.Shutdown(SocketShutdown.Both);
            server.Close();

            if (stringData == "ACK") return true;
            return false;

        }

    }
}
