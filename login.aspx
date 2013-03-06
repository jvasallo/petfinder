<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PetFinder.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pet Finder Login</title>
    <link href="Site.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        td      { padding-top:0.15cm; padding-bottom:0.15cm;
                  padding-left:0.5cm; padding-right:0.5cm; }
        tr      { text-align:center; }
    .field  {width:150px}
</style>
</head>
<body>
    <div class="page">
        <div class="header">
            <div class="title">
               <h1> Pet Finder Shelter Login</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <div class="main">
    <p><a href="Default.aspx">Home</a> | <a href="register.aspx">Register</a> | <a href="search.aspx">Search</a></p>

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
    </div>
    </div>
</body>
</html>