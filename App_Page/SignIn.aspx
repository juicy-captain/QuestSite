<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="AppPageAuthorization" MasterPageFile="MasterPage.master" Title="Sing in"%>

<asp:Content runat="server" ContentPlaceHolderID="head">
    
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
									<input type="text" class="form-control">
								</div>
								<div class="top-margin">
									<label>Password <span class="text-danger">*</span></label>
									<input type="password" class="form-control">
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-8">
										<b><a href="">Forgot password?</a></b>
									</div>
									<div class="col-lg-4 text-right">
										<button class="btn btn-action" type="submit">Sign in</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
	


</asp:Content>
<%-- <form id="form1" runat="server">
        <div id="header">
        </div>
        <div id="content">
            <div id="authorizationArea" ></div>
            <asp:Label ID="LabelUserName" runat="server" Text="Имя"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LabelPassword" runat="server" Text="Пароль"></asp:Label>
            <br />
            <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonAuthorization" runat="server" Text="Вход" OnClick="ButtonAuthorization_Click" PostBackUrl="~/App_Page/Profile.aspx"/>
        </div>
        <div id="footer">
        </div>
    </form>--%>