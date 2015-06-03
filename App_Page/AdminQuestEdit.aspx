<%@ Page Language="C#" MasterPageFile="~/App_Page/AdminPage.master" AutoEventWireup="true" CodeFile="AdminQuestEdit.aspx.cs" Inherits="App_Page_AdminQuestEdit" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="Server">
    <div id="content" runat="server">
        <div id="questInfo">


            <asp:Button ID="ButtonDelete" runat="server" Text="Удалить" PostBackUrl="~/App_Page/AdminQuests.aspx" OnClick="ButtonDelete_Click" />
            <asp:Button ID="ButtonAddNewStage" runat="server" Text="Добавить новый этап" PostBackUrl="~/App_Page/AdminStageEdit.aspx" OnClick="ButtonAddNewStage_Click" />
            <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/AdminQuests.aspx" />
            <div>&nbsp;</div>
            <table>

                <tr>
                    <td>
                        <asp:Label ID="LabelName" runat="server" Text="Название:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelDescription" runat="server" Text="Описание:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TextBoxDescription" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelStartDate" runat="server" Text="Время начала:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="StartDay" runat="server">
                            <asp:ListItem>День</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="StartMonth" runat="server">
                            <asp:ListItem Selected="True">Месяц</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="StartYear" runat="server">
                            <asp:ListItem Value="1">Год</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2009</asp:ListItem>
                            <asp:ListItem>2008</asp:ListItem>
                            <asp:ListItem>2007</asp:ListItem>
                            <asp:ListItem>2006</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>

                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                            <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                            <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1993</asp:ListItem>
                            <asp:ListItem>1992</asp:ListItem>
                            <asp:ListItem>1991</asp:ListItem>
                            <asp:ListItem>1990</asp:ListItem>

                            <asp:ListItem>1989</asp:ListItem>
                            <asp:ListItem>1988</asp:ListItem>
                            <asp:ListItem>1987</asp:ListItem>
                            <asp:ListItem>1986</asp:ListItem>
                            <asp:ListItem>1985</asp:ListItem>
                            <asp:ListItem>1984</asp:ListItem>
                            <asp:ListItem>1983</asp:ListItem>
                            <asp:ListItem>1982</asp:ListItem>
                            <asp:ListItem>1981</asp:ListItem>
                            <asp:ListItem>1980</asp:ListItem>

                            <asp:ListItem>1979</asp:ListItem>
                            <asp:ListItem>1978</asp:ListItem>
                            <asp:ListItem>1977</asp:ListItem>
                            <asp:ListItem>1976</asp:ListItem>
                            <asp:ListItem>1975</asp:ListItem>
                            <asp:ListItem>1974</asp:ListItem>
                            <asp:ListItem>1973</asp:ListItem>
                            <asp:ListItem>1972</asp:ListItem>
                            <asp:ListItem>1971</asp:ListItem>
                            <asp:ListItem>1970</asp:ListItem>

                            <asp:ListItem>1969</asp:ListItem>
                            <asp:ListItem>1968</asp:ListItem>
                            <asp:ListItem>1967</asp:ListItem>
                            <asp:ListItem>1966</asp:ListItem>
                            <asp:ListItem>1965</asp:ListItem>
                            <asp:ListItem>1964</asp:ListItem>
                            <asp:ListItem>1963</asp:ListItem>
                            <asp:ListItem>1962</asp:ListItem>
                            <asp:ListItem>1961</asp:ListItem>
                            <asp:ListItem>1960</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelExpirationDate" runat="server" Text="Время окончания:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="ExpirationDay" runat="server">
                            <asp:ListItem>День</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ExpirationMonth" runat="server">
                            <asp:ListItem Selected="True">Месяц</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ExpirationYear" runat="server">
                            <asp:ListItem Value="1">Год</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2010</asp:ListItem>
                            <asp:ListItem>2009</asp:ListItem>
                            <asp:ListItem>2008</asp:ListItem>
                            <asp:ListItem>2007</asp:ListItem>
                            <asp:ListItem>2006</asp:ListItem>
                            <asp:ListItem>2005</asp:ListItem>
                            <asp:ListItem>2004</asp:ListItem>
                            <asp:ListItem>2003</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2000</asp:ListItem>

                            <asp:ListItem>1999</asp:ListItem>
                            <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                            <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                            <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1993</asp:ListItem>
                            <asp:ListItem>1992</asp:ListItem>
                            <asp:ListItem>1991</asp:ListItem>
                            <asp:ListItem>1990</asp:ListItem>

                            <asp:ListItem>1989</asp:ListItem>
                            <asp:ListItem>1988</asp:ListItem>
                            <asp:ListItem>1987</asp:ListItem>
                            <asp:ListItem>1986</asp:ListItem>
                            <asp:ListItem>1985</asp:ListItem>
                            <asp:ListItem>1984</asp:ListItem>
                            <asp:ListItem>1983</asp:ListItem>
                            <asp:ListItem>1982</asp:ListItem>
                            <asp:ListItem>1981</asp:ListItem>
                            <asp:ListItem>1980</asp:ListItem>

                            <asp:ListItem>1979</asp:ListItem>
                            <asp:ListItem>1978</asp:ListItem>
                            <asp:ListItem>1977</asp:ListItem>
                            <asp:ListItem>1976</asp:ListItem>
                            <asp:ListItem>1975</asp:ListItem>
                            <asp:ListItem>1974</asp:ListItem>
                            <asp:ListItem>1973</asp:ListItem>
                            <asp:ListItem>1972</asp:ListItem>
                            <asp:ListItem>1971</asp:ListItem>
                            <asp:ListItem>1970</asp:ListItem>

                            <asp:ListItem>1969</asp:ListItem>
                            <asp:ListItem>1968</asp:ListItem>
                            <asp:ListItem>1967</asp:ListItem>
                            <asp:ListItem>1966</asp:ListItem>
                            <asp:ListItem>1965</asp:ListItem>
                            <asp:ListItem>1964</asp:ListItem>
                            <asp:ListItem>1963</asp:ListItem>
                            <asp:ListItem>1962</asp:ListItem>
                            <asp:ListItem>1961</asp:ListItem>
                            <asp:ListItem>1960</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelComplexityLevel" runat="server" Text="Уровень сложности:"></asp:Label></td>
                    <td>
                        <asp:RadioButton ID="LevelEasy" runat="server" GroupName="LevelGroup" Text="Easy" />
                        <asp:RadioButton ID="LevelMedium" runat="server" GroupName="LevelGroup" Text="Medium" />
                        <asp:RadioButton ID="LevelHard" runat="server" GroupName="LevelGroup" Text="Hard" />
                        <asp:RadioButton ID="LevelCrazy" runat="server" GroupName="LevelGroup" Text="Crazy" /></td>
                </tr>

            </table>
            &nbsp;
            <br />

        </div>

        <ul id="stagesList" runat="server" />

    </div>


</asp:Content>
