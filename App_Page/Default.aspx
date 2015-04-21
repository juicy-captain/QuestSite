<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="App_Page_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>

    <link rel="shortcut icon" href="../App_Style/images/gt_favicon.png">
    <link href="../App_Style/css/CustomStyleSheet.css" rel="stylesheet" media="screen" />
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
        <body class="home">
            <!-- Fixed navbar -->
            <div class="navbar navbar-inverse navbar-fixed-top headroom">
                <div class="container">
                    <div class="navbar-header">
                        <!-- Button for smallest screens -->
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a class="navbar-brand" href="index.html">QuestHunter</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav pull-right">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="about.html">About</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="sidebar-left.html">Left Sidebar</a></li>
                                    <li class="active"><a href="sidebar-right.html">Right Sidebar</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a class="btn" href="signin.html">SIGN IN</a></li>
                            <li><a class="btn" href="signup.html">SIGN UP</a></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
            <!-- /.navbar -->

            <!-- Header -->
            <header id="head">
                <div class="container">
                    <div class="row">
                        <h1 class="lead">AWESOME TEXT HERE</h1>
                        <p class="tagline">some text <a href="">Link</a></p>
                        <p><a class="btn btn-default btn-lg" role="button">BUTTON</a> <a class="btn btn-action btn-lg" role="button">BUTTON</a></p>
                    </div>
                </div>
            </header>
            <!-- /Header -->

            <!-- Intro -->
            <div class="container text-center">
                <br>
                <br>
                <h2 class="thin">The best place to tell people why they are here</h2>
                <p class="text-muted">
                    Lorem ipsum dolor sit amet, sit minim fuisset detracto at, mea id hinc illum:<br>
                    Lorem ipsum dolor sit amet.
                </p>
            </div>
            <!-- /Intro-->

            <!-- Highlights - jumbotron -->
            <div class="jumbotron top-space">
                <div class="container">

                    <h3 class="text-center thin">Why we?</h3>

                    <div class="row">
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-cogs fa-5"></i>one</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aliquid adipisci aspernatur. Soluta quisquam dignissimos earum quasi voluptate. Amet, dignissimos, tenetur vitae dolor quam iusto assumenda hic reprehenderit?</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-flash fa-5"></i>two</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, commodi, sequi quis ad fugit omnis cumque a libero error nesciunt molestiae repellat quos perferendis numquam quibusdam rerum repellendus laboriosam reprehenderit! </p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-heart fa-5"></i>three</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem, vitae, perferendis, perspiciatis nobis voluptate quod illum soluta minima ipsam ratione quia numquam eveniet eum reprehenderit dolorem dicta nesciunt corporis?</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-smile-o fa-5"></i>four</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, excepturi, maiores, dolorem quasi reprehenderit illo accusamus nulla minima repudiandae quas ducimus reiciendis odio sequi atque temporibus facere corporis eos expedita? </p>
                            </div>
                        </div>
                    </div>
                    <!-- /row  -->

                </div>
            </div>
            <!-- /Highlights -->

            <!-- container -->
            <div class="container">

                <h2 class="text-center top-space">Maybe some info</h2>
                <br>

                <div class="row">
                    <div class="col-sm-6">
                        <h3>First</h3>
                        <p>
                            Lorem ipsum dolor sit amet, ne sit nobis melius aperiri. Eum veniam nemore et, quo ea possit appetere officiis. Sit equidem fierent in, impetus debitis temporibus nam in. Ceteros molestie omittantur vel ei, per et tation ocurreret eloquentiam. Vim saperet placerat delicatissimi at.
Eu mei graeci patrioque, ius ad primis quaestio similique, mentitum legendos te vix. Per alia perpetua adversarium ne, his minim molestiae gubergren at, sed an accusam referrentur. Mucius audire scripta quo te, velit quidam ancillae eos ut. Ferri deleniti in has. Sit ei ferri praesent posidonium.
                        </p>
                    </div>
                    <div class="col-sm-6">
                        <h3>Second</h3>
                        <p>
                            Lorem ipsum dolor sit amet, ne sit nobis melius aperiri. Eum veniam nemore et, quo ea possit appetere officiis. Sit equidem fierent in, impetus debitis temporibus nam in. Ceteros molestie omittantur vel ei, per et tation ocurreret eloquentiam. Vim saperet placerat delicatissimi at.
