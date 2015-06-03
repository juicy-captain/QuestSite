<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="AppPageQuestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Задание</title>


    <link href="../App_Style/css/CustomStyleSheet.css" rel="stylesheet" media="screen" />
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
    <link rel="shortcut icon" href="../App_Style/favicon.ico" />
    
</head>
<body>
    <form id="form1" runat="server">


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

                        <!-- end: LOGO -->
                    </div>

                </div>
                <!-- end: TOPBAR CONTAINER -->
            </header>
            <!-- end: TOPBAR -->
            <!-- start: PAGESLIDE LEFT -->
            <a class="closedbar inner hidden-sm hidden-xs" href="#"></a>
            <nav id="pageslide-left" class="inner">
                <div class="navbar-content">
                    <!-- start: SIDEBAR -->
                    <div class="main-navigation left-wrapper">
                        <!-- start: MAIN NAVIGATION MENU -->
                        <ul class="main-navigation-menu">
                            <li class="active open">
                                <a href="Profile.aspx"><i class="fa fa-home"></i><span class="title">Профиль </span></a>
                            </li>

                        </ul>
                        <!-- end: MAIN NAVIGATION MENU -->
                    </div>
                    <!-- end: SIDEBAR -->
                </div>
                <div class="slide-tools">

                    <div class="col-xs-6 text-right no-padding">
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
                    <div class="container">
                        <!-- start: PAGE HEADER -->
                        <!-- start: TOOLBAR -->
                        <div class="toolbar row">
                            <div class="col-sm-6 hidden-xs">
                                <div class="page-header">
                                    <h1>Вопрос</h1>
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
                                        <asp:LinkButton runat="server" Text="Профиль" PostBackUrl="Profile.aspx" CssClass="title"><i class="fa fa-home"></i>Профиль</asp:LinkButton>
                                    </li>
                                    <li class="active">Вопрос квеста   </li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs" id="myTab4">
                                    <li class="active">
                                        <a data-toggle="tab" href="#panel_overview">Вопрос
                                        </a>
                                    </li>

                                </ul>
                                <div class="tab-content">
                                    <div id="panel_overview" class="tab-pane fade in active">


                                        <div id="header">
                                            <%--<asp:Button ID="ButtonToProfile" runat="server" Text="Перейти в профиль" PostBackUrl="~/App_Page/Profile.aspx" />--%>
                                        </div>
                                        <div id="content">
                                            <h4>
                                                <asp:Label ID="LabelQuestionTitle" runat="server" Text="QuestionTitle"></asp:Label></h4>
                                            <h5>
                                                <asp:Label ID="LabelQuestionBody" runat="server" Text="QuestionBody"></asp:Label></h5>
                                            <asp:TextBox ID="TextBoxPlayerAnswer" runat="server" placeholder="Ваш ответ"></asp:TextBox>
                                            <asp:Button ID="ButtonSendAnswer" runat="server" Text="Отправить ответ" OnClick="ButtonSendAnswer_Click" />
                                            <asp:Button ID="ButtonNextStep" runat="server" Text="Следующий шаг" PostBackUrl="~/App_Page/Question.aspx" Visible="false" />
                                            <asp:Button ID="ButtonQuestionEnd" runat="server" Text="Конец квеста. Перейти в профиль." PostBackUrl="~/App_Page/Profile.aspx" Visible="false" />
                                            <br />
                                            <asp:Label ID="LabelWrongAnswer" runat="server" Text="Не правильно!" Visible="false"></asp:Label>
                                        </div>

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
