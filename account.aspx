<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="PetFinder.account" %>
<%@ Register TagPrefix="Petfinder" TagName="Navigation" Src="~/Navigation.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Shelter Homepage</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
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
    <PetFinder:Navigation runat="server" ID="Navigation" />
    <p>
        Welcome to your account! Below you can find all your posted pets and delete pets who have already been adopted! You can add more pets using the Add Pet link above! Thanks for using PetFinder!
    </p>
    </div>
    </div>
</body>
</html>
