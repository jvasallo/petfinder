<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addpet.aspx.cs" Inherits="PetFinder.addpet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PetFinder Shelter Homepage</title>
    <link rel="stylesheet" type="text/css" href="Site.css" />
    <style type="text/css">
        td      { padding-top:0.15cm; padding-bottom:0.15cm;
                  padding-left:0.5cm; padding-right:0.5cm; }
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
    <form id="frmMainPage" runat="server">
    <PetFinder:Navigation runat="server" ID="Navigation" />

    <p>
        On this page, add new pets that come into your shelter for the world to see!</p>
    <table>
        <tr>
            <td>Pet Name: </td>
            <td><asp:TextBox Id="txtNewPetName" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoPetName" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Pet Type: </td>
            <td><asp:dropdownlist id="lstCategory" runat="server"/></td>
            <td> </td>
        </tr>
        <tr>
            <td>Sex: </td>
            <td><asp:dropdownlist id="txtNewPetSex" runat="server">
                <asp:ListItem Value='N' Selected="True">Select...</asp:ListItem>
                <asp:ListItem Value='M'>M</asp:ListItem>
                <asp:ListItem Value='F'>F</asp:ListItem>
            </asp:dropdownlist>
            </td>
            <td><asp:Label id="lblNoPetSex" runat="server" CssClass="error" /></td>
        </tr>
        <tr>
            <td>Age: </td>
            <td><asp:TextBox Id="txtNewPetAge" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoPetAge" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Description: </td>
            <td><asp:TextBox ID="txtNewPetDescription" Cssclass="field" runat="server" TextMode="multiline" /></td>
            <td><asp:label id="lblNoPetDescription" runat="server" CssClass="error" /></td>
        </tr>
    </table>
    <asp:Button  ID="Button1" runat="server" CssClass="field" Text="Add Pet"  OnClick="btnAddPet_Click" />
    
    <p style="color:Red"><asp:Literal ID="litMessage" runat="server" /></p>
    </form>
    </div>
    </div>
</body>
</html>
