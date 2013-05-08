<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="ThorHousekeeping.Logon" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <title>Thor Housekeeping</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="res/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <form id="form1" runat="server">
    <table width="400" align="center">
        <tbody>
            <tr>
                <td>
                    <table bgcolor="#000000" cellpadding="3" cellspacing="1" width="100">
                        <tbody>
                            <tr>
                                <td bgcolor="blue">
                                    <span class="WHITE">Log in</span>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#ffffff">
                                    <p>
                                        <span class="style1"><font face="Verdana" size="1">Username: </font></span>
                                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                                        <br>
                                        <span class="style1"><font face="Verdana" size="1">Password: </font></span>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <br>
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                            onclick="btnLogin_Click" />
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <span class="HEADLINE">Project Thor Housekeeping</span><br>
                    <p>
                        &nbsp;</p>
                    <p>
                        Welcome to the Project Thor Housekeeping. This service is monitered closely.</p>
                    <p>
                        &nbsp;</p>
                    <p>
                        Your username and password to this area are personal. <strong>Never </strong>give
                        them to anyone under <strong>any </strong>situation.
                    </p>
                </td>
            </tr>
        </tbody>
    </table>
    <br>
    <p align="center">
        <font face="verdana" size="1" color="#FF0000">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label></font></p>
    <br>
    </form>
</body>
</html>
