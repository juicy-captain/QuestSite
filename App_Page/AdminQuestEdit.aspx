<%@ Page Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminQuestEdit.aspx.cs" Inherits="App_Page_AdminQuestEdit" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        <div id="questInfo">
            
          
            <asp:Button ID="ButtonDelete" runat="server" Text="Удалить" PostBackUrl="~/App_Page/AdminQuests.aspx" OnClick="ButtonDelete_Click" />
            <asp:Button ID="ButtonAddNewStage" runat="server" Text="Добавить новый этап" PostBackUrl="~/App_Page/AdminStageEdit.aspx" OnClick="ButtonAddNewStage_Click" />
            <%--<asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuests.aspx" />--%>
            <asp:LinkButton runat="server" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuests.aspx" Text="Save" ></asp:LinkButton>

            <div> &nbsp;</div>
            <table>
              
                <tr>
                    <td>  <asp:Label ID="LabelName" runat="server" Text="Название:"></asp:Label></td>
                    <td> <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td> <asp:Label ID="LabelDescription" runat="server" Text="Описание:"></asp:Label></td>
                    <td> <asp:TextBox ID="TextBoxDescription" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>   <asp:Label ID="LabelStartDate" runat="server" Text="Время начала:"></asp:Label></td>
                    <td> <asp:DropDownList ID="StartDay" runat="server">
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
                </asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label ID="LabelExpirationDate" runat="server" Text="Время окончания:"></asp:Label></td>
                    <td><asp:DropDownList ID="ExpirationDay" runat="server">
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
                </asp:DropDownList></td>
                </tr>
                <tr>
                    <td> <asp:Label ID="LabelComplexityLevel" runat="server" Text="Уровень сложности:"></asp:Label></td>
                    <td> <asp:RadioButton ID="LevelEasy" runat="server" GroupName="LevelGroup" Text="Easy" />
                <asp:RadioButton ID="LevelMedium" runat="server" GroupName="LevelGroup" Text="Medium" />
                <asp:RadioButton ID="LevelHard" runat="server" GroupName="LevelGroup" Text="Hard" />
                <asp:RadioButton ID="LevelCrazy" runat="server" GroupName="LevelGroup" Text="Crazy" /></td>
                </tr>
                
            </table>
             &nbsp;
            <br/>
            
        </div>
       
        <ul id="stagesList" runat="server" />
       
    </div>
  
   
</asp:Content>
