<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="PetFinder.account" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Shelter Homepage</title>
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
               <h1> My PetFinder Account</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <div class="main">
    
    <h3>Main page reached from login page.</h3>

    <form id="frmMainPage" runat="server">
    <p><a href="Default.aspx">Home</a> | <a href="search.aspx">Search</a></p> | <asp:LinkButton id= "logout" Text="Logout" runat="server" onclick="btnLogout_Click" /></p>

    <p>
        This is the page where you would keep your sensitive information.
    </p>
    <!-- <asp:Button Id="btnLogout" runat="server" Text="Logout" Width="100" OnClick="btnLogout_Click" /> -->
    </div>
    </div>
    </form>
</body>
</html>
