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
    public partial class RemoteBan : System.Web.UI.Page
    {
        UserInfo mUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Remote Ban";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_ban"))
            {
                Response.Redirect("./Default.aspx");
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (InstanceManager.Game.Users.UserExists(txtUsername.Text))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(txtUsername.Text);

                ServerCommunicator servComm = new ServerCommunicator();

                string message = ThorServer.Utilities.SpecialFiltering.FilterChars("1,2,9", txtMessage.Text);

                InstanceManager.Game.Moderation.ModerationData.BanUser(user.userId, mUser.userId, message, int.Parse(ddBanLength.SelectedValue), chkBanIp.Checked);
                InstanceManager.Game.Moderation.LogCommand(mUser.userId, user.userId, "ban", message, txtExtra.Text);
                servComm.SendModCommandToServer("remoteban", mUser.userId, user.userId, message);
                
                lblInfo.Text = "Done!";
            }
            else
            {
                lblInfo.Text = "Invalid user!";
            }
        }
    }
}
