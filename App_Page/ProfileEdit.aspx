<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileEdit.aspx.cs" Inherits="App_Page_ProfileEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Редактирование профиля</title>
    <link href="../App_Style/RegistrationStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" runat="server">
        </div>
        <div id="content">
            <div id="generalDescriptionArea" class="descriptionArea">
                <asp:Label ID="NickNameLabel" runat="server" Text="Имя для входа:"></asp:Label>
                <br />
                <asp:Label ID="FirstNameLabel" runat="server" Text="Имя:"></asp:Label>
                <br />
                <asp:Label ID="SecondNameLabel" runat="server" Text="Фамилия:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="OldPassword" runat="server" Text="Введите старый пароль:"></asp:Label>
                <br />
                <asp:Label ID="NewPassword" runat="server" Text="Введите новый пароль:"></asp:Label>
                <br />
                <asp:Label ID="CheckNewPassword" runat="server" Text="Повторите новый пароль:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="BirthDateLabel" runat="server" Text="Дата рождения:"></asp:Label>
                <br />
                <asp:Label ID="GenderLabel" runat="server" Text="Пол:"></asp:Label>
                <br />
                <asp:Label ID="ImageLabel" runat="server" Text="Изображение:"></asp:Label>
            </div>
            <div id="generalInputArea" class="inputArea">
                <asp:TextBox ID="TextBoxNickName" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="TextBoxOldPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxNewPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxCheckNewPassword" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:DropDownList ID="BirthDay" runat="server">
                    <asp:ListItem>День</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem Value="2"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="BirthMonth" runat="server">
                    <asp:ListItem Selected="True">Месяц</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="BirthYear" runat="server">
                    <asp:ListItem Value="1">Год</asp:ListItem>
                    <asp:ListItem>1995</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text="Мужской" />
                <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text="Женский" />
                <br />
                <asp:FileUpload ID="AvatarUpload" runat="server" />
                <br />
                <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
            </div>
            <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" />
        </div>
        <div id="footer">
        </div>
    </form>
</body>
</html>
