<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PetFinder.search" MasterPageFile="~/Site1.Master" Title="Search for Pets" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
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
                 ValidationExpression="\d{0,3}"></asp:RegularExpressionValidator>
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
</asp:Content>
