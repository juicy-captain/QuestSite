<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Authorization.aspx.cs" Inherits="AppPageAuthorization" %>

<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Вход</title>
    <link href="../App_Style/AuthorizationStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
        </div>
     
        <div id="footer">
        </div>
    </form>
</body>
</html>--%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Регистрация</title>
    <link href="../App_Style/RegistrationStyle.css" rel="stylesheet" type="text/css" />
    <link href="../App_Style/css/CustomStyleSheet.css" rel="stylesheet" media="screen" />
    <link rel="shortcut icon" href="../App_Style/images/gt_favicon.png">

    <%--   <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">--%>
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
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="about.html">About</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="sidebar-left.html">Left Sidebar</a></li>
                                <li><a href="sidebar-right.html">Right Sidebar</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Contact</a></li>
                        <li class="active"><a class="btn" href="Authorization.aspx">SIGN IN</a></li>
                        <li class="active"><a class="btn" href="Registration.aspx">SIGN UP</a></li>

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
                <li><a href="Default.aspx">Home</a></li>
                <li class="active">User access</li>
            </ol>

            <div class="row">

                <!-- Article main content -->
                <article class="col-xs-12 maincontent">
                    <header class="page-header">
                        <h1 class="page-title">Sign in</h1>
                    </header>

                    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h3 class="thin text-center">Sign in to your account</h3>
                                <p class="text-center text-muted">Lorem ipsum dolor sit amet, <a href="SignUp.aspx">Register</a> adipisicing elit. Quo nulla quibusdam cum doloremque incidunt nemo sunt a tenetur omnis odio. </p>
                                <hr>

                                <form>
                                    <div class="top-margin">
                                        <label>Username/Email <span class="text-danger">*</span></label>
                                        <br />
                                        <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
                                        <%--<input type="text" class="form-control">--%>
                                    </div>
                                    <div class="top-margin">
                                        <label>Password <span class="text-danger">*</span></label>
                                        <br />
                                        <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                                        <%--	<input type="password" class="form-control">--%>
                                    </div>
                                    <br />
                                    <asp:CheckBox ID="CheckBoxAdministrator" runat="server" Text="Администратор" />
                                    <br />
                                    <hr>

                                    <div class="row">
                                        <div class="col-lg-8">
                                       <%--     <b><a href="">Forgot password?</a></b>--%>
                                        </div>
                                        <div class="col-lg-4 text-right">
                                             <asp:Button ID="ButtonAuthorization" runat="server" Text="Вход" OnClick="ButtonAuthorization_Click" />
                                          <%--  <button class="btn btn-action" type="submit">Sign in</button>--%>
                                        </div>
                                    </div>


                                    <%--<asp:Label ID="LabelUserName" runat="server" Text="Имя"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:Label ID="LabelPassword" runat="server" Text="Пароль"></asp:Label>
                                    <br />--%>

                                    <asp:Label ID="LabelNotRegistered" runat="server" Text="Вы не зарегестроровались" Visible="false"></asp:Label>
                                    <br />
                                    <asp:Button ID="ButtonGoToRegistration" runat="server" Text="Зарегистрироваться" PostBackUrl="~/App_Page/Registration.aspx" Visible="false" />

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

        <%--     <div id="content">
            <div id="authorizationArea" runat="server">
                <asp:Label ID="LabelUserName" runat="server" Text="Имя"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="LabelPassword" runat="server" Text="Пароль"></asp:Label>
                <br />
                <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                <br />
                <asp:CheckBox ID="CheckBoxAdministrator" runat="server" Text="Администратор" />
                <br />
                <asp:Button ID="ButtonAuthorization" runat="server" Text="Вход" OnClick="ButtonAuthorization_Click" />
            </div>
            <div id="notRegisteredArea">
                <asp:Label ID="LabelNotRegistered" runat="server" Text="Вы не зарегестроровались" Visible="false"></asp:Label>
                <br />
                <asp:Button ID="ButtonGoToRegistration" runat="server" Text="Зарегистрироваться" PostBackUrl="~/App_Page/Registration.aspx" Visible="false"/>
            </div>
        </div>--%>








        <!-- Footer -->
        <footer id="footer" class="top-space">

            <div class="footer1">
                <div class="container">
                    <div class="row">

                        <div class="col-md-3 widget">
                            <h3 class="widget-title">Contact</h3>
                            <div class="widget-body">
                                <p>
                                    +234 23 9873237<br>
                                    <a href="mailto:#">some.email@somewhere.com</a><br>
                                    <br>
                                    234 Hidden Pond Road, Ashland City, TN 37015
                                </p>
                            </div>
                        </div>

                        <div class="col-md-3 widget">
                            <h3 class="widget-title">Follow me</h3>
                            <div class="widget-body">
                                <p class="follow-me-icons clearfix">
                                    <a href=""><i class="fa fa-twitter fa-2"></i></a>
                                    <a href=""><i class="fa fa-dribbble fa-2"></i></a>
                                    <a href=""><i class="fa fa-github fa-2"></i></a>
                                    <a href=""><i class="fa fa-facebook fa-2"></i></a>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6 widget">
                            <h3 class="widget-title">Text widget</h3>
                            <div class="widget-body">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, dolores, quibusdam architecto voluptatem amet fugiat nesciunt placeat provident cumque accusamus itaque voluptate modi quidem dolore optio velit hic iusto vero praesentium repellat commodi ad id expedita cupiditate repellendus possimus unde?</p>
                                <p>Eius consequatur nihil quibusdam! Laborum, rerum, quis, inventore ipsa autem repellat provident assumenda labore soluta minima alias temporibus facere distinctio quas adipisci nam sunt explicabo officia tenetur at ea quos doloribus dolorum voluptate reprehenderit architecto sint libero illo et hic.</p>
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
                                    <a href="#">Home</a> | 
								<a href="about.html">About</a> |
								<a href="sidebar-right.html">Sidebar</a> |
								<a href="contact.html">Contact</a> |
								<b><a href="SignUp.aspx">Sign up</a></b>
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

