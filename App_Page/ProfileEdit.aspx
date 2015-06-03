<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfileEdit.aspx.cs" Inherits="App_Page_ProfileEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Редактирование профиля</title>
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
                        <a class="sb-toggle-left hidden-md hidden-lg" href="#main-navbar">  <i class="fa fa-bars"></i>   </a>
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
                                <asp:LinkButton runat="server" CssClass="title " PostBackUrl="Profile.aspx"> 
                                <i class="fa fa-home"></i><span class="title">Профиль </span>
                                </asp:LinkButton>
                            </li>
                        </ul>
                        <!-- end: MAIN NAVIGATION MENU -->
                    </div>
                    <!-- end: SIDEBAR -->
                </div>
                <div class="slide-tools">
                    <div class="col-xs-6 text-right no-padding">   </div>
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
                                        <asp:LinkButton runat="server" CssClass="title " PostBackUrl="Profile.aspx"><span class="title">Профиль </span></asp:LinkButton>
                                    </li>
                                    <li class="active">Редактирование аккаунта </li>
                                </ol>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="tabbable">
                                <ul class="nav nav-tabs" id="myTab4">
                                    <li class="active">  <a data-toggle="tab" href="#panel_overview">Информация </a>  </li>
                                </ul>
                                <div class="tab-content">
                                    <div id="panel_overview" class="tab-pane fade in active">
                                        <div class="row">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h3>Информация о аккаунте</h3>
                                                    <hr>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Имя </label>
                                                        <asp:TextBox ID="TextBoxFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Фамилия  </label>
                                                        <asp:TextBox ID="TextBoxSecondName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Никнэйм   </label>
                                                        <asp:TextBox ID="TextBoxNickName" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label">Старый пароль  </label>
                                                        <asp:TextBox ID="TextBoxOldPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Новый пароль</label>
                                                        <asp:TextBox ID="TextBoxNewPassword" runat="server" CssClass="form-control"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Подтверждение пароля  </label>
                                                        <asp:TextBox ID="TextBoxCheckNewPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="control-label">Дата рождения  </label>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <asp:DropDownList ID="BirthDay" runat="server" CssClass="form-control">
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
                                                            </div>
                                                            <div class="col-md-3">
                                                                <asp:DropDownList ID="BirthMonth" runat="server" CssClass="form-control">
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
                                                            </div>
                                                            <div class="col-md-3" cssclass="form-control">
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
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="form-group">
                                                        <label class="control-label">Пол </label>
                                                        <div>
                                                            <label class="radio-inline">
                                                                <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text=" Женский" />
                                                            </label>
                                                            <label class="radio-inline">
                                                                <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text=" Мужской" CssClass="grey" />
                                                            </label>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label>Аватарка  </label>
                                                        <asp:FileUpload ID="AvatarUpload" runat="server" />
                                                        <br />
                                                        <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr>

                                            <div class="row">
                                                <div class="col-md-8">
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:Button ID="ButtonSaveChanges" runat="server" CssClass="btn btn-green btn-block" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/Profile.aspx" />
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


        <script src="../App_Style/assets/plugins/ScrollToFixed/jquery-scrolltofixed-min.js"></script>
        <script src="../App_Style/assets/plugins/jquery.appear/jquery.appear.js"></script>
        <script src="../App_Style/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <script src="../App_Style/assets/plugins/velocity/jquery.velocity.min.js"></script>

        <!-- end: MAIN JAVASCRIPTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR SUBVIEW CONTENTS -->

        <script src="../App_Style/assets/plugins/jquery-mockjax/jquery.mockjax.js"></script>

        <script src="../App_Style/assets/plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>

        <script src="../App_Style/assets/plugins/bootstrap-switch/dist/js/bootstrap-switch.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="../App_Style/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
        <script src="../App_Style/assets/plugins/DataTables/media/js/jquery.dataTables.min.js"></script>
        <script src="../App_Style/assets/plugins/DataTables/media/js/DT_bootstrap.js"></script>

        <script src="../App_Style/assets/plugins/summernote/dist/summernote.min.js"></script>
        <script src="../App_Style/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="../App_Style/assets/js/subview.js"></script>
        <script src="../App_Style/assets/js/subview-examples.js"></script>
        <!-- end: JAVASCRIPTS REQUIRED FOR SUBVIEW CONTENTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script src="../App_Style/assets/plugins/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/lib/d3.v3.js"></script>
        <script src="../App_Style/assets/plugins/nvd3/nv.d3.min.js"></script>


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
