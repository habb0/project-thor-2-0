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

using ThorServer.Data;

namespace ThorServer.Game.Moderation
{
    public partial class ModerationHandler
    {
        public void LogCommand(int moderator, int target, string command, string info, string extra)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@moderator", moderator);
            db.sqlexecute.Parameters.AddWithValue("@target", target);
            db.sqlexecute.Parameters.AddWithValue("@command", command);
            db.sqlexecute.Parameters.AddWithValue("@info", info);
            db.sqlexecute.Parameters.AddWithValue("@extra", extra);
            db.sqlexecute.Parameters.AddWithValue("@timestamp", DateTime.Now);
            db.ExecuteSQL("INSERT INTO ModeratorLog (Moderator, Target, Command, Info, Extra, TimeStamp) VALUES (@moderator, @target, @command, @info, @extra, @timestamp);");
            db.sqlexecute.Parameters.Clear();
        }

        public void LogChat(int source, string text, string method, int roomid)
        {
            Database db = new Database();
            db.sqlexecute.Parameters.AddWithValue("@source", source);
            db.sqlexecute.Parameters.AddWithValue("@text", text);
            db.sqlexecute.Parameters.AddWithValue("@method", method);
            db.sqlexecute.Parameters.AddWithValue("@timestamp", DateTime.Now);
            db.sqlexecute.Parameters.AddWithValue("@roomid", roomid);
            db.ExecuteSQL("INSERT INTO ChatLog (Source, Text, Method, TimeStamp, RoomID) VALUES (@source, @text, @method, @timestamp, @roomid);");
            db.sqlexecute.Parameters.Clear();
        }
    }

}