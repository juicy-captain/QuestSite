<%@ Page Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminQuestEdit.aspx.cs" Inherits="App_Page_AdminQuestEdit" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        <div id="questInfo">
            <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuests.aspx" />
            <asp:Button ID="ButtonDelete" runat="server" Text="Удалить" PostBackUrl="~/App_Page/AdminQuests.aspx" OnClick="ButtonDelete_Click" />
            <asp:Button ID="ButtonAddNewStage" runat="server" Text="Добавиьт новый этап" PostBackUrl="~/App_Page/AdminStageEdit.aspx" OnClick="ButtonAddNewStage_Click"/>
            <div id="descriptionArea" class="descriptionArea">
                <asp:Label ID="LabelName" runat="server" Text="Название:"></asp:Label>
                <br />
                <asp:Label ID="LabelDescription" runat="server" Text="Описание:"></asp:Label>
                <br />
                <asp:Label ID="LabelStartDate" runat="server" Text="Время начала:"></asp:Label>
                <br />
                <asp:Label ID="LabelExpirationDate" runat="server" Text="Время окончания:"></asp:Label>
                <br />
                <asp:Label ID="LabelComplexityLevel" runat="server" Text="Уровень сложности:"></asp:Label>
            </div>
            <div id="generalInputArea" class="inputArea">
                <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxDescription" runat="server"></asp:TextBox>
                <br />
                <asp:DropDownList ID="StartDay" runat="server">
                    <asp:ListItem>День</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="StartMonth" runat="server">
                    <asp:ListItem Selected="True">Месяц</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="StartYear" runat="server">
                    <asp:ListItem Value="1">Год</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:DropDownList ID="ExpirationDay" runat="server">
                    <asp:ListItem>День</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ExpirationMonth" runat="server">
                    <asp:ListItem Selected="True">Месяц</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ExpirationYear" runat="server">
                    <asp:ListItem Value="1">Год</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RadioButton ID="LevelEasy" runat="server" GroupName="LevelGroup" Text="Easy" />
                <asp:RadioButton ID="LevelMedium" runat="server" GroupName="LevelGroup" Text="Medium" />
                <asp:RadioButton ID="LevelHard" runat="server" GroupName="LevelGroup" Text="Hard" />
                <asp:RadioButton ID="LevelCrazy" runat="server" GroupName="LevelGroup" Text="Crazy" />
            </div>
        </div>
        <ul id="stagesList" runat="server"/>
    </div>
</asp:Content>
