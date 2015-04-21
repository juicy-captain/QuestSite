<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="AppPageRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Регистрация</title>
    <%--<link href="../App_Style/RegistrationStyle.css" rel="stylesheet" type="text/css" />--%>
    
</head>
<body>
    <form id="form1" runat="server">
        
        

    <div>

    
        <asp:Wizard ID="RegistrationWizard" runat="server" Height="247px" Width="519px" DisplaySideBar="False" ActiveStepIndex="0" HeaderText="Регистрационная форма" OnFinishButtonClick="RegistrationWizard_FinishButtonClick" FinishDestinationPageUrl="~/App_Page/Profile.aspx">
            <StartNavigationTemplate>
                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" />
            </StartNavigationTemplate>
            <WizardSteps>
                <asp:WizardStep runat="server" title="Основная информация">
                    <div id="generalDescriptionArea" class="descriptionArea">
                        <asp:Label ID="NickNameLabel" runat="server" Text="Имя для входа:"></asp:Label>
                        <br />
                        <asp:Label ID="FirstNameLabel" runat="server" Text="Имя:"></asp:Label>
                        <br />
                        <asp:Label ID="SecondNameLabel" runat="server" Text="Фамилия:"></asp:Label>
                        <br />
                        <asp:Label ID="Password" runat="server" Text="Пароль:"></asp:Label>
                    </div>
                    <div id="generalInputArea" class="inputArea">
                        <asp:TextBox ID="TextBoxNickName" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                    </div>

                </asp:WizardStep>
                <asp:WizardStep runat="server" title="Дополнительная информация">
                    <div id="additionalDescriptionArea" class="descriptionArea">
                        <asp:Label ID="BirthDateLabel" runat="server" Text="Дата рождения:"></asp:Label>
                        <br />
                        <asp:Label ID="GenderLabel" runat="server" Text="Пол:"></asp:Label>
                        <br />
                        <asp:Label ID="ImageLabel" runat="server" Text="Изображение:"></asp:Label>
                    </div>
                    <div id="additionalInputArea" class="inputArea">
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
                    </div>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    </div>
        
        

    </form>
</body>
</html>
