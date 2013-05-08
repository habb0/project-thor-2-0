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

using ThorServer;
using ThorServer.Game.Users;

namespace ThorHousekeeping
{
    public partial class CreditChange : System.Web.UI.Page
    {
        UserInfo mUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Credits Tool";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_housekeeping_user_changecredits"))
            {
                Response.Redirect("./Default.aspx");
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (InstanceManager.Game.Users.UserExists(txtUsername.Text))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(txtUsername.Text);

                int newCreds;

                if (int.TryParse(txtCredits.Text, out newCreds))
                {
                    user.iCredits = newCreds;
                    InstanceManager.Game.Users.UpdateUser(user);
                    InstanceManager.Game.Moderation.LogCommand(mUser.userId, user.userId, "changecredits", "New Credits: " + user.iCredits.ToString(), "Housekeeping");
                    ServerCommunicator servComm = new ServerCommunicator();
                    servComm.SendModCommandToServer("updatecredits", mUser.userId, user.userId, "None");
                    lblInfo.Text = "Credits updated!";
                }
                else
                {
                    lblInfo.Text = "Credits must be a number!";
                }
            }
            else
            {
                lblInfo.Text = "Invalid user!";
            }
        }
    }
}
