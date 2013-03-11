<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PetFinder.Default" MasterPageFile="~/Site1.Master" Title="Home" %>
<%@ Register TagPrefix="Petfinder" TagName="Pet" Src="~/Pet.ascx" %>

<asp:content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="span12">
            <h2>Featured Pets</h2>
        </div>
    </div>
    <div id="featured-pets" class="row">
        <Petfinder:Pet runat="server" ID="Pet1" />
        <Petfinder:Pet runat="server" ID="Pet2" />
        <Petfinder:Pet runat="server" ID="Pet3" />
    </div>
    <div class="row">
        <div id="submenu">
            <br />
            <div class="span6">
                <h3>Find A Pet</h3>
                <p>What are you waiting for! Begin your search today and find your perfect pet!</p>
                <a href="search.aspx" class="btn btn-large"><i class="icon-search"></i> Search</a>
            </div>
            <div class="span6">
                <h3>Shelter Registration</h3>
                <p>Shelter not listed? No problem! Register your shelter today to help all your furry friends find homes!</p>
                <a href="register.aspx" class="btn btn-large btn-warning"><i class="icon-pencil"></i> Shelter Signup</a>
            </div>
        </div>
    </div>
</asp:content>