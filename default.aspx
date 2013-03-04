<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PetFinder.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder</title>
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
               <h1> Welcome to PetFinder!</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <div class="main">
    <a href="Default.aspx">Home</a> | <a href="register.aspx">Register</a> | <a href="login.aspx">Login</a> | <a href="search.aspx">Search</a>
    <br />
    <br />
    <br />
    <a href="register.aspx">Shelter Registration</a>
    <a href="search.aspx">Search for Pets!</a>
    <form id="form1" runat="server">
    </form>
    </div>
    </div>
</body>
</html>
