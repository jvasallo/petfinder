<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="PetFinder.search" MasterPageFile="~/Site1.Master" Title="Search for Pets" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div class="form-inline">
        <label for="lstCategory" class="control-label">Pet Type:</label>
        <div class="controls">
            <asp:DropDownList id="lstCategory" runat="server">
                <asp:ListItem Value='N' Selected="True">Select...</asp:ListItem>
            </asp:DropDownList>
        </div>

        <label for="txtPetAge" class="control-label">Age:</label>
        <div class="controls">
             <asp:TextBox id="txtPetAge" width="60px" runat="server"/>
        </div>

        <label for="txtDescription" class="control-label">Description:</label>
        <div class="controls">
            <asp:TextBox id="txtDescription" runat="server"/>
        </div>

        <asp:Button ID="btnSearch" Text="Select" onclick="btnSearch_Click"  runat="server" class="btn" />
    </div>

    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                 ControlToValidate="txtPetAge" Display="Dynamic" 
                 ErrorMessage="Please enter a valid age." ForeColor="#CC3300" 
                 ValidationExpression="\d+"></asp:RegularExpressionValidator>

    <p><asp:Label ID="litMessage" runat="server" /></p>

    <asp:GridView ID="gvCatalog" runat="server" DataKeyNames="PetName" class="table table-bordered" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label" />
</asp:Content>
