<%@ Page Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminUsers.aspx.cs" Inherits="App_Page_AdminUsers" %>

<asp:Content ID="ContentHolder" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
                <asp:Button ID="ButtonRemoveAll" runat="server" Text="Удалить всех пользователей" PostBackUrl="~/App_Page/AdminUsers.aspx" OnClick="ButtonRemoveAll_Click"/>
    </div>
    
    
    

</asp:Content>
