<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="PetFinder.Navigation" %>

<ul class="nav nav-tabs">
    <li><a href="Default.aspx">Home</a></li>
    <li><a href="search.aspx">Find Pets</a></li>
    <% if (Session["loggedin"] == null)
       { %>
         <li><a href="register.aspx">Register</a></li>
         <li><a href="login.aspx">Login</a></li>
    <% }
       else
       { %>
         <li><a href="account.aspx">Your Account</a></li>
         <li><a href="addpet.aspx"> Add Pet</a></li>
         <li><asp:LinkButton id="logout" Text="Log Out" runat="server" onclick="btnLogout_Click" /></li>
    <% } %>
</ul>
