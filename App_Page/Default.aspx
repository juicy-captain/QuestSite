<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="App_Page_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <asp:HyperLink ID="RegistrationLink" runat="server" NavigateUrl="~/App_Page/Registration.aspx">Регистрация</asp:HyperLink>
            <asp:HyperLink ID="AuthorizationLink" runat="server" NavigateUrl="~/App_Page/Authorization.aspx">Вход</asp:HyperLink>
        </div>
        <div id="content">
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
