<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="App_Page_Dashboard" MasterPageFile="Dashboard.master" %>

<asp:Content runat="server" ContentPlaceHolderID="Dashboard">

   <div class="main-wrapper">
            <!-- start: TOPBAR -->
            <header class="topbar navbar navbar-inverse navbar-fixed-top inner">
                <!-- start: TOPBAR CONTAINER -->
                <div class="container">
                    <div class="navbar-header">
                        <a class="sb-toggle-left hidden-md hidden-lg" href="#main-navbar">
                            <i class="fa fa-bars"></i>
                        </a>
                        <!-- start: LOGO -->
                      <asp:LinkButton runat="server" Text="QuizHunter" PostBackUrl="Profile.aspx" CssClass="navbar-brand">QuizHunter</asp:LinkButton>
                        </a>
                        <!-- end: LOGO -->
                    </div>
                    <div class="topbar-tools">
                        <!-- start: TOP NAVIGATION MENU -->
                        <ul class="nav navbar-right">
                            <!-- start: USER DROPDOWN -->
                            <li class="dropdown current-user">
                                <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true" href="#">
                                    <img src="../App_Style/assets/images/avatar-1-small.jpg" class="img-circle" alt="">
                                    <span class="username hidden-xs">Andrey King</span> <i class="fa fa-caret-down "></i>
                                </a>
                                <ul class="dropdown-menu dropdown-dark">
                                    <li>
                                        <a href="pages_user_profile.html">My Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="login_login.html">Log Out
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!-- end: USER DROPDOWN -->

                        </ul>
                        <!-- end: TOP NAVIGATION MENU -->
                    </div>
                </div>
                <!-- end: TOPBAR CONTAINER -->
            </header>
            <!-- end: TOPBAR -->
            <!-- start: PAGESLIDE LEFT -->
            <a class="closedbar inner hidden-sm hidden-xs" href="#"></a>
            <nav id="pageslide-left" class="pageslide inner">
                <div class="navbar-content">
                    <!-- start: SIDEBAR -->
                    <div class="main-navigation left-wrapper transition-left">

                        <div class="user-profile border-top padding-horizontal-10 block">
                            <div class="inline-block">
                                <img src="../App_Style/assets/images/avatar-1.jpg" alt="">
                            </div>
                            <div class="inline-block">
                                <h5 class="no-margin">Welcome </h5>
                                <h4 class="no-margin">Andrey King </h4>
                                
                            </div>
                        </div>
                        <!-- start: MAIN NAVIGATION MENU -->
                        <ul class="main-navigation-menu">
                            <li class="active open">
                                <a href="index.html"><i class="fa fa-home"></i><span class="title">Dashboard </span></a>
                            </li>

                            <li>
                                <a href="pages_user_profile.html"><span class="title">User Profile</span></a>
                            </li>

                            <li>
                                <a href="utility_faq.html"><span class="title">Faq</span></a>
                            </li>


                        </ul>
                        <!-- end: MAIN NAVIGATION MENU -->
                    </div>
                    <!-- end: SIDEBAR -->
                </div>
                <div class="slide-tools">
                    <div class="col-xs-6 text-left no-padding">
                        <a class="btn btn-sm status" href="#">Status <i class="fa fa-dot-circle-o text-green"></i><span>Online</span>
                        </a>
                    </div>
                    <div class="col-xs-6 text-right no-padding">
                        <a class="btn btn-sm log-out text-right" href="login_login.html">
                            <i class="fa fa-power-off"></i>Log Out
                        </a>
                    </div>
                </div>
            </nav>
            <!-- end: PAGESLIDE LEFT -->
            <!-- start: PAGESLIDE RIGHT -->

            <!-- end: PAGESLIDE RIGHT -->
            <!-- start: MAIN CONTAINER -->
            <div class="main-container inner">
                <!-- start: PAGE -->
                <div class="main-content">
                    <!-- start: PANEL CONFIGURATION MODAL FORM -->
                    <div class="modal fade" id="panel-config" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">Panel Configuration</h4>
                                </div>
                                <div class="modal-body">
                                    Here will be a configuration form
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">
                                        Close
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        Save changes
                                    </button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                    <!-- /.modal -->
                    <!-- end: SPANEL CONFIGURATION MODAL FORM -->
                    <div class="container">
                        <!-- start: PAGE HEADER -->
                        <!-- start: TOOLBAR -->
                        <div class="toolbar row">
                            <div class="col-sm-6 hidden-xs">
                                <div class="page-header">
                                    <h1>Dashboard <small>overview &amp; stats </small></h1>
                                </div>
                            </div>

                        </div>
                        <!-- end: TOOLBAR -->
                        <!-- end: PAGE HEADER -->
                        <!-- start: BREADCRUMB -->
                        <div class="row">
                            <div class="col-md-12">
                                <ol class="breadcrumb">
                                    <li>
                                        <a href="#">Dashboard
                                        </a>
                                    </li>
                                    <li class="active">Dashboard
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- end: BREADCRUMB -->
                        <!-- start: PAGE CONTENT -->



                        <div class="col-md-12">
                            <div class="panel panel-red">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Panel <span class="text-bold">Red</span></h4>
                                    <div class="panel-tools">
                                        <div class="dropdown">
                                            <a data-toggle="dropdown" class="btn btn-xs dropdown-toggle btn-transparent-grey">
                                                <i class="fa fa-cog"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-light pull-right" role="menu">
                                                <li>
                                                    <a class="panel-collapse collapses" href="#"><i class="fa fa-angle-up"></i><span>Collapse</span> </a>
                                                </li>
                                                <li>
                                                    <a class="panel-refresh" href="#">
                                                        <i class="fa fa-refresh"></i><span>Refresh</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="panel-config" href="#panel-config" data-toggle="modal">
                                                        <i class="fa fa-wrench"></i><span>Configurations</span>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="panel-expand" href="#">
                                                        <i class="fa fa-expand"></i><span>Fullscreen</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <a class="btn btn-xs btn-link panel-close" href="#">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <p>
                                        Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.
                                    </p>
                                    <p>
                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                                    </p>
                                    <p>
                                        Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ullamcorper nulla non metus auctor fringilla. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Donec ullamcorper nulla non metus auctor fringilla.
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>





                    <!-- end: PAGE CONTENT-->
                </div>
                
            </div>
            <!-- end: PAGE -->
        </div>

</asp:Content>
