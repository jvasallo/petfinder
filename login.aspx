<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PetFinder.login" MasterPageFile="Site1.Master" Title="Shelter Login" %>

<asp:content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-horizontal">
        <div class="controls-row">
            <label for="txtUserName" class="control-label">Username: </label>
            <div class="controls">
                <asp:TextBox Id="txtUserName" CssClass="field"  runat="server" />
            </div>
        </div>

        <div class="controls-row with-space">
            <label for="txtPassword" class="control-label">Password: </label>
            <div class="controls">
                <asp:TextBox ID="txtPassword" CssClass="field" runat="server" TextMode="Password" />
            </div>
        </div>

        <div class="controls-row with-space">
            <div class="controls">
                <asp:Button  ID="btnLogin" runat="server" CssClass="btn btn-large" Text="Login"  OnClick="btnLogin_Click" />
            </div>
        </div>
        
    </div>

    <p style="color:Red">
        <asp:Literal ID="litMessage" runat="server" />
    </p>
</asp:content>