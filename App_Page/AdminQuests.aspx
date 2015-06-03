<%@ Page Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminQuests.aspx.cs" Inherits="App_Page_AdminQuests" %>

<asp:Content ID="ContentHolder" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        <asp:Button ID="ButtonAddNewQuest" runat="server" Text="Добавить новый квест" PostBackUrl="~/App_Page/AdminQuestEdit.aspx" OnClick="ButtonAddNewQuest_Click"/>
        <asp:Button ID="ButtonRemoveAll" runat="server" Text="Удалить все квесты" PostBackUrl="~/App_Page/AdminQuests.aspx" OnClick="ButtonRemoveAll_Click"/>
    </div>
</asp:Content>
