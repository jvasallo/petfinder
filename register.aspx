<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="PetFinder.register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PetFinder Registeration</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <style type="text/css">
        td      { padding-top:0.15cm; padding-bottom:0.15cm;
                  padding-left:0.5cm; padding-right:0.5cm; }
        tr      { text-align:center; }
        .field  { width:150px}
        .error  { color:red}
    </style>
</head>
<body>
    <div class="page">
        <div class="header">
            <div class="title">
               <h1> Register Your Shelter with PetFinder!</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <div class="main">
    <p><a href="Default.aspx">Home</a> | <a href="login.aspx">Login</a> | <a href="search.aspx">Search</a></p>
    <p>By registering, you can add pets that need adoption to our pet database!</p>
    <form id="frmLogin" runat="server">
    <table>
        <tr>
            <td>Shelter Name: </td>
            <td><asp:TextBox Id="txtNewShelterName" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoShelterName" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Email Address: </td>
            <td><asp:TextBox Id="txtNewEmailAddress" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoEmail" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Username: </td>
            <td><asp:TextBox Id="txtNewUserName" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoName" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Password: </td>
            <td><asp:TextBox ID="txtNewPassword" Cssclass="field" runat="server" TextMode="Password" /></td>
            <td><asp:CompareValidator ID="CompareValidator1" runat="server" controltovalidate="txtVerifyPassword" 
                                                                            controltocompare="txtNewPassword" 
                                                                            operator="Equal" type="string" 
                                                                            errormessage="Passwords don't match." /></td>
        </tr>
        <tr>
            <td>Verify Password: </td>
            <td><asp:TextBox ID="txtVerifyPassword" CssClass="field" runat="server" TextMode="Password" /></td>
            <td><asp:label id="lblNoPass" runat="server" CssClass="error" /></td>
        </tr>
    </table>
    <asp:Button  ID="Button1" runat="server" CssClass="field" Text="Register"  OnClick="btnRegister_Click" />
    
    <p style="color:Red"><asp:Literal ID="litMessage" runat="server" /></p>
    </form>
    </div>
    </div>
</body>
</html>
