<%@ Page Language="C#" MasterPageFile="~/HousekeepingLayout.Master" AutoEventWireup="true" CodeBehind="SpawnFurni.aspx.cs" Inherits="ThorHousekeeping.SpawnFurni" Title="Untitled Page" %>
<asp:Content ID="cntPageSpawnFurni" ContentPlaceHolderID="cntPageContent" runat="server">
<table width="725" align="center" cellpadding="4" cellspacing="1" bgcolor="#000000">

        <tbody>
            <tr>
                <td width="175" bgcolor="blue">
                    <span class="WHITE">Spawn Furnitue</span>
                </td>
            </tr>
            <tr>
                <td height="309" align="left" valign="top" bgcolor="#ffffff">
                 This tool enables you to spawn furniture.
                 <br />
                 <br />
                     <table bgcolor="#000000" cellpadding="3" cellspacing="1" width="100">
                        <tbody>
                            <tr>
                                <td bgcolor="blue">
                                    <span class="WHITE">Item Info</span>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#ffffff">
                                    <p>
                                        <span class="style1"><font face="Verdana" size="1">Username: </font></span><br />
                                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Purchase Code: </font></span>
                                        <asp:DropDownList ID="ddPurchaseCode" runat="server">
                                        </asp:DropDownList>
                                        <br>
                                        <br>
                                        <asp:CheckBox ID="chkIsGift" runat="server" Text="Is Gift" />
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Gift Message: </font></span><br />
                                        <asp:TextBox ID="txtMessage" runat="server" MaxLength="202"></asp:TextBox>
                                        <br>
                                        <asp:Button ID="btnApply" runat="server" Text="Spawn" 
                                            onclick="btnApply_Click"  />
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br />
                     <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
                </td>
            </tr>
           
        </tbody>
    </table>
</asp:Content>
