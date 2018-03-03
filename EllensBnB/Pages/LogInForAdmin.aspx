<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="LogInForAdmin.aspx.cs" Inherits="EllensBnB.Pages.LogInForAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>

    <p>
        <br />
        <asp:Label ID="lblUserName" runat="server" Text="UserName:"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnLogInNew" runat="server" OnClick="btnLogInNew_Click" Text="Log In" />
    </p>
    <p>
        <asp:Label ID="lblLogInStatus" runat="server" Text="LoginStatus: "></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
    </p>


</asp:Content>
