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
    public partial class RemoteServcast : System.Web.UI.Page
    {
        UserInfo mUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Remote Servcast";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_admin_servcast"))
            {
                Response.Redirect("./Default.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

            ServerCommunicator servComm = new ServerCommunicator();

            string message = ThorServer.Utilities.SpecialFiltering.FilterChars("1,2,9", txtMessage.Text);

            servComm.SendModCommandToServer("remoteservcast", mUser.userId, 0, message);

            lblInfo.Text = "Servcast was fired!";

        }
    }
}
