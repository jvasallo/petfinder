<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="PetFinder.register" MasterPageFile="Site1.Master" Title="Register With PetFinder!" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p>By registering your shelter, you can add pets that need adoption to our pet database!</p>
    <table>
        <tr>
            <td>Shelter Name: </td>
            <td><asp:TextBox Id="txtNewShelterName" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoShelterName" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Email Address: </td>
            <td><asp:TextBox Id="txtNewEmailAddress" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoEmail" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Username: </td>
            <td><asp:TextBox Id="txtNewUserName" CssClass="field" runat="server" /></td>
            <td><asp:Label id="lblNoName" runat="server" CssClass="error" /> </td>
        </tr>
        <tr>
            <td>Password: </td>
            <td><asp:TextBox ID="txtNewPassword" Cssclass="field" runat="server" TextMode="Password" /></td>
            <td><asp:CompareValidator ID="CompareValidator1" runat="server" controltovalidate="txtVerifyPassword" 
                                                                            controltocompare="txtNewPassword" 
                                                                            operator="Equal" type="string" 
                                                                            errormessage="Passwords don't match." /></td>
        </tr>
        <tr>
            <td>Verify Password: </td>
            <td><asp:TextBox ID="txtVerifyPassword" CssClass="field" runat="server" TextMode="Password" /></td>
            <td><asp:label id="lblNoPass" runat="server" CssClass="error" /></td>
        </tr>
    </table>

    <div class="controls-row">
        <div class="controls">
            <asp:Button  ID="Button1" runat="server" CssClass="btn btn-large" Text="Register"  OnClick="btnRegister_Click" />
        </div>
    </div>
    
    <p style="color:Red"><asp:Literal ID="litMessage" runat="server" /></p>
</asp:Content>
