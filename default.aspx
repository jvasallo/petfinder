<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PetFinder.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ECT 330 Product Line</title>
    <link href="Site.css" rel="Stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
               <h1> ECT 330 2013 Catalog</h1>
            </div>
            <div class="clear hideSkiplink">  </div>
        </div>
    <p>&nbsp;</p>
    <div class="main">
    <table>
    <tr>
        <td colspan="2"> 
        Select by
        </td>
    </tr>
    <tr>
        <td>
            <asp:RadioButtonList ID="rdoFieldSpecified" runat="server">
              <asp:ListItem Selected="True">SupplierID</asp:ListItem>
              <asp:ListItem>CategoryID</asp:ListItem>
            </asp:RadioButtonList>

        </td>
        <td valign="bottom">
            <asp:TextBox ID="txtIDCode" Text="" runat="server" Width="92px"/>
        </td>
        <td valign="bottom">
             <asp:Button ID="btnSelect" Text="Select" onclick="btnSelect_Click"  runat="server" />
        </td>
        <td valign="bottom">
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                 ControlToValidate="txtIDCode" Display="Dynamic" 
                 ErrorMessage="Please enter a number." Font-Size="Large" ForeColor="#CC3300" 
                 ValidationExpression="\d+"></asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 Display="Dynamic" ErrorMessage="Please enter an ID." 
                 ControlToValidate="txtIDCode" Font-Size="Large" ForeColor="#CC3300"></asp:RequiredFieldValidator>
        </td>
    </tr>
    </table>
    <p>&nbsp;</p>
    <asp:GridView ID="gvCatalog" runat="server" 
        DataKeyNames="ProductID" 
     >

    </asp:GridView>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>   
    </div> 
    </div>
    </form>
</body>
</html>
