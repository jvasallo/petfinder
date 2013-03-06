<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PetFinder.Default" %>
<%@ Register TagPrefix="Petfinder" TagName="Navigation" Src="~/Navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
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
    <form runat="server">
    <PetFinder:Navigation runat="server" ID="Navigation" />
    <br />
    <a href="register.aspx">Shelter Registration</a>
    <a href="search.aspx">Search for Pets!</a>
    </div>
    </form>
    </div>
</body>
</html>
