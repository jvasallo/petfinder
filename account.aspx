<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="PetFinder.account" MasterPageFile="~/Site1.Master" Title="Your Account" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Welcome to your account! Below you can find all your posted pets and delete pets who have already been adopted! You can add more pets using the Add Pet link above! Thanks for using PetFinder!
    </p>
    <br />
    <br />
    <h2>Your Pets</h2>
    <hr />
    <asp:GridView ID="gvCatalog" runat="server" DataKeyNames="PetFinder ID" cellpadding="10" cellspacing="5">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnDelete" Runat="server" OnClientClick="return confirm('Are you sure you?');" OnCommand="btnDelete_Click" CommandArgument='<%#Eval("PetFinder ID")%>'>Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <p style="color:Red"><asp:Literal ID="litMessage" runat="server" /></p>
</asp:Content>
