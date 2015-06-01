<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileEdit.aspx.cs" Inherits="App_Page_ProfileEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Редактирование профиля</title>
    <link href="../App_Style/RegistrationStyle.css" rel="stylesheet" type="text/css" />

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
        <div id="header" runat="server"></div>



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
                                <asp:LinkButton runat="server" CssClass="title " PostBackUrl="Profile.aspx">  <!-- @TODO: data button loss -->
                                <i class="fa fa-home"></i><span class="title">Профиль </span>
                                </asp:LinkButton>


                                <%--   <a href="Profile.aspx"><i class="fa fa-home"></i><span class="title">Dashboard </span></a>--%>
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
                        <%--<asp:Button class="btn btn-sm btn-danger  " ID="ButtonLogout" runat="server" Text="Log out" PostBackUrl="~/App_Page/Default.aspx" OnClick="ButtonLogout_Click"/>--%>
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
                                    <h1>Редактирование профиля</h1>
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
                                          <asp:LinkButton runat="server" CssClass="title " PostBackUrl="Profile.aspx"> 
                                <span class="title">Профиль </span>
                                </asp:LinkButton>
                                        
                                    </li>
                                    <li class="active">Редактирование аккаунта
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
                                    <li class="active">
                                        <a data-toggle="tab" href="#panel_overview">Информация
                                        </a>
                                    </li>


                                </ul>
                                <div class="tab-content">
                                    <div id="panel_overview" class="tab-pane fade in active">
                                        <div class="row">
                                            <div id="content">
                                                <%--   <div id="generalDescriptionArea" class="descriptionArea">
                <asp:Label ID="NickNameLabel" runat="server" Text="Имя для входа:"></asp:Label>
                <br />
                <asp:Label ID="FirstNameLabel" runat="server" Text="Имя:"></asp:Label>
                <br />
                <asp:Label ID="SecondNameLabel" runat="server" Text="Фамилия:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="OldPassword" runat="server" Text="Введите старый пароль:"></asp:Label>
                <br />
                <asp:Label ID="NewPassword" runat="server" Text="Введите новый пароль:"></asp:Label>
                <br />
                <asp:Label ID="CheckNewPassword" runat="server" Text="Повторите новый пароль:"></asp:Label>
                <br />
                <br />
                <asp:Label ID="BirthDateLabel" runat="server" Text="Дата рождения:"></asp:Label>
                <br />
                <asp:Label ID="GenderLabel" runat="server" Text="Пол:"></asp:Label>
                <br />
                <asp:Label ID="ImageLabel" runat="server" Text="Изображение:"></asp:Label>
            </div>
            <div id="generalInputArea" class="inputArea">
                <asp:TextBox ID="TextBoxNickName" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="TextBoxOldPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxNewPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxCheckNewPassword" runat="server"></asp:TextBox>
                <br />
                <br />
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
                <br />
                <asp:FileUpload ID="AvatarUpload" runat="server" />
                <br />
                <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
            </div>-
           <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/Profile.aspx" />--%>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h3>Информация о аккаунте</h3>
                                                    <hr>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                         Имя
                                                        </label>
                                                        <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<input type="text" placeholder="Peter" class="form-control" id="firstname" name="firstname">--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                            Фамилия
                                                        </label>
                                                        <asp:TextBox ID="TextBoxSecondName" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<input type="text" placeholder="Clark" class="form-control" id="lastname" name="lastname">--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                          Никнэйм
                                                        </label>
                                                        <asp:TextBox ID="TextBoxNickName" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<input type="email" placeholder="peter@example.com" class="form-control" id="email" name="email">--%>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label">
                                                           Старый пароль
                                                        </label>
                                                        <asp:TextBox ID="TextBoxOldPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<input type="password" placeholder="password" class="form-control" name="password" id="password">--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                          Новый пароль
                                                        </label>
                                                        <asp:TextBox ID="TextBoxNewPassword" runat="server" CssClass="form-control"></asp:TextBox>

                                                        <%--<input type="password" placeholder="password" class="form-control" id="password_again" name="password_again">--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">
                                                          Подтверждение пароля
                                                        </label>
                                                        <asp:TextBox ID="TextBoxCheckNewPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                                        <%--<input type="password" placeholder="password" class="form-control" id="password_again" name="password_again">--%>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group connected-group">
                                                        <label class="control-label">
                                                           Дата рождения
                                                        </label>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <asp:DropDownList ID="BirthDay" runat="server" CssClass="form-control">
                                                                    <asp:ListItem>День</asp:ListItem>
                                                                    <asp:ListItem>1</asp:ListItem>
                                                                    <asp:ListItem Value="2"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <asp:DropDownList ID="BirthMonth" runat="server" CssClass="form-control">
                                                                <asp:ListItem Selected="True">Месяц</asp:ListItem>
                                                                <asp:ListItem>1</asp:ListItem>
                                                            </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-3" CssClass="form-control">
                                                            <asp:DropDownList ID="BirthYear" runat="server">
                                                                <asp:ListItem Value="1">Год</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                                <asp:ListItem>1995</asp:ListItem>
                                                            </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                            

                                                    <div class="form-group">
                                                        <label class="control-label">
                                                          Пол
                                                        </label>
                                                        <div>
                                                           
                                                           
                                                            

                                                             <label class="radio-inline">
                                                     <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text=" Женский" />
                                                           
                                                        </label>
                                                        <label class="radio-inline">
                                                           <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text=" Мужской" CssClass="grey" />
                                                         
                                                        </label>
                                                        </div>

                                                    </div>
                                                    <%--<div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                Zip Code
                                                            </label>
                                                            <input class="form-control" placeholder="12345" type="text" name="zipcode" id="zipcode">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="form-group">
                                                            <label class="control-label">
                                                                City
                                                            </label>
                                                            <input class="form-control tooltips" placeholder="London (UK)" type="text" data-original-title="We'll display it when you write reviews" data-rel="tooltip" title="" data-placement="top" name="city" id="city">
                                                        </div>
                                                    </div>
                                                </div>--%>
                                                    <div class="form-group">
                                                        <label>
                                                          Аватарка
                                                        </label>
                                                        <asp:FileUpload ID="AvatarUpload" runat="server" />
                                                        <br />
                                                        <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>

                                                        <%-- <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="fileupload-new thumbnail">
                                                            <img src="../App_Style/assets/images/avatar-1-xl.jpg" alt="">
                                                        </div>
                                                        <div class="fileupload-preview fileupload-exists thumbnail"></div>
                                                        <div class="user-edit-image-buttons">
                                                            <span class="btn btn-azure btn-file"><span class="fileupload-new"><i class="fa fa-picture"></i>Select image</span><span class="fileupload-exists"><i class="fa fa-picture"></i> Change</span>
                                                                <input type="file">
                                                            </span>
                                                            <a href="#" class="btn fileupload-exists btn-red" data-dismiss="fileupload">
                                                                <i class="fa fa-times"></i>Remove
                                                            </a>
                                                        </div>
                                                    </div>--%>
                                                    </div>
                                                </div>
                                            </div>

                                           <hr>

                                            <div class="row">
                                                <div class="col-md-8">
                                                    
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:Button ID="ButtonSaveChanges" runat="server" CssClass="btn btn-green btn-block" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/Profile.aspx" />
                                                    <%--<button class="btn btn-green btn-block" type="submit">Update <i class="fa fa-arrow-circle-right"></i></button>--%>
                                                </div>
                                            </div>

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
