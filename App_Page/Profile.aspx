<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="AppPageProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ваш профиль</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server">
        </div>
        <div id="content">
            <asp:Button ID="ButtonDeleteProfile" runat="server" Text="Удалить профиль" OnClick="ButtonDeleteProfile_Click"/>
            <br />
            <asp:Button ID="ButtonLogout" runat="server" Text="Log out" PostBackUrl="~/App_Page/Default.aspx" OnClick="ButtonLogout_Click"/>
            <br />
            <asp:Button ID="ButtonEditProfile" runat="server" Text="Редактировать профиль" PostBackUrl="~/App_Page/ProfileEdit.aspx"/>
            <br />
            <asp:Label ID="LabelFirstName" runat="server" Text="FirstName"></asp:Label>
            &nbsp;<asp:Label ID="LabelNickName" runat="server" Text="NickName"></asp:Label>
            &nbsp;<asp:Label ID="LabelSecondName" runat="server" Text="SecondName"></asp:Label>
            <br />
            <asp:Image ID="Avatar" runat="server"/>
            <br />
            <asp:LinkButton ID="QuestsLink" runat="server" PostBackUrl="~/App_Page/Quests.aspx">Просмотреть доступные квесты</asp:LinkButton>

            <div id="subscriptions">
                <asp:Label ID="LabelSubscriptions" runat="server" Text="Вы подписались на следующие кветы:"></asp:Label>
                <ul id="QuestsList" runat="server">
                </ul>
            </div>
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
