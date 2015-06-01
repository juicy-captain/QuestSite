<%@ Page Title="Добаление этапа" Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminStageEdit.aspx.cs" Inherits="App_Page_AdminStageEdit"  %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        
        <div>&nbsp;</div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="LabelTitle" runat="server" Text="Название:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxTitle" runat="server"></asp:TextBox></td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelQuestion" runat="server" Text="Вопрос:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxQuestion" runat="server"></asp:TextBox></td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelAnswer" runat="server" Text="Ответ:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxAnswer" runat="server"></asp:TextBox></td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelOrdinal" runat="server" Text="Порядковый номер:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBoxOrdinal" runat="server"></asp:TextBox></td>

            </tr>
        </table>

        <div>&nbsp;</div>
    </div>
    <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuestEdit.aspx" />
    <asp:Button ID="ButtonDelete" runat="server" Text="Удалить" OnClick="ButtonDelete_Click" PostBackUrl="~/App_Page/AdminQuestEdit.aspx" />

</asp:Content>

