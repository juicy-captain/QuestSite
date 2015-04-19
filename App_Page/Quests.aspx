<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quests.aspx.cs" Inherits="AppPageQuests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="header">
            </div>
            <div id="content">
                <div id="quests container">
                    <asp:Panel runat="server" ID="QuestsPanel">
                        <ul id="QuestsList" runat="server">
                        </ul>
                    </asp:Panel>
                </div>
            </div>
            <div id="footer">
            </div>
        </div>
    </form>
</body>
</html>
