<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addpet.aspx.cs" Inherits="PetFinder.addpet" MasterPageFile="~/Site1.Master" Title="Add a Pet" %>

<asp:Content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
</asp:Content>