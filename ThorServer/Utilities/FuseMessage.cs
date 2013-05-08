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
    public static class FuseMessage
    {
        public static string getArgument(int num, string data)
        {

            string output = "";

            for (int i = 1; i <= num; i++)
            {
                string tmpLen = data.Substring(0, 2);
                int len = Base64Encoding.DecodeInt(tmpLen);
                output = data.Substring(2, len);
                data = data.Substring(2 + len);
            }

            return output;
        }

        public static int getArgumentEnd(int num, string data)
        {
            int returnLen = 0;

            for (int i = 1; i <= num; i++)
            {
                string tmpLen = data.Substring(0, 2);
                int len = Base64Encoding.DecodeInt(tmpLen);
                data = data.Substring(2 + len);
                returnLen += 2 + len;
            }

            return returnLen;
        }

        public static string getStructured(int num, string data)
        {
            try
            {
                int itCount = 0;
                double maxIt = data.Length / 4;
                while (itCount <= maxIt)
                {
                    itCount++;
                    string tmpStr = data.Substring(0, 2);
                    int id = Base64Encoding.DecodeInt(tmpStr);

                    tmpStr = data.Substring(2, 2);
                    int len = Base64Encoding.DecodeInt(tmpStr);

                    string output = data.Substring(4, len);
                    data = data.Substring(4 + len);

                    if (num == id)
                    {
                        return output;
                    }
                }
            }
            catch
            {
                return "";
            }

            return "";

        }
    }
}