Eu mei graeci patrioque, ius ad primis quaestio similique, mentitum legendos te vix. Per alia perpetua adversarium ne, his minim molestiae gubergren at, sed an accusam referrentur. Mucius audire scripta quo te, velit quidam ancillae eos ut. Ferri deleniti in has. Sit ei ferri praesent posidonium.
                        </p>
                    </div>
                </div>
                <!-- /row -->

                <div class="row">
                    <div class="col-sm-6">
                        <h3>Third</h3>
                        <p>
                            Lorem ipsum dolor sit amet, ne sit nobis melius aperiri. Eum veniam nemore et, quo ea possit appetere officiis. Sit equidem fierent in, impetus debitis temporibus nam in. Ceteros molestie omittantur vel ei, per et tation ocurreret eloquentiam. Vim saperet placerat delicatissimi at.
Eu mei graeci patrioque, ius ad primis quaestio similique, mentitum legendos te vix. Per alia perpetua adversarium ne, his minim molestiae gubergren at, sed an accusam referrentur. Mucius audire scripta quo te, velit quidam ancillae eos ut. Ferri deleniti in has. Sit ei ferri praesent posidonium.
                        </p>
                    </div>
                    <div class="col-sm-6">
                        <h3>Fourth</h3>
                        <p>
                            Lorem ipsum dolor sit amet, ne sit nobis melius aperiri. Eum veniam nemore et, quo ea possit appetere officiis. Sit equidem fierent in, impetus debitis temporibus nam in. Ceteros molestie omittantur vel ei, per et tation ocurreret eloquentiam. Vim saperet placerat delicatissimi at.
Eu mei graeci patrioque, ius ad primis quaestio similique, mentitum legendos te vix. Per alia perpetua adversarium ne, his minim molestiae gubergren at, sed an accusam referrentur. Mucius audire scripta quo te, velit quidam ancillae eos ut. Ferri deleniti in has. Sit ei ferri praesent posidonium.
                        </p>
                    </div>
                </div>
                <!-- /row -->

                <div class="jumbotron top-space">
                    <h4>
                        Lorem ipsum dolor sit amet, ne sit nobis melius aperiri. Eum veniam nemore et, quo ea possit appetere officiis. Sit equidem fierent in, impetus debitis temporibus nam in. Ceteros molestie omittantur vel ei, per et tation ocurreret eloquentiam. Vim saperet placerat delicatissimi at.
                        </h4>
                    <p class="text-right"><a class="btn btn-primary btn-large">Button »</a></p>
                </div>

            </div>
            <!-- /container -->

            <!-- Social links. @TODO: replace by link/instructions -->
            <section id="social">
                <div class="container">
                    <div class="wrapper clearfix">
                        <!-- AddThis Button BEGIN -->
                        <div class="addthis_toolbox addthis_default_style">
                            <%--<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_linkedin_counter"></a>
				<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>--%>
                        </div>
                        <!-- AddThis Button END -->
                    </div>
                </div>
            </section>
            <!-- /social links -->


            <footer id="footer" class="top-space">

                <div class="footer1">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-3 widget">
                                <h3 class="widget-title">Contact</h3>
                                <div class="widget-body">
                                    <p>
                                        +375291111111<br>
                                        <a href="mailto:#">some.email@somewhere.com</a><br>
                                        <br>
                                        adress
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-3 widget">
                                <h3 class="widget-title">Follow us</h3>
                                <div class="widget-body">
                                    <p class="follow-me-icons">
                                        <a href=""><i class="fa fa-twitter fa-2"></i></a>
                                        <a href=""><i class="fa fa-dribbble fa-2"></i></a>
                                        <a href=""><i class="fa fa-github fa-2"></i></a>
                                        <a href=""><i class="fa fa-facebook fa-2"></i></a>
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-6 widget">
                                <h3 class="widget-title">Maybe some text</h3>
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
								<a href="contact.html">Contact</a> |
								<b><a href="signup.html">Sign up</a></b>
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






            <script src="../App_Style/js/jquery-2.1.3.min.js"></script>
            <script src="../App_Style/js/bootstrap.min.js"></script>
            <script src="../App_Style/js/headroom.min.js"></script>
            <script src="../App_Style/js/jQuery.headroom.min.js"></script>
            <script src="../App_Style/js/template.js"></script>
    </form>
</body>
</html>

<%-- <div id="header">
            <asp:HyperLink ID="RegistrationLink" runat="server" NavigateUrl="~/App_Page/Registration.aspx">Регистрация</asp:HyperLink>
            <asp:HyperLink ID="AuthorizationLink" runat="server" NavigateUrl="~/App_Page/Authorization.aspx">Вход</asp:HyperLink>
        </div>
        <div id="content">
        </div>
        <div id="footer">
        </div>--%>