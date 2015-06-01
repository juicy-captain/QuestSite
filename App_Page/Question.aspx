<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="AppPageQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Задание</title>
    
    
     <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,500,600,700,200,100,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../App_Style/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/iCheck/skins/all.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/animate.css/animate.min.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/bootstrap-select/bootstrap-select.min.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/DataTables/media/css/DT_bootstrap.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="../App_Style/assets/plugins/nvd3/nv.d3.min.css">
    <link rel="stylesheet" href="../App_Style/assets/css/styles.css">
    <link rel="stylesheet" href="../App_Style/assets/css/styles-responsive.css">
    <link rel="stylesheet" href="../App_Style/assets/css/plugins.css">
    <link rel="stylesheet" href="../App_Style/assets/css/themes/theme-default.css" type="text/css" id="skin_color">
    <link href="../App_Style/assets/css/print.css" rel="stylesheet" type="text/css" media="print" />
    <link rel="shortcut icon" href="favicon.ico" />

</head>
<body>
    <form id="form1" runat="server">
        

       <%-- <div id="header">
            <asp:Button ID="ButtonToProfile" runat="server" Text="Перейти в профиль" PostBackUrl="~/App_Page/Profile.aspx" />
        </div>
        <div id="content">
            <asp:Label ID="LabelQuestionTitle" runat="server" Text="QuestionTitle"></asp:Label>
            <br />
            <asp:Label ID="LabelQuestionBody" runat="server" Text="QuestionBody"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPlayerAnswer" runat="server" placeholder="Ваш ответ"></asp:TextBox>
            <asp:Button ID="ButtonSendAnswer" runat="server" Text="Отправить ответ" OnClick="ButtonSendAnswer_Click" />
            <asp:Button ID="ButtonNextStep" runat="server" Text="Следующий шаг" PostBackUrl="~/App_Page/Question.aspx" Visible="false"/>
            <asp:Button ID="ButtonQuestionEnd" runat="server" Text="Конец квеста. Перейти в профиль." PostBackUrl="~/App_Page/Profile.aspx" Visible="false"/>
            <br />
            <asp:Label ID="LabelWrongAnswer" runat="server" Text="Не правильно!" Visible="false"></asp:Label>
        </div>
        <div id="footer"> </div>--%>
        
          
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
                        <a class="navbar-brand" href="Dashboard.aspx">QuizHunter
                        </a>
                        <!-- end: LOGO -->
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


                        <!-- start: MAIN NAVIGATION MENU -->
                        <ul class="main-navigation-menu">
                            <li class="active open">

                                <a href="Profile.aspx"><i class="fa fa-home"></i><span class="title">Dashboard </span></a>
                            </li>

                            <%-- <li>
                            <a href="ProfileEdit.aspx"><span class="title">User Profile</span></a>
                             <%--<asp:Button ID="ButtonEditProfile" runat="server" class="title" Text="Редактировать профиль" PostBackUrl="~/App_Page/EditProfile.aspx"/>
                        </li>
                            --%>
                        </ul>
                        <!-- end: MAIN NAVIGATION MENU -->
                    </div>
                    <!-- end: SIDEBAR -->
                </div>
                <div class="slide-tools">

                    <div class="col-xs-6 text-right no-padding">
                        <%--<asp:Button class="btn btn-sm btn-danger  " ID="ButtonLogout" runat="server" Text="Log out" PostBackUrl="~/App_Page/Default.aspx" OnClick="ButtonLogout_Click" />--%>

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
                                    <li class="active">User Profile
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
                                    <li class="active">
                                        <a data-toggle="tab" href="#panel_overview">Overview
                                        </a>
                                    </li>


                                </ul>
                                <div class="tab-content">
                                    <div id="panel_overview" class="tab-pane fade in active">
                                      <%--  <div class="row">
                                            <div class="col-sm-5 col-md-4">
                                                <div class="user-left">
                                                    <div class="center">
                                                        <br />
                                                        <h4>
                                                            <asp:Label ID="LabelFirstName" runat="server" Text="FirstName"></asp:Label>
                                                            <asp:Label ID="LabelNickName" runat="server" Text="NickName"></asp:Label>
                                                            <asp:Label ID="LabelSecondName" runat="server" Text="SecondName"></asp:Label>
                                                        </h4>
                                                        <br />

                                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                                            <div class="user-image">
                                                                <div class="fileupload-new thumbnail">
                                                                    <%--<img src="../App_Style/assets/images/avatar-1-xl.jpg" alt="">

                                                                    <asp:Image ID="Avatar" runat="server" />

                                                                </div>
                                                                <div class="fileupload-preview fileupload-exists thumbnail"></div>

                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <asp:Button ID="Button1" runat="server" Text="Edit Profile" PostBackUrl="~/App_Page/ProfileEdit.aspx" />
                                                        <asp:Button ID="ButtonDeleteProfile" runat="server" Text="Delete Profile" OnClick="ButtonDeleteProfile_Click" />
                                                        <hr>
                                                    </div>

                                                     <table class="table table-condensed table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th colspan="3">General information</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Name</td>
                                                                <td>Andrey King</td>
                                                                <td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Tickets</td>
                                                                <td>1</td>
                                                                <td><a href="#panel_edit_account" class="show-tab"><i class="fa fa-pencil edit-user-info"></i></a></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Balance</td>
                                                                <td>50$</td>
                                                                <td></td>
                                                            </tr>



                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="col-sm-7 col-md-8">
                                                <p>
                                                    <br />
                                                    <div id="content">

                                                        <asp:LinkButton ID="QuestsLink" runat="server" PostBackUrl="~/App_Page/Quests.aspx">Просмотреть доступные квесты</asp:LinkButton>

                                                        <div id="subscriptions">
                                                            <asp:Label ID="LabelSubscriptions" runat="server" Text="Вы подписались на следующие кветы:"></asp:Label>
                                                            <ul id="Ul1" runat="server">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </p>



                                            </div>
                                        </div>--%>
                                        
                                       
                                         <div id="header">
            <asp:Button ID="ButtonToProfile" runat="server" Text="Перейти в профиль" PostBackUrl="~/App_Page/Profile.aspx" />
        </div>
        <div id="content">
            <asp:Label ID="LabelQuestionTitle" runat="server" Text="QuestionTitle"></asp:Label>
            <br />
            <asp:Label ID="LabelQuestionBody" runat="server" Text="QuestionBody"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPlayerAnswer" runat="server" placeholder="Ваш ответ"></asp:TextBox>
            <asp:Button ID="ButtonSendAnswer" runat="server" Text="Отправить ответ" OnClick="ButtonSendAnswer_Click" />
            <asp:Button ID="ButtonNextStep" runat="server" Text="Следующий шаг" PostBackUrl="~/App_Page/Question.aspx" Visible="false"/>
            <asp:Button ID="ButtonQuestionEnd" runat="server" Text="Конец квеста. Перейти в профиль." PostBackUrl="~/App_Page/Profile.aspx" Visible="false"/>
            <br />
            <asp:Label ID="LabelWrongAnswer" runat="server" Text="Не правильно!" Visible="false"></asp:Label>
        </div>
        <div id="footer"> </div>
                                        
                                        

                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        
        
        
        
        
            <!--[if gte IE 9]><!-->
        <script src="../App_Style/js/jquery-2.1.3.min.js"></script>
        <!--<![endif]-->
        <script src="../App_Style/assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="../App_Style/assets/plugins/blockUI/jquery.blockUI.js"></script>
        <script src="../App_Style/assets/plugins/iCheck/jquery.icheck.min.js"></script>
        <script src="../App_Style/assets/plugins/moment/min/moment.min.js"></script>
        <script src="../App_Style/assets/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
        <script src="../App_Style/assets/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
        <script src="../App_Style/assets/plugins/bootbox/bootbox.min.js"></script>
        <script src="../App_Style/assets/plugins/jquery.scrollTo/jquery.scrollTo.min.js"></script>
        <script src="../App_Style/assets/plugins/ScrollToFixed/jquery-scrolltofixed-min.js"></script>
        <script src="../App_Style/assets/plugins/jquery.appear/jquery.appear.js"></script>
        <script src="../App_Style/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <script src="../App_Style/assets/plugins/velocity/jquery.velocity.min.js"></script>
        <%--<script src="../App_Style/assets/plugins/TouchSwipe/jquery.touchSwipe.min.js"></script>--%>
        <!-- end: MAIN JAVASCRIPTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR SUBVIEW CONTENTS -->
        <%--<script src="../App_Style/assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>--%>
        <script src="../App_Style/assets/plugins/jquery-mockjax/jquery.mockjax.js"></script>
        <%--<script src="../App_Style/assets/plugins/toastr/toastr.js"></script>--%>
        <script src="../App_Style/assets/plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <%--<script src="../App_Style/assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"></script>--%>
        <script src="../App_Style/assets/plugins/bootstrap-switch/dist/js/bootstrap-switch.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../App_Style/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
        <script src="../App_Style/assets/plugins/DataTables/media/js/jquery.dataTables.min.js"></script>
        <script src="../App_Style/assets/plugins/DataTables/media/js/DT_bootstrap.js"></script>
        <%--<script src="../App_Style/assets/plugins/truncate/jquery.truncate.js"></script>--%>
        <script src="../App_Style/assets/plugins/summernote/dist/summernote.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="../App_Style/assets/js/subview.js"></script>
        <script src="../App_Style/assets/js/subview-examples.js"></script>
        <!-- end: JAVASCRIPTS REQUIRED FOR SUBVIEW CONTENTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script src="../App_Style/assets/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/lib/d3.v3.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/nv.d3.min.js"></script>
       <%-- <script src="../App_Style/assets/plugins/nvd3/src/models/historicalBar.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/src/models/historicalBarChart.js"></script>--%>
       <%-- <script src="../App_Style/assets/plugins/nvd3/src/models/stackedArea.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/src/models/stackedAreaChart.js"></script>--%>
        <script src="../App_Style/assets/plugins/jquery.sparkline/jquery.sparkline.js"></script>
        <%--<script src="../App_Style/assets/plugins/easy-pie-chart/dist/jquery.easypiechart.min.js"></script>--%>
        <script src="../App_Style/assets/js/index.js"></script>
        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <!-- start: CORE JAVASCRIPTS  -->
        <script src="../App_Style/assets/js/main.js"></script>
        <!-- end: CORE JAVASCRIPTS  -->
        <script>
            jQuery(document).ready(function () {
                Main.init();
                SVExamples.init();
                Index.init();
            });
        </script>
    </form>
</body>
</html>
