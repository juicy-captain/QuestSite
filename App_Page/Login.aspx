<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="App_Page_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../App_Style/assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../App_Style/assets/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../App_Style/assets/plugins/animate.css/animate.min.css">
		<link rel="stylesheet" href="../App_Style/assets/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="../App_Style/assets/css/styles.css">
		<link rel="stylesheet" href="../App_Style/assets/css/styles-responsive.css">
		<link rel="stylesheet" href="../App_Style/assets/plugins/iCheck/skins/all.css">
</head>
<body class="login">
    <form id="form1" runat="server">
    <div>
    
    </div>
        
        
		<div class="row">
			<div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				<div class="logo">
					
				</div>
				<!-- start: LOGIN BOX -->
				<div class="box-login">
					<h3>Sign in to your account</h3>
					<p>
						Please enter your name and password to log in.
					</p>
					<form class="form-login" action="index.html">
						<div class="errorHandler alert alert-danger no-display">
							<i class="fa fa-remove-sign"></i> You have some form errors. Please check below.
						</div>
						<fieldset>
							<div class="form-group">
								<span class="input-icon">
									<input type="text" class="form-control" name="username" placeholder="Username">
									<i class="fa fa-user"></i> </span>
							</div>
							<div class="form-group form-actions">
								<span class="input-icon">
									<input type="password" class="form-control password" name="password" placeholder="Password">
									<i class="fa fa-lock"></i>
									<a class="forgot" href="#">
										I forgot my password
									</a> </span>
							</div>
							<div class="form-actions">
								
								<button type="submit" class="btn btn-green pull-right">
									Login <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
							<div class="new-account">
								Don't have an account yet?
								<a href="#" class="register">
									Create an account
								</a>
							</div>
						</fieldset>
					</form>
					<!-- start: COPYRIGHT -->
					<div class="copyright">
						2014 &copy; Rapido by cliptheme.
					</div>
					<!-- end: COPYRIGHT -->
				</div>
				<!-- end: LOGIN BOX -->
				<!-- start: FORGOT BOX -->
				<div class="box-forgot">
					<h3>Forget Password?</h3>
					<p>
						Enter your e-mail address below to reset your password.
					</p>
					<form class="form-forgot">
						<div class="errorHandler alert alert-danger no-display">
							<i class="fa fa-remove-sign"></i> You have some form errors. Please check below.
						</div>
						<fieldset>
							<div class="form-group">
								<span class="input-icon">
									<input type="email" class="form-control" name="email" placeholder="Email">
									<i class="fa fa-envelope"></i> </span>
							</div>
							<div class="form-actions">
								<a class="btn btn-light-grey go-back">
									<i class="fa fa-chevron-circle-left"></i> Log-In
								</a>
								<button type="submit" class="btn btn-green pull-right">
									Submit <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
						</fieldset>
					</form>
					<!-- start: COPYRIGHT -->
					<div class="copyright">
						2014 &copy; Rapido by cliptheme.
					</div>
					<!-- end: COPYRIGHT -->
				</div>
				<!-- end: FORGOT BOX -->
				<!-- start: REGISTER BOX -->
				<div class="box-register">
					<h3>Sign Up</h3>
					<p>
						Enter your personal details below:
					</p>
					<form class="form-register">
						<div class="errorHandler alert alert-danger no-display">
							<i class="fa fa-remove-sign"></i> You have some form errors. Please check below.
						</div>
						<fieldset>
							<div class="form-group">
								<input type="text" class="form-control" name="full_name" placeholder="Full Name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="address" placeholder="Address">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="city" placeholder="City">
							</div>
							<div class="form-group">
								<div>
									<label class="radio-inline">
										<input type="radio" class="grey" value="F" name="gender">
										Female
									</label>
									<label class="radio-inline">
										<input type="radio" class="grey" value="M" name="gender">
										Male
									</label>
								</div>
							</div>
							<p>
								Enter your account details below:
							</p>
							<div class="form-group">
								<span class="input-icon">
									<input type="email" class="form-control" name="email" placeholder="Email">
									<i class="fa fa-envelope"></i> </span>
							</div>
							<div class="form-group">
								<span class="input-icon">
									<input type="password" class="form-control" id="password" name="password" placeholder="Password">
									<i class="fa fa-lock"></i> </span>
							</div>
							<div class="form-group">
								<span class="input-icon">
									<input type="password" class="form-control" name="password_again" placeholder="Password Again">
									<i class="fa fa-lock"></i> </span>
							</div>
							<div class="form-group">
								<div>
									<label for="agree" class="checkbox-inline">
										<input type="checkbox" class="grey agree" id="agree" name="agree">
										I agree to the Terms of Service and Privacy Policy
									</label>
								</div>
							</div>
							<div class="form-actions">
								Already have an account?
								<a href="#" class="go-back">
									Log-in
								</a>
								<button type="submit" class="btn btn-green pull-right">
									Submit <i class="fa fa-arrow-circle-right"></i>
								</button>
							</div>
						</fieldset>
					</form>
					<!-- start: COPYRIGHT -->
					<div class="copyright">
						2014 &copy; Rapido by cliptheme.
					</div>
					<!-- end: COPYRIGHT -->
				</div>
				<!-- end: REGISTER BOX -->
			</div>
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<!--[if lt IE 9]>
		<script src="assets/plugins/respond.min.js"></script>
		<script src="assets/plugins/excanvas.min.js"></script>
		<script type="text/javascript" src="assets/plugins/jQuery/jquery-1.11.1.min.js"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
		 <script src="../App_Style/js/jquery-2.1.3.min.js"></script>
		<!--<![endif]-->
		<script src="../App_Style/assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="../App_Style/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="../App_Style/assets/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="../App_Style/assets/plugins/jquery.transit/jquery.transit.js"></script>
		<script src="../App_Style/assets/plugins/TouchSwipe/jquery.touchSwipe.min.js"></script>
		<script src="../App_Style/assets/js/main.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="../App_Style/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="../App_Style/assets/js/login.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
		    jQuery(document).ready(function () {
		        Main.init();
		        Login.init();
		    });
		</script>
        
        
 </form>
	</body>
        
        

   

</html>
