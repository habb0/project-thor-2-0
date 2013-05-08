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

namespace ThorServer.Utilities
{
    public class ClientMessage
    {
        StringBuilder sb;

        public void Init(int headerId)
        {
            sb = new StringBuilder();
            sb.Append(Base64Encoding.EncodeInt(headerId, 2));
        }

        public void Init(string header)
        {
            sb = new StringBuilder();
            sb.Append(header);
        }

        public void appendString(string data)
        {
            sb.Append(data);
        }

        public void appendChar(int charId)
        {
            sb.Append(Convert.ToChar(charId));
        }

        public void appendEncodedInt(int data)
        {
            sb.Append(Base64Encoding.EncodeInt(data, 2));
        }

        public void appendArgumentInt(int data)
        {
            sb.Append(ArgumentEncoding.encodeInt(data));
        }

        public void appendInt(int data)
        {
            sb.Append(data.ToString());
        }

        public override string ToString()
        {
            return sb.ToString() + Convert.ToChar(1);
        }
    }
}
