﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authorization.aspx.cs" Inherits="AppPageAuthorization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Вход</title>
    <link href="../App_Style/AuthorizationStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
        </div>
        <div id="content">
            <div id="authorizationArea" runat="server">
                <asp:Label ID="LabelUserName" runat="server" Text="Имя"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="LabelPassword" runat="server" Text="Пароль"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                <br />
                <asp:CheckBox ID="CheckBoxAdministrator" runat="server" Text="Администратор" />
                <br />
                <asp:Button ID="ButtonAuthorization" runat="server" Text="Вход" OnClick="ButtonAuthorization_Click" />
            </div>
            <div id="notRegisteredArea">
                <asp:Label ID="LabelNotRegistered" runat="server" Text="Вы не зарегестроровались" Visible="false"></asp:Label>
                <br />
                <asp:Button ID="ButtonGoToRegistration" runat="server" Text="Зарегистрироваться" PostBackUrl="~/App_Page/Registration.aspx" Visible="false"/>
            </div>
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
