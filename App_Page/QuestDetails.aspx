﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestDetails.aspx.cs" Inherits="App_Page_QuestDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Детали квеста</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server">
        </div>
        <div id="content">
            <div id="QuestDetails" runat="server">
            </div>
        </div>
        <div id="footer">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" PostBackUrl="~/App_Page/Profile.aspx" />
        </div>
    </form>
</body>
</html>
