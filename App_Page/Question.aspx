<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="AppPageQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Задание</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
        </div>
        <div id="content">
            <asp:Label ID="LabelQuestionTitle" runat="server" Text="QuestionTitle"></asp:Label>
            <br />
            <asp:Label ID="LabelQuestionBody" runat="server" Text="QuestionBody"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPlayerAnswer" runat="server" placeholder="Ваш ответ"></asp:TextBox>
            <asp:Button ID="ButtonSendAnswer" runat="server" Text="Отправить ответ" OnClick="ButtonSendAnswer_Click" />
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
