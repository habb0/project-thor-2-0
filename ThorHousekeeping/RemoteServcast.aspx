<%@ Page Language="C#" MasterPageFile="~/HousekeepingLayout.Master" AutoEventWireup="true" CodeBehind="RemoteServcast.aspx.cs" Inherits="ThorHousekeeping.RemoteServcast" Title="Untitled Page" %>
<asp:Content ID="cntPageRemotServcast" ContentPlaceHolderID="cntPageContent" runat="server">
    <table width="725" align="center" cellpadding="4" cellspacing="1" bgcolor="#000000">

        <tbody>
            <tr>
                <td width="175" bgcolor="blue">
                    <span class="WHITE">Remote Servcast</span>
                </td>
            </tr>
            <tr>
                <td height="309" align="left" valign="top" bgcolor="#ffffff">
                    This tool enables you to remotely alert the entire hotel.                  <br />
                 <br />
                     <table bgcolor="#000000" cellpadding="3" cellspacing="1" width="100">
                        <tbody>
                            <tr>
                                <td bgcolor="blue">
                                    <span class="WHITE">Servcast Info</span>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#ffffff">
                                    <p>
                                        <span class="style1"><font face="Verdana" size="1">Message: </font></span>
                                        <br>
                                        <asp:TextBox ID="txtMessage" runat="server" Columns="40" TextMode="MultiLine"></asp:TextBox>
                                        <br>
                                        <asp:Button ID="btnSend" runat="server" Text="Send" onclick="btnSend_Click" 
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
