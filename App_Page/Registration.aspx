<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="AppPageRegistration" %>

<!DOCTYPE html>

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
    <div class="container" >

        <ol class="breadcrumb">
            <li><a href="Default.aspx">Home</a></li>
            <li class="active">Registration</li>
        </ol>

        <div class="row">

            <!-- Article main content -->
            <article class="col-xs-12 maincontent">
                <header class="page-header">
                    <h1 class="page-title">Registration</h1>
                </header>

                <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3 class="thin text-center">Register a new account</h3>
                            <p class="text-center text-muted">Lorem ipsum dolor sit amet, <a href="SignIn.aspx">Login</a> adipisicing elit. Quo nulla quibusdam cum doloremque incidunt nemo sunt a tenetur omnis odio. </p>
                            <hr>
                            
                           
                    
                   
                  
                            

                            <form>
                                <div class="top-margin">
                                    <label>Nickname</label>
                                    <br/>
                                   <asp:TextBox ID="TextBoxNickName" runat="server" ></asp:TextBox>
              
                                </div>
                                <div class="top-margin">
                                    <label>First Name</label><br />
 <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                                    <%--<input type="text" class="form-control" id="firstname">--%>
                                </div>
                                <div class="top-margin">
                                    <label>Last Name</label>
                                      <br />
                                    <asp:TextBox ID="TextBoxSecondName" runat="server"></asp:TextBox>
                   
                                    <%--<input type="text" class="form-control" id="lastname">--%>
                                </div>

                             <%--   <div class="top-margin">
                                    <label>Birthdate<span class="text-danger">*</span></label>
                                    <br>
                                    <select class="selectpicker " id="day">
                                        <option value="0">Day</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
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
                                        <option value="21">21</option>
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
                                    <select class="selectpicker" id="month">
                                        <option value="0">Month</option>
                                        <option value="1">January</option>
                                        <option value="2">February</option>
                                        <option value="3">March</option>
                                        <option value="4">April</option>
                                        <option value="5">May</option>
                                        <option value="6">June</option>
                                        <option value="7">July</option>
                                        <option value="8">August</option>
                                        <option value="9">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                    <select class="selectpicker" id="year">
                                        <option value="0">Year</option>
                                        <option value="2000">2000</option>
                                        <option value="1999">1999</option>
                                        <option value="1998">1998</option>
                                        <option value="1997">1997</option>
                                        <option value="1996">1996</option>
                                        <option value="1995">1995</option>
                                        <option value="1994">1994</option>
                                        <option value="1993">1993</option>
                                        <option value="1992">1992</option>
                                        <option value="1991">1991</option>
                                        <option value="1990">1990</option>
                                        <option value="1989">1989</option>
                                        <option value="1988">1988</option>
                                        <option value="1987">1987</option>
                                        <option value="1986">1986</option>
                                        <option value="1985">1985</option>
                                        <option value="1984">1984</option>
                                        <option value="1983">1983</option>
                                        <option value="1982">1982</option>
                                        <option value="1981">1981</option>
                                        <option value="1980">1980</option>
                                        <option value="1979">1979</option>
                                        <option value="1978">1978</option>
                                        <option value="1977">1977</option>
                                        <option value="1976">1976</option>
                                        <option value="1975">1975</option>
                                        <option value="1974">1974</option>
                                        <option value="1973">1973</option>
                                        <option value="1972">1972</option>
                                        <option value="1971">1971</option>
                                        <option value="1970">1970</option>
                                        <option value="1969">1969</option>
                                        <option value="1968">1968</option>
                                        <option value="1967">1967</option>
                                        <option value="1966">1966</option>
                                        <option value="1965">1965</option>
                                        <option value="1964">1964</option>
                                        <option value="1963">1963</option>
                                        <option value="1962">1962</option>
                                        <option value="1961">1961</option>
                                        <option value="1960">1960</option>
                                        <option value="1959">1959</option>
                                        <option value="1958">1958</option>
                                        <option value="1957">1957</option>
                                        <option value="1956">1956</option>
                                        <option value="1955">1955</option>
                                        <option value="1954">1954</option>
                                        <option value="1953">1953</option>
                                        <option value="1952">1952</option>
                                        <option value="1951">1951</option>
                                        <option value="1950">1950</option>

                                    </select>
                                </div>--%>
                                
                                <br/>
                                

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
                
                   
                    
                                

                                <div class="top-margin">
                                    <label>Gender<span class="text-danger">*</span></label>
                                    <br>
                                    <label class="radio-inline">
                                            <asp:RadioButton ID="RadioButtonMale" runat="server" GroupName="GenderGroup" Text="Мужской" />
                                        <%--<input type="radio" name="optradio">Male--%>
                                    </label><br />
                                    <label class="radio-inline">
                                         <asp:RadioButton ID="RadioButtonFemale" runat="server" GroupName="GenderGroup" Text="Женский" />
                                        <%--<input type="radio" name="optradio">Female--%>
                                    </label>
                                </div>

                                <!-- EMAIL
								<div class="top-margin">
									<label>Email Address <span class="text-danger">*</span></label>
									<input type="text" class="form-control">
								</div>
                                -->
                                <div class="row top-margin">
                                    <div class="col-sm-6">
                                        <label>Password <span class="text-danger">*</span></label>
                                        <br/>
                                          <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
                                        <%--<input type="text" class="form-control" id="password">--%>
                                    </div>
                                    <%--<div class="col-sm-6">
										<label>Confirm Password <span class="text-danger">*</span></label>
										<input type="text" class="form-control">
									</div>--%>
                                </div>

                                <div class="row ">
                                    <div class="col-lg-8">
                                        <label class="checkbox">
                                            <input type="checkbox">
                                            I've read the <a href="">Terms and Conditions</a>
                                        </label>
                                    </div>
                                    <div class="col-lg-4 text-right">
                                         <asp:Button ID="Button4"
                    Text="ready"
                    CommandName="UnknownName"
                    CommandArgument="UnknownArgument"
                    OnClick="RegistrationWizard_FinishButtonClick"
                    runat="server" />
                                        <%--<button class="btn btn-action" type="submit">Register</button>--%>
                                    </div>
                                </div>
                            </form>
                            
                            <asp:FileUpload ID="AvatarUpload" runat="server" />
                            <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
                            

                        </div>
                    </div>

                </div>

            </article>
            <!-- /Article -->

        </div>
    </div>
    <!-- /container -->






          <%--  <form>
                <div id="generalDescriptionArea" class="descriptionArea">

                    <br />
                    <asp:Label ID="FirstNameLabel" runat="server" Text="Имя:"></asp:Label>
                    <br />
                    <asp:Label ID="SecondNameLabel" runat="server" Text="Фамилия:"></asp:Label>
                    <br />
                    <asp:Label ID="Password" runat="server" Text="Пароль:"></asp:Label>
                </div>

                <div id="generalInputArea" class="inputArea">
                    
                    
                </div>

                <div id="additionalDescriptionArea" class="descriptionArea">
                    <asp:Label ID="BirthDateLabel" runat="server" Text="Дата рождения:"></asp:Label>
                    <br />
                    <asp:Label ID="GenderLabel" runat="server" Text="Пол:"></asp:Label>
                    <br />
                    <asp:Label ID="ImageLabel" runat="server" Text="Изображение:"></asp:Label>
                </div>
                <div id="additionalInputArea" class="inputArea">
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
                    
                    <asp:FileUpload ID="AvatarUpload" runat="server" />
                    <asp:Label ID="LabelIncompatibleImageType" runat="server" Text="Несовместимый формат изображения" Visible="false"></asp:Label>
                </div>

                <asp:Button ID="Button4"
                    Text="ready"
                    CommandName="UnknownName"
                    CommandArgument="UnknownArgument"
                    OnClick="RegistrationWizard_FinishButtonClick"
                    runat="server" />


            </form>--%>
            
            



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
