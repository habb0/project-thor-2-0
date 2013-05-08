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
    public partial class ReferralTool : System.Web.UI.Page
    {
        UserInfo mUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Referral Tool";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_housekeeping_user_referraltool"))
            {
                Response.Redirect("./Default.aspx");
            }
        }

        protected void btnAction_Click(object sender, EventArgs e)
        {
            ReferralManager refManager = new ReferralManager();
            if (InstanceManager.Game.Users.UserExists(txtUsername.Text))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(txtUsername.Text);

                if (InstanceManager.Game.Users.UserExists(txtReferred.Text))
                {
                    UserInfo referred = InstanceManager.Game.Users.GetUser(txtReferred.Text);

                    if (referred.LastIP != user.LastIP)
                    {
                        if (referred.sEmail != user.sEmail)
                        {
                            if (!refManager.HasBeenReferred(referred.userId))
                            {
                                user.iCredits += int.Parse(UserSettings.ReferralReward);
                                referred.iCredits += int.Parse(UserSettings.ReferredReward);
                                InstanceManager.Game.Users.UpdateUser(user);
                                InstanceManager.Game.Users.UpdateUser(referred);
                                refManager.AddReferral(user.userId, referred.userId);
                                InstanceManager.Game.Moderation.LogCommand(mUser.userId, user.userId, "referral", "Referrer: " + txtUsername.Text + "; Referred: " + txtReferred.Text, "Housekeeping");
                                ServerCommunicator servComm = new ServerCommunicator();
                                servComm.SendModCommandToServer("updatecredits", mUser.userId, user.userId, "None");
                                servComm.SendModCommandToServer("updatecredits", mUser.userId, referred.userId, "None");
                                lblInfo.Text = "Reward Granted.";
                            }
                            else
                            {
                                lblInfo.Text = "Whoops. User has been referred before!";
                            }
                        }
                        else
                        {
                            lblInfo.Text = "Whoops. Email Addresses match!";
                        }
                    }
                    else
                    {
                        lblInfo.Text = "Whoops. IP Addresses match!";
                    }
                }
                else
                {
                    lblInfo.Text = "Referred user does not exist!";
                }
            }
            else
            {
                lblInfo.Text = "Invalid user!";
            }
        }
    }
}
