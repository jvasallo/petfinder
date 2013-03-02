<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="PetFinder.account" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Pet Finder Shelter Page</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
</head>

<body>

    <h2>Pet Finder Shelter Panel</h2>

    <h3>Main page reached from login page.</h3>

    <form id="frmMainPage" runat="server">

    <p>
        <asp:Button Id="btnLogout" runat="server" Text="Logout" Width="100" OnClick="btnLogout_Click" />
        This is the page where you would keep your sensitive information.
    </p>
    </form>
</body>
</html>
