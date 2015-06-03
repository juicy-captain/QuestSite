<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authorization.aspx.cs" Inherits="AppPageAuthorization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Вход</title>
    <link href="../App_Style/RegistrationStyle.css" rel="stylesheet" type="text/css" />
    <link href="../App_Style/css/CustomStyleSheet.css" rel="stylesheet" media="screen" />
    <link rel="shortcut icon" href="../App_Style/images/gt_favicon.png">

   
    <link href="../App_Style/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../App_Style/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../App_Style/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="../App_Style/css/main.css" rel="stylesheet" />

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
                <li class="active">Вход</li>
            </ol>

            <div class="row">

                <!-- Article main content -->
                <article class="col-xs-12 maincontent">
                    <header class="page-header">
                        <h1 class="page-title">Вход</h1>
                    </header>

                    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h3 class="thin text-center">Вход в аккаунт</h3>
                                <p class="text-center text-muted"><a href="Registration.aspx">Зарегестрируйтесь,</a> если Вы этого ещё не сделали. </p>
                                <hr>

                                <form>
                                    <div class="top-margin">
                                        <label>Имя пользователя <span class="text-danger">*</span></label>
                                        <br />
                                        <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                    </div>
                                    <div class="top-margin">
                                        <label>Пароль <span class="text-danger">*</span></label>
                                        <br />
                                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                   
                                    </div>
                                    <br />
                                    <asp:CheckBox ID="CheckBoxAdministrator" runat="server" Text="Администратор" CssClass="checkbox" />
                                    <br />
                                    <hr>

                                    <div class="row">
                                        <div class="col-lg-8">
                                     
                                        </div>
                                        <div class="col-lg-4 text-right">
                                             <asp:Button ID="ButtonAuthorization" runat="server" Text="Вход" OnClick="ButtonAuthorization_Click" CssClass="btn btn-action"/>
                                      
                                        </div>
                                    </div>
                                    
                                 <asp:Label ID="LabelNotRegistered" runat="server" Text="Вы не зарегестроровались" Visible="false"></asp:Label>
                                    
                                    <br />
                                    <asp:Button ID="ButtonGoToRegistration" runat="server" Text="Зарегистрироваться" PostBackUrl="~/App_Page/Registration.aspx" Visible="false" CssClass="btn btn-action"/>

                                   <br />
               
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

