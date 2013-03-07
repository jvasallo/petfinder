<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PetFinder.login" MasterPageFile="~/Site1.Master" Title="Shelter Login" %>

<asp:content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Username:</td>
            <td> <asp:TextBox Id="txtUserName" CssClass="field"  runat="server" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txtPassword" CssClass="field" runat="server" TextMode="Password" /></td>
        </tr>
        <tr>
            <td><asp:Button  ID="btnLogin" runat="server" CssClass="field" Text="Login"  OnClick="btnLogin_Click" /></td>
        </tr>
    </table>

    <p style="color:Red">
        <asp:Literal ID="litMessage" runat="server" />
    </p>
</asp:content>