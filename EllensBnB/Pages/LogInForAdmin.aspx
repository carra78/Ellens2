<%@ Page Title="" Language="C#" MasterPageFile="~/EllensSiteMaster.Master" AutoEventWireup="true" CodeBehind="LogInForAdmin.aspx.cs" Inherits="EllensBnB.Pages.LogInForAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="login">
    <asp:SiteMapPath ID="SiteMapPath1" Runat="server"></asp:SiteMapPath>
    <p><strong>Enter login details to access Reports</strong></p>
    <p>
       
        <asp:Label ID="lblUserName" runat="server" Text="UserName:"></asp:Label>&nbsp;
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnLogInNew" runat="server" OnClick="btnLogInNew_Click" Text="Log In" />
    </p>
    <p>
        <asp:Label ID="lblLogInStatus" runat="server" Text="LoginStatus: "></asp:Label>
    </p>
    
    
        </div><!--end of login Css Class"-->


</asp:Content>
