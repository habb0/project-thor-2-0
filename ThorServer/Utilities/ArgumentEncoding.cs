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
    public static class ArgumentEncoding
    {
        public static string encodeInt(int i)
        {
            byte[] wf = new byte[6];
            int pos = 0;
            int startPos = pos;
            int bytes = 1;
            int negativeMask = i >= 0 ? 0 : 4;
            i = Math.Abs(i);
            wf[pos++] = (byte)(64 + (i & 3));
            for (i >>= 2; i != 0; i >>= 6)
            {
                bytes++;
                wf[pos++] = (byte)(64 + (i & 0x3f));
            }

            wf[startPos] = (byte)(wf[startPos] | bytes << 3 | negativeMask);

            System.Text.ASCIIEncoding encoder = new ASCIIEncoding();
            string tmp = encoder.GetString(wf);
            return tmp.Replace("\0", "");
        }

        public static int decodeInt(string data)
        {
            return decodeInt(data.ToCharArray());
        }

        public static int decodeInt(char data)
        {
            return decodeInt(data.ToString());
        }

        public static int decodeInt(char[] raw)
        {
            int pos = 0;
            int v = 0;
            bool negative = (raw[pos] & 4) == 4;
            int totalBytes = raw[pos] >> 3 & 7;
            v = raw[pos] & 3;
            pos++;
            int shiftAmount = 2;
            for (int b = 1; b < totalBytes; b++)
            {
                v |= (raw[pos] & 0x3f) << shiftAmount;
                shiftAmount = 2 + 6 * b;
                pos++;
            }

            if (negative == true)
                v *= -1;
            return v;
        }

        public static int getLength(int num)
        {
            return encodeInt(num).Length;
        }
    }
}
