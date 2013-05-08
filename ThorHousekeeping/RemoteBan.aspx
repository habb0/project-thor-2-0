<%@ Page Language="C#" MasterPageFile="~/HousekeepingLayout.Master" AutoEventWireup="true" CodeBehind="RemoteBan.aspx.cs" Inherits="ThorHousekeeping.RemoteBan" Title="Untitled Page" %>
<asp:Content ID="cntPageRemoteBan" ContentPlaceHolderID="cntPageContent" runat="server">
    <table width="725" align="center" cellpadding="4" cellspacing="1" bgcolor="#000000">

        <tbody>
            <tr>
                <td width="175" bgcolor="blue">
                    <span class="WHITE">Remote Ban</span>
                </td>
            </tr>
            <tr>
                <td height="309" align="left" valign="top" bgcolor="#ffffff">
                    This tool enables you to remotely ban a hotel user. They do not need to be 
                    online.
                 <br />
                 <br />
                     <table bgcolor="#000000" cellpadding="3" cellspacing="1" width="100">
                        <tbody>
                            <tr>
                                <td bgcolor="blue">
                                    <span class="WHITE">Ban Info</span>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#ffffff">
                                    <p>
                                        <span class="style1"><font face="Verdana" size="1">Username: </font></span>
                                        <br>
                                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Length: </font></span>
                                        <br>
                                        <asp:DropDownList ID="ddBanLength" runat="server">
                                            <asp:ListItem Selected="True" Value="1">1 Hour</asp:ListItem>
                                            <asp:ListItem Value="2">2 Hours</asp:ListItem>
                                            <asp:ListItem Value="6">6 Hours</asp:ListItem>
                                            <asp:ListItem Value="12">12 Hours</asp:ListItem>
                                            <asp:ListItem Value="24">1 Day</asp:ListItem>
                                            <asp:ListItem Value="168">7 Days</asp:ListItem>
                                            <asp:ListItem Value="336">14 Days</asp:ListItem>
                                            <asp:ListItem Value="744">1 Month</asp:ListItem>
                                            <asp:ListItem Value="87360">Permanent</asp:ListItem>
                                            <asp:ListItem Value="0">Hotel Kick</asp:ListItem>
                                        </asp:DropDownList>
                                        <br>
                                        <asp:CheckBox ID="chkBanIp" runat="server" Text="Ban IP" />
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Message:                                   <br>
                                        <asp:TextBox ID="txtMessage" runat="server" Columns="40" TextMode="MultiLine"></asp:TextBox>
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Extra Info:                                   <br>
                                        <asp:TextBox ID="txtExtra" runat="server" Columns="40" TextMode="MultiLine"></asp:TextBox>
                                        <br>
                                        <asp:Button ID="btnSend" runat="server" Text="Execute" onclick="btnSend_Click" 
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
