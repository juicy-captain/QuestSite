<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="AppPageRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Регистрация</title>

    <link href="../App_Style/css/CustomStyleSheet.css" rel="stylesheet" media="screen" />
    <link rel="shortcut icon" href="../App_Style/images/gt_favicon.png">
    <link href="../App_Style/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../App_Style/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../App_Style/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../App_Style/css/main.css" rel="stylesheet" />
    <link rel="shortcut icon" href="../App_Style/favicon.ico" />
    <script src="../App_Style/js/html5shiv.js"></script>
    <script src="../App_Style/js/respond.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">


        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top headroom">
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="Default.aspx">QuestHunter</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav pull-right">
                        <li><a href="Default.aspx">Главная</a></li>
                        <li class="active"><a class="btn" href="Authorization.aspx">Вход</a></li>
                        <li class="active"><a class="btn" href="Registration.aspx">Регистрация</a></li>

                    </ul>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
        <!-- /.navbar -->
        <header id="head" class="secondary"></header>

        <!-- container -->
        <div class="container">

            <ol class="breadcrumb">
                <li><a href="Default.aspx">Главная</a></li>
                <li class="active">Регистрация</li>
            </ol>

            <div class="row">

                <!-- Article main content -->
                <article class="col-xs-12 maincontent">
                    <header class="page-header">
                        <h1 class="page-title">Регистрация</h1>
                    </header>

                    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h3 class="thin text-center">Регистрация нового аккаунта</h3>
                                <p class="text-center text-muted"><a href="Authorization.aspx">Войдите,</a> если Вы зарегестрированы </p>
                                <hr>

                                <form>
                                    <div class="top-margin">
                                        <label>Имя пользователя</label>
                                        <br />
                                        <asp:TextBox ID="TextBoxNickName" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>
                                    <div class="top-margin">
                                        <label>Имя</label><br />
                                        <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>
                                    <div class="top-margin">
                                        <label>Фамилия</label>
                                        <br />
                                        <asp:TextBox ID="TextBoxSecondName" runat="server" CssClass="form-control"></asp:TextBox>


                                    </div>
                                    <div class="top-margin">
                                        <label>Пароль<span class="text-danger">*</span></label>
                                        <br />
                                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>

                                    <div class="top-margin">
                                        <label>Дата рождения<span class="text-danger">*</span></label>
                                    </div>

                                    <asp:DropDownList ID="BirthDay" runat="server">
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

                                        <asp:ListItem Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="BirthMonth" runat="server">
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
                                    <asp:DropDownList ID="BirthYear" runat="server">
                                        <asp:ListItem Value="1">Год</asp:ListItem>
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
                                    </asp:DropDownList>

                                    <br />

                                    <div class="top-margin">
                                        <label>Пол<span class="text-danger">*</span></label>
                                        <br>
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text="Мужской" />

                                        </label>
                                        <br />
                                        <label class="radio-inline">
                                            <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text="Женский" />

                                        </label>
                                    </div>


                                    <label>Аватар<span class="text-danger">*</span></label>
                                    <asp:FileUpload ID="AvatarUpload" runat="server" />
                                    <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>

                                    <div class="row ">
                                        <div class="col-lg-8">
                                        </div>
                                        <div class="col-lg-4 text-right">
                                            <asp:Button ID="Button4"
                                                Text="Зарегестрироваться"
                                                OnClick="RegistrationWizard_FinishButtonClick"
                                                runat="server"
                                                CssClass="btn btn-action" />

                                        </div>
                                    </div>
                                </form>



                            </div>
                        </div>

                    </div>

                </article>
                <!-- /Article -->

            </div>
        </div>
        <!-- /container -->


        <!-- Footer -->
        <footer id="footer" class="top-space">

            <div class="footer1">
                <div class="container">
                    <div class="row">



                        <div class="col-md-3 widget">
                            <h3 class="widget-title">Подписывайся!</h3>
                            <div class="widget-body">
                                <p class="follow-me-icons clearfix">
                                    <a href="https://twitter.com/maroder_king"><i class="fa fa-twitter fa-2"></i></a>
                                    <a href="https://github.com/maroder-king"><i class="fa fa-github fa-2"></i></a>

                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 widget">

                            <div class="widget-body">
                                <h2>К высокому через трудное</h2>


                            </div>
                        </div>

                    </div>
                    <!-- /row of widgets -->
                </div>
            </div>

            <div class="footer2">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6 widget">
                            <div class="widget-body">
                                <p class="simplenav">
                                    <a href="Default.aspx">Home</a> | 								
								<b><a href="Registration.aspx">Регистрация</a></b>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 widget">
                            <div class="widget-body">
                                <p class="text-right">
                                    Copyright &copy; 2015, King. Designed by King
                                </p>
                            </div>
                        </div>

                    </div>
                    <!-- /row of widgets -->
                </div>
            </div>
        </footer>
        <!-- /.Footer -->



        <script src="../App_Style/js/jquery-2.1.3.min.js"></script>
        <script src="../App_Style/js/bootstrap.min.js"></script>
        <script src="../App_Style/js/headroom.min.js"></script>
        <script src="../App_Style/js/jQuery.headroom.min.js"></script>
        <script src="../App_Style/js/template.js"></script>
    </form>
</body>
</html>
