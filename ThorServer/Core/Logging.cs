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
using System.IO;
using System.Text;

namespace ThorServer.Core
{
    public static class Logging
    {
        public static void LogEvent(string logMessage, LogLevel logLevel) 
        {
            try
            {
                if ((int)logLevel >= int.Parse(Settings.LogLevel))
                {
                    StringBuilder sb = new StringBuilder();
                    TextWriter tw = new StreamWriter(System.Windows.Forms.Application.StartupPath + "\\ThorServer.log", true);
                    sb.Append("[" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "] ");
                    sb.Append(((int)logLevel).ToString() + " - " + logLevel.ToString() + ":\r\n");
                    sb.Append(logMessage);
                    sb.Append("\r\n\r\n");
                    tw.Write(sb.ToString());
                    tw.Flush();
                    tw.Close();
                    System.Diagnostics.Debug.Print(sb.ToString());
                }
            }
            catch
            {
                //TODO: Do something to notify that writing the log failed
            }
        }

        public enum LogLevel
        {
            Debug = -1,
            Info = 0,
            Warning = 1,
            Error = 2,
            Important = 3
        }
    }

    
}
