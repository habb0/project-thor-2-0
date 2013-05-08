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

namespace ThorServer.Game.Users
{
    public class UserInfo
    {
        public int userId;
        public string sUsername;
        public string sPassword;
        public string sFigure;
        public string sSex;
        public string sMission;
        public string sEmail;
        public string sDOB;
        public string sPoolFigure = "";
        public int iCredits = 0;
        public int iTickets = 0;
        public int iRole = 1;
        public string sBadge = "";
        public List<string> Badges;
        public int ClubMonthsRemaining;
        public int ClubMonthsPassed;
        public int ClubDaysRemaining;
        public DateTime ClubLastUpdate;
        public DateTime LastLogin;
        public string MessengerStatus;
        public string LastIP;

        public string buildUserObject()
        {

            return "name=" + sUsername + Convert.ToChar(13)+
                      "figure=" + sFigure + Convert.ToChar(13) +
                      "sex=" + sSex + Convert.ToChar(13) +
                      "customData=" + sMission + Convert.ToChar(13) +
                      "ph_tickets=" + iTickets.ToString() + Convert.ToChar(13) +
                      "photo_film=" + iTickets.ToString() + Convert.ToChar(13) +
                      "ph_figure=" + sPoolFigure + Convert.ToChar(13) +
                      "directMail=0" + Convert.ToChar(13);

        }
    }
}
