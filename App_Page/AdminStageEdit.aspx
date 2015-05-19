<%@ Page Title="" Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminStageEdit.aspx.cs" Inherits="App_Page_AdminStageEdit" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        <div id="generalDescriptionArea" class="descriptionArea">
            <asp:Label ID="LabelTitle" runat="server" Text="Название:"></asp:Label>
            <br />
            <asp:Label ID="LabelQuestion" runat="server" Text="Вопрос:"></asp:Label>
            <br />
            <asp:Label ID="LabelAnswer" runat="server" Text="Овет:"></asp:Label>
            <br />
            <asp:Label ID="LabelOrdinal" runat="server" Text="Порядковый номер:"></asp:Label>
        </div>
        <div id="generalInputArea" class="inputArea">
            <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxQuestion" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxAnswer" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBoxOrdinal" runat="server"></asp:TextBox>
            <br />
        </div>
        <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuestEdit.aspx" />
        <asp:Button ID="ButtonDelete" runat="server" Text="Удалить" OnClick="ButtonDelete_Click" PostBackUrl="~/App_Page/AdminQuestEdit.aspx" />
    </div>
</asp:Content>

