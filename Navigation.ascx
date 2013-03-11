<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="PetFinder.Navigation" %>

<ul class="nav nav-tabs">
    <li<%= (Page.Title.IndexOf("Home") > -1) ? " class='active'" : "" %>>
        <a href="Default.aspx">Home</a>
    </li>
    <li<%= (Page.Title.IndexOf("Search") > -1) ? " class='active'" : "" %>>
        <a href="search.aspx">Find Pets</a>
    </li>
    <% if (Session["loggedin"] == null)
       { %>
         <li<%= (Page.Title.IndexOf("Register") > -1) ? " class='active'" : "" %>>
            <a href="register.aspx">
            Register</a>
         </li>
         <li<%= (Page.Title.IndexOf("Login") > -1) ? " class='active'" : "" %>>
            <a href="login.aspx">
            Login</a>
         </li>
    <% }
       else
       { %>
         <li<%= (Page.Title.IndexOf("Account") > -1) ? " class='active'" : "" %>>
            <a href="account.aspx">Your Account</a>
         </li>
         <li<%= (Page.Title.IndexOf("Add Pet") > -1) ? " class='active'" : "" %>>
            <a href="addpet.aspx"> Add Pet</a>
         </li>
         <li><asp:LinkButton id="logout" Text="Log Out" runat="server" onclick="btnLogout_Click" /></li>
    <% } %>
</ul>
