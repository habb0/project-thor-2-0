<%@ Page Language="C#" MasterPageFile="~/HousekeepingLayout.Master" AutoEventWireup="true" CodeBehind="NameChange.aspx.cs" Inherits="ThorHousekeeping.NameChange" Title="Untitled Page" %>
<asp:Content ID="cntPageNameChange" ContentPlaceHolderID="cntPageContent" runat="server">
    <table width="725" align="center" cellpadding="4" cellspacing="1" bgcolor="#000000">

        <tbody>
            <tr>
                <td width="175" bgcolor="blue">
                    <span class="WHITE">Name Change Tool</span>
                </td>
            </tr>
            <tr>
                <td height="309" align="left" valign="top" bgcolor="#ffffff">
                 This tool enables you to change a users name. You should make sure the user is logged off when you use this.
                 <br />
                 <br />
                     <table bgcolor="#000000" cellpadding="3" cellspacing="1" width="100">
                        <tbody>
                            <tr>
                                <td bgcolor="blue">
                                    <span class="WHITE">User Info</span>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#ffffff">
                                    <p>
                                        <span class="style1"><font face="Verdana" size="1">Username: </font></span>
                                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">New Name: </font></span>
                                        <asp:TextBox ID="txtNewUsername" runat="server"></asp:TextBox>
                                        <br>
                                        <asp:Button ID="btnApply" runat="server" Text="Apply Name" onclick="btnApply_Click" 
                                              />
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
