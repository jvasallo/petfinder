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
</asp:content>