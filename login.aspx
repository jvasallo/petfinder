<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PetFinder.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>PetFinder Shelter Login</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <style type="text/css">
        td      { padding-top:0.15cm; padding-bottom:0.15cm;
                  padding-left:0.5cm; padding-right:0.5cm; }
        tr      { text-align:center; }
    .field  {width:150px}

</style>
</head>
<body>
    <h2>Login to PetFinder</h2>

    <form id="frmLogin" runat="server">

    <table>
        <tr>
            <td>Username:</td>
            <td> <asp:TextBox Id="txtUserName" CssClass="field"  runat="server" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txtPassword" CssClass="field" runat="server" TextMode="Password" /></td>
        </tr>
        <tr>
            <td><asp:Button  ID="btnLogin" runat="server" CssClass="field" Text="Login"  OnClick="btnLogin_Click" /></td>
        </tr>
    </table>

    <p style="color:Red">
        <asp:Literal ID="litMessage" runat="server" />
    </p>
    </form>
</body>
</html>