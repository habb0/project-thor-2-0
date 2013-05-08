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
using System.Collections.Generic;

using ThorServer;
using ThorServer.Game.Users;
using ThorServer.Game.Catalogue;
using ThorServer.Game.Furni;
using ThorServer.Utilities;

namespace ThorHousekeeping
{
    public partial class SpawnFurni : System.Web.UI.Page
    {
        UserInfo mUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Spawn Furniture";

            int userId = (int)Session["userid"];
            mUser = InstanceManager.Game.Users.GetUser(userId);

            if (!InstanceManager.Game.Roles.HasRight(mUser.iRole, "fuse_housekeeping_economy_spawnfurni"))
            {
                Response.Redirect("./Default.aspx");
            }

            if (!Page.IsPostBack)
            {
                PopulatePurchaseCodeList();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (InstanceManager.Game.Users.UserExists(txtUsername.Text))
            {
                UserInfo user = InstanceManager.Game.Users.GetUser(txtUsername.Text);
                int newId = 0;
                
                if (!chkIsGift.Checked)
                {

                    if (InstanceManager.Game.Catalogue.BuyItem("0", ddPurchaseCode.SelectedValue, "", ref user, true, ref newId))
                    {

                        ServerCommunicator servComm = new ServerCommunicator();
                        servComm.SendModCommandToServer("updatehand", mUser.userId, user.userId, "None");

                        lblInfo.Text = "Item Spawned!";
                    }
                    else
                    {
                        lblInfo.Text = "Failed to spawn item!";
                    }
                }
                else
                {
                    int furniId = InstanceManager.Game.Furni.CreateNewFurni(InstanceManager.Game.Furni.GetRandomPresentDefinition(), user.userId);
                    GiftInfo gift = new GiftInfo();
                    gift.GiftId = furniId;
                    gift.Payload = "";
                    gift.PurchaseCode = ddPurchaseCode.SelectedValue;
                    InstanceManager.Game.Furni.AddGift(gift);
                    InstanceManager.Game.Furni.SetStuffDataFloorItem(furniId, "!" + SpecialFiltering.FilterChars("2,9,10,13,47", txtMessage.Text));

                    ServerCommunicator servComm = new ServerCommunicator();
                    servComm.SendModCommandToServer("updatehand", mUser.userId, user.userId, "None");

                    lblInfo.Text = "Gift spawned!";
                }
            }
            else
            {
                lblInfo.Text = "Invalid user!";
            }
        }

        private void PopulatePurchaseCodeList()
        {
            List<string> purchaseCodes = InstanceManager.Game.Catalogue.GetPurchaseCodes();

            foreach(string pCode in purchaseCodes)
            {
                ListItem item = new ListItem(pCode, pCode);
                ddPurchaseCode.Items.Add(item);
            }
        }
    }
}
