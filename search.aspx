<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PetFinder.search" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Pet Finder Search</title>
    <link href="Site.css" rel="Stylesheet" type="text/css" />
</head>

<body>
    <div class="page">
        <div class="header">
            <div class="title">
               <h1> Pet Finder Search Results</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <div class="main">
    <form id="form1" runat="server">
    <p><a href="Default.aspx">Home</a> | <a href="register.aspx">Register</a> | <a href="login.aspx">Login</a></p>
    <table>
    <tr>
        <td colspan="4"> 
        Enter Search Terms:
        </td>
    </tr>
    <tr>
        <td>Pet Type: </td>
        <td>Age: </td>
        <td>Keywords: </td>
        <td> </td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList id="lstCategory" runat="server">
                <asp:ListItem Value='N' Selected="True">Select...</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:TextBox id="txtPetAge" width="60px" runat="server"/>
        </td>
        <td>
            <asp:TextBox id="txtDescription" runat="server"/>
        </td>
        <td>
             <asp:Button ID="btnSearch" Text="Select" onclick="btnSearch_Click"  runat="server" />
        </td>
    </tr>
    <tr>
        <td> </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                 ControlToValidate="txtPetAge" Display="Dynamic" 
                 ErrorMessage="Please enter a valid age." ForeColor="#CC3300" 
                 ValidationExpression="\d"></asp:RegularExpressionValidator>
        </td>
        <td></td>
        <td><asp:Label ID="litMessage" runat="server" /></td>
    </tr>
    </table>
    <p>&nbsp;</p>
    <asp:GridView ID="gvCatalog" runat="server" DataKeyNames="PetName" cellpadding="10" cellspacing="5"/>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" /> 
    </form>
    </div>
    </div>
</body>
</html>
