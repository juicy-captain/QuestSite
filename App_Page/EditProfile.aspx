﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="App_Page_ProfileEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <div>
    
 
        
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
                                     <%--<asp:Button ID="ButtonLogout" runat="server" Text="Log out" PostBackUrl="~/App_Page/Default.aspx" OnClick="ButtonLogout_Click"/>--%>
           
                               <%--     <a href="login_login.html">Log Out </a>--%>
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
										<a href="#">
											Dashboard
										</a>
									</li>
									<li class="active">
										User Profile
									</li>
								</ol>
							</div>
						</div>
                    <div class="col-sm-12">
                        <div class="tabbable">
                            <ul class="nav nav-tabs tab-padding tab-space-3 tab-blue" id="myTab4">
                                <li class="active">
                                    <a data-toggle="tab" href="#panel_overview">Edit
                                    </a>
                                </li>
                                <li>
                                   
                                    <%-- <a data-toggle="tab" href="#panel_edit_account">Edit Account
                                    </a>--%>
                                </li>
                                <li>
                                    <%--<a data-toggle="tab" href="#panel_projects">Quests
                                    </a>--%>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="panel_overview" class="tab-pane fade in active">
                                    <form action="#" role="form" id="form">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3>Account Info</h3>
                                                <hr>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        First Name
                                                    </label>
                                                    <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                                                    <%--<input type="text" placeholder="Peter" class="form-control" id="firstname" name="firstname">--%>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Last Name
                                                    </label>
                                                       <asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>
                                                    <%--<input type="text" placeholder="Clark" class="form-control" id="lastname" name="lastname">--%>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Nickname
                                                    </label>
                                                     <asp:TextBox ID="TextBoxNickName" runat="server"></asp:TextBox>
                                                    <%--<input type="email" placeholder="peter@example.com" class="form-control" id="email" name="email">--%>
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        OLD Password
                                                    </label>
                                                    <asp:TextBox ID="TextBoxOldPassword" runat="server"></asp:TextBox>
                                                    <%--<input type="password" placeholder="password" class="form-control" name="password" id="password">--%>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                       New Password
                                                    </label>
                                                     <asp:TextBox ID="TextBoxNewPassword" runat="server"></asp:TextBox>
                                                     
                                                    <%--<input type="password" placeholder="password" class="form-control" id="password_again" name="password_again">--%>
                                                </div>
                                                 <div class="form-group">
                                                    <label class="control-label">
                                                      Check New Password
                                                    </label>
                                                     <asp:TextBox ID="TextBoxCheckNewPassword" runat="server"></asp:TextBox>
                                                    <%--<input type="password" placeholder="password" class="form-control" id="password_again" name="password_again">--%>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                               <%-- <div class="form-group connected-group">
                                                    <label class="control-label">
                                                        Date of Birth
                                                    </label>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <select name="dd" id="dd" class="form-control">
                                                                <option value="">DD</option>
                                                                <option value="01">1</option>
                                                                <option value="02">2</option>
                                                                <option value="03">3</option>
                                                                <option value="04">4</option>
                                                                <option value="05">5</option>
                                                                <option value="06">6</option>
                                                                <option value="07">7</option>
                                                                <option value="08">8</option>
                                                                <option value="09">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21" selected="selected">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="mm" id="mm" class="form-control">
                                                                <option value="">MM</option>
                                                                <option value="01">1</option>
                                                                <option value="02">2</option>
                                                                <option value="03">3</option>
                                                                <option value="04">4</option>
                                                                <option value="05">5</option>
                                                                <option value="06">6</option>
                                                                <option value="07">7</option>
                                                                <option value="08">8</option>
                                                                <option value="09">9</option>
                                                                <option value="10" selected="selected">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="text" placeholder="1982" id="yyyy" name="yyyy" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>--%>
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
                                                <br/>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Gender
                                                    </label>
                                                    <div>
                                                        <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text="Мужской" />
                <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text="Женский" />
                                                       <%-- <label class="radio-inline">
                                                            <input type="radio" class="grey" value="" name="gender" id="gender_female">
                                                            Female
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" class="grey" value="" name="gender" id="gender_male" checked="checked">
                                                            Male
                                                        </label>--%>
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
                                                        Image Upload
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

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div>
                                                    Required Fields
															<hr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <p>
                                                    By clicking UPDATE, you are agreeing to the Policy and Terms &amp; Conditions.
                                                </p>
                                            </div>
                                            <div class="col-md-4">
                                                 <asp:Button ID="Button1" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/Profile.aspx" />
    
                                                <button class="btn btn-green btn-block" type="submit">
                                                    Update <i class="fa fa-arrow-circle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    
                                    <%--<div class="row">
                                        <div class="col-sm-5 col-md-4">
                                            <div class="user-left">
                                                <div class="center">
                                                    <h4>Peter Clark</h4>
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <div class="user-image">
                                                            <div class="fileupload-new thumbnail">
                                                                <img src="../App_Style/assets/images/avatar-1-xl.jpg" alt="">
                                                            </div>
                                                            <div class="fileupload-preview fileupload-exists thumbnail"></div>

                                                        </div>
                                                    </div>
                                                    <hr>

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
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis porta purus, pulvinar mattis nulla tempus ut. Curabitur quis dui orci. Ut nisi dolor, dignissim a aliquet quis, vulputate id dui. Proin ultrices ultrices ligula, dictum varius turpis faucibus non. Curabitur faucibus ultrices nunc, nec aliquet leo tempor cursus.
                                            </p>
                                            <div class="row space20">
                                                <div class="col-sm-3">
                                                    <button class="btn btn-icon btn-block">
                                                        <i class="clip-clip"></i>
                                                        One
                                                    </button>
                                                </div>
                                                <div class="col-sm-3">
                                                    <button class="btn btn-icon btn-block pulsate">
                                                        <i class="clip-bubble-2"></i>
                                                        Two
                                                    </button>
                                                </div>
                                                <div class="col-sm-3">
                                                    <button class="btn btn-icon btn-block">
                                                        <i class="clip-calendar"></i>
                                                        Three
                                                    </button>
                                                </div>
                                                <div class="col-sm-3">
                                                    <button class="btn btn-icon btn-block">
                                                        <i class="clip-list-3"></i>
                                                        Four
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="panel panel-white space20">
                                                <div class="panel-heading">
                                                    <i class="clip-menu"></i>
                                                    You follow next quests															
                                                </div>
                                                <div class="panel-body panel-scroll height-300">
                                                    <ul class="activities">
                                                        <li>
                                                            <a class="activity" href="javascript:void(0)">
                                                                <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-blue"></i><i class="fa fa-code fa-stack-1x fa-inverse"></i></span><span class="desc">You uploaded a new release.</span>

                                                            </a>
                                                        </li>
                                                        <li></li>
                                                        <li>
                                                            <a class="activity" href="javascript:void(0)">
                                                                <span class="fa-stack fa-2x"><i class="fa fa-square fa-stack-2x text-orange"></i><i class="fa fa-database fa-stack-1x fa-inverse"></i></span><span class="desc">DataBase Migration.</span>

                                                            </a>
                                                        </li>


                                                    </ul>
                                                </div>
                                            </div>

                                        </div>
                                    </div>--%>
                                </div>
                              

                                <%--  <div id="panel_edit_account" class="tab-pane fade">
                                    <form action="#" role="form" id="form">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3>Account Info</h3>
                                                <hr>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        First Name
                                                    </label>
                                                    <input type="text" placeholder="Peter" class="form-control" id="firstname" name="firstname">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Last Name
                                                    </label>
                                                    <input type="text" placeholder="Clark" class="form-control" id="lastname" name="lastname">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Email Address
                                                    </label>
                                                    <input type="email" placeholder="peter@example.com" class="form-control" id="email" name="email">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Phone
                                                    </label>
                                                    <input type="email" placeholder="(641)-734-4763" class="form-control" id="phone" name="email">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Password
                                                    </label>
                                                    <input type="password" placeholder="password" class="form-control" name="password" id="password">
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Confirm Password
                                                    </label>
                                                    <input type="password" placeholder="password" class="form-control" id="password_again" name="password_again">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group connected-group">
                                                    <label class="control-label">
                                                        Date of Birth
                                                    </label>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <select name="dd" id="dd" class="form-control">
                                                                <option value="">DD</option>
                                                                <option value="01">1</option>
                                                                <option value="02">2</option>
                                                                <option value="03">3</option>
                                                                <option value="04">4</option>
                                                                <option value="05">5</option>
                                                                <option value="06">6</option>
                                                                <option value="07">7</option>
                                                                <option value="08">8</option>
                                                                <option value="09">9</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21" selected="selected">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>
                                                                <option value="24">24</option>
                                                                <option value="25">25</option>
                                                                <option value="26">26</option>
                                                                <option value="27">27</option>
                                                                <option value="28">28</option>
                                                                <option value="29">29</option>
                                                                <option value="30">30</option>
                                                                <option value="31">31</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <select name="mm" id="mm" class="form-control">
                                                                <option value="">MM</option>
                                                                <option value="01">1</option>
                                                                <option value="02">2</option>
                                                                <option value="03">3</option>
                                                                <option value="04">4</option>
                                                                <option value="05">5</option>
                                                                <option value="06">6</option>
                                                                <option value="07">7</option>
                                                                <option value="08">8</option>
                                                                <option value="09">9</option>
                                                                <option value="10" selected="selected">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input type="text" placeholder="1982" id="yyyy" name="yyyy" class="form-control">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Gender
                                                    </label>
                                                    <div>
                                                        <label class="radio-inline">
                                                            <input type="radio" class="grey" value="" name="gender" id="gender_female">
                                                            Female
                                                        </label>
                                                        <label class="radio-inline">
                                                            <input type="radio" class="grey" value="" name="gender" id="gender_male" checked="checked">
                                                            Male
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="row">
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
                                                </div>
                                                <div class="form-group">
                                                    <label>
                                                        Image Upload
                                                    </label>
                                                    <div class="fileupload fileupload-new" data-provides="fileupload">
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
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div>
                                                    Required Fields
															<hr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-8">
                                                <p>
                                                    By clicking UPDATE, you are agreeing to the Policy and Terms &amp; Conditions.
                                                </p>
                                            </div>
                                            <div class="col-md-4">
                                                <button class="btn btn-green btn-block" type="submit">
                                                    Update <i class="fa fa-arrow-circle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>--%>

                              <%--  <div id="panel_projects" class="tab-pane fade">
                                    <table class="table table-striped table-bordered table-hover" id="projects">
                                        <thead>
                                            <tr>
                                                <th class="center">
                                                    <div class="checkbox-table">
                                                        <label>
                                                            <input type="checkbox" class="flat-grey selectall">
                                                        </label>
                                                    </div>
                                                </th>
                                                <th>Quest Name</th>
                                                <th class="hidden-xs">Start</th>
                                                <th>End</th>
                                                <th class="hidden-xs">Fund</th>
                                                <th class="hidden-xs center">Stage</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr>
                                                <td class="center">
                                                    <div class="checkbox-table">
                                                        <label>
                                                            <input type="checkbox" class="flat-grey foocheck">
                                                        </label>
                                                    </div>
                                                </td>
                                                <td>First Quest</td>
                                                <td class="hidden-xs">Now</td>
                                                <td>Tomorrow</td>
                                                <td class="hidden-xs">1000$</td>
                                                <td class="center hidden-xs">4</td>
                                                <td class="center">
                                                    <div class="visible-md visible-lg hidden-sm hidden-xs">
                                                        <a href="#" class="btn btn-green tooltips" data-placement="top" data-original-title="Run"><i class="fa fa-share"></i></a>
                                                        <a href="#" class="btn btn-red tooltips" data-placement="top" data-original-title="Remove"><i class="fa fa-times fa fa-white"></i></a>
                                                    </div>
                                                    <div class="visible-xs visible-sm hidden-md hidden-lg">
                                                        <div class="btn-group">
                                                            <a class="btn btn-green dropdown-toggle btn-sm" data-toggle="dropdown" href="#">
                                                                <i class="fa fa-cog"></i><span class="caret"></span>
                                                            </a>
                                                            <ul role="menu" class="dropdown-menu dropdown-dark pull-right">
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#">
                                                                        <i class="fa fa-edit"></i>Edit
                                                                    </a>
                                                                </li>
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#">
                                                                        <i class="fa fa-share"></i>Share
                                                                    </a>
                                                                </li>
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#">
                                                                        <i class="fa fa-times"></i>Remove
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>--%>
                                
                                
                                <div id="content">
            <div id="generalDescriptionArea" class="descriptionArea">
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
               <%-- <asp:TextBox ID="TextBoxNickName" runat="server"></asp:TextBox>--%>
                <br />
                <%--<asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>--%>
                <br />
                <%--<asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>--%>
                <br />
                <br />
                <%--<asp:TextBox ID="TextBoxOldPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxNewPassword" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="TextBoxCheckNewPassword" runat="server"></asp:TextBox>--%>
                <br />
                <br />
                <%--<asp:DropDownList ID="BirthDay" runat="server">
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
                </asp:DropDownList>--%>
                <br />
                <%--<asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text="Мужской" />
                <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text="Женский" />--%>
                <br />
               <%-- <asp:FileUpload ID="AvatarUpload" runat="server" />
                <br />
                <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
          --%>  </div>
            <asp:Button ID="ButtonSaveChanges" runat="server" Text="Сохранить изменения" OnClick="ButtonSaveChanges_Click" PostBackUrl="~/App_Page/Profile.aspx" />
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