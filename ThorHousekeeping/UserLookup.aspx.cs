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
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Text;

using ThorServer;
using ThorServer.Game.Users;

namespace ThorHousekeeping
{
    public partial class UserLookup : System.Web.UI.Page
    {
        UserInfo mUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "User Search";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_housekeeping_user_lookup"))
            {
                Response.Redirect("./Default.aspx");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (InstanceManager.Game.Users.UserExists(txtUsername.Text))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(txtUsername.Text);

                sb.Append("User ID: ");
                sb.Append(user.userId);
                sb.Append("<br>");

                sb.Append("Username: ");
                sb.Append(Server.HtmlEncode(user.sUsername));
                sb.Append("<br>");

                sb.Append("Sex: ");
                sb.Append(user.sSex);
                sb.Append("<br>");

                sb.Append("Figure: ");
                sb.Append(user.sFigure);
                sb.Append("<br>");

                sb.Append("Mission: ");
                sb.Append(Server.HtmlEncode(user.sMission));
                sb.Append("<br>");

                sb.Append("DOB: ");
                sb.Append(user.sDOB);
                sb.Append("<br>");

                sb.Append("Email: ");
                sb.Append(Server.HtmlEncode(user.sEmail));
                sb.Append("<br>");

                sb.Append("Role: ");
                sb.Append(user.iRole);
                sb.Append(" [");
                sb.Append(InstanceManager.Game.Roles.GetRoles()[user.iRole]);
                sb.Append("]");
                sb.Append("<br>");

                sb.Append("Credits: ");
                sb.Append(user.iCredits);
                sb.Append("<br>");

                sb.Append("Game Tickets: ");
                sb.Append(user.iTickets);
                sb.Append("<br>");

                sb.Append("Last Login: ");
                sb.Append(user.LastLogin.ToString());
                sb.Append("<br>");

                sb.Append("Club Days Left: ");
                sb.Append(user.ClubDaysRemaining);
                sb.Append("<br>");

                sb.Append("Club Months Left: ");
                sb.Append(user.ClubMonthsRemaining);
                sb.Append("<br>");

                sb.Append("Club Months Passed: ");
                sb.Append(user.ClubMonthsPassed);
                sb.Append("<br>");

                sb.Append("Pool Figure: ");
                sb.Append(user.sPoolFigure);
                sb.Append("<br>");

                sb.Append("Current Badge: ");
                sb.Append(user.sBadge);
                sb.Append("<br>");

                sb.Append("Last IP: ");
                sb.Append(user.LastIP);
                sb.Append("<br>");


                lblInfo.Text = sb.ToString();
            }
            else
            {
                lblInfo.Text = "User does not exist";
            }
        }
    }
}
