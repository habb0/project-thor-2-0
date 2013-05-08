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

using ThorServer.Utilities;

namespace ThorServer.Session
{
    public class SessionCommunicationStack
    {
        private StringBuilder sb;
        int state = 0;
        int waitFor;
        bool stackDone = false;
        const int headersize = 3;

        public void newData(string data)
        {
            switch (state)
            {
                case 0: //New stack
                    sb = new StringBuilder();
                    state = 1;
                    newData(data);
                    break;

                case 1: //Message Header
                    sb.Append(data);
                    if (sb.Length == headersize)
                    {
                        waitFor = Base64Encoding.DecodeInt(sb.ToString());
                        sb = new StringBuilder();
                        state = 2;
                    }
                    break;

                case 2: //Message
                    sb.Append(data);
                    if (sb.Length == waitFor)
                    {
                        stackDone = true;
                        state = 0;
                    }
                    break;

            }
        }

        public bool StackReady
        {
            get
            {
                return stackDone;
            }
        }

        public string StackData
        {
            get
            {
                stackDone = false;
                return sb.ToString();
            }
        }
    }
}
