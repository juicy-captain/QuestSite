<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="AppPageProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
        </div>
        <div id="content">
            <asp:Label ID="LabelFirstName" runat="server" Text="FirstName"></asp:Label>
            &nbsp;<asp:Label ID="LabelNickName" runat="server" Text="NickName"></asp:Label>
            &nbsp;<asp:Label ID="LabelSecondName" runat="server" Text="SecondName"></asp:Label>
            <br />
            <asp:HyperLink ID="QuestsLink" runat="server" NavigateUrl="~/App_Page/Quests.aspx">Просмотреть доступные квесты</asp:HyperLink>
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
