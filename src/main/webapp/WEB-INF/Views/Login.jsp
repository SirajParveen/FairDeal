<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Salsa' rel='stylesheet' type='text/css'>
<!-- js -->
<script type="text/javascript" src="resources/login/js/jquery-2.1.4.min.js"></script>
<!-- js -->
<link href="resources/login/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- script for close -->
<script>
$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.vlcone').fadeOut('slow', function(c){
			$('.vlcone').remove();
		});
	});	  
});
</script>
<!-- //script for close -->
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

 <div class="content">
		<h1><b>Login</b></h1>
		<!-- <div class="main vlcone">
			<div class="alert-close"> </div>
			<div class="hotel-left">
				<div class="pay_form"> -->
					<h2><b>Login Here</b></h2>
<c:url var="action" value="/login_session_attribute"></c:url>
	<form name='loginForm' action="${action}">

		<div class="input-group margin-bottom-sm">
			<span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span> 
			<input class="form-control" type="text" name="username" placeholder="Username">
		</div>

		<div class="input-group"><span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
			<input class="form-control" type="password" name="password" placeholder="Password">
		</div>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="submit" class="btn btn-default" value="Login">
	</form>
	</div>
				<!-- <b><a href="#">Forgot Password</a>
				<a href="Registration" class="login-right">Register</a></b>
				<div class="clear"></div>
			</div>
			<div class="hotel-right">
				<h3><b>FairDeal<span>Shopping Website</span></b></h3>
				<p><b>A Perfect Place For Buying Goods Online</b></p>
			</div>
			<div class="clear"></div>
		</div> -->
	</div>
<jsp:include page="Menu/Footer.jsp"></jsp:include>

</body>
</html>
 --%>

 
 
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Login Page</title>
<!-- for-mobile-apps -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Digital Login Form Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //for-mobile-apps -->
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Salsa' rel='stylesheet' type='text/css'>
<!-- js -->
<script type="text/javascript" src="resources/login/js/jquery-2.1.4.min.js"></script>
<!-- js -->
<link href="resources/login/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- script for close -->
<script>
$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.vlcone').fadeOut('slow', function(c){
			$('.vlcone').remove();
		});
	});	  
});
</script>
<!-- //script for close -->

</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

    <div class="content">
		<h1><b>Login</b></h1>
		<div class="main vlcone">
			<div class="alert-close"> </div>
			<div class="hotel-left">
				<div class="pay_form">
					<h2><b>Login Here</b></h2>
					<c:url var="action" value="/login_session_attribute"></c:url>
					<form name='loginForm' action="${action}" method="post">
						<input class="logo" type="text" value="Username" name="username" style="color: black;" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" required="required">
						<input class="key" type="password" value="Password" name="password" style="color: black;" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="required">
						<input type="submit" value="Login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="Reset" style="background-size: contain;background-color: yellow;">
					</form>
				</div>
				<b><a href="#">Forgot Password</a>
				<a href="Registration" class="login-right">Register</a></b>
				<div class="clear"></div>
			</div>
			<div class="hotel-right">
				<h3><b>FairDeal<span>Shopping Website</span></b></h3>
				<p><b>A Perfect Place For Buying Goods Online</b></p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>