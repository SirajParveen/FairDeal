<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/images/header.jpg')";
</script>
<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

<!-- ============================================================================================== -->

    <div class="content">
		<h1><b>Login</b></h1>
		<div class="main vlcone">
			<div class="alert-close"> </div>
			<div class="hotel-left">
				<div class="pay_form">
					<h2><b>Login Here</b></h2>
					<c:url var="action" value="/perform_login"></c:url>
					<form:form name='loginForm' action="${action}" method="post">
						<input class="logo" type="text" value="Username" name="j_username" style="color: black;" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" required>
						<input class="key" type="password" value="Password" name="j_password" style="color: black;" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
						<input type="submit" value="Login">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="Reset" style="background-size: contain;background-color: yellow;">
					</form:form>
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

	        <!------------------------------------ Starting of Footer ------------------------------------->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">

<footer>
    <div class="footer" id="footer">
    
        <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                    
                    <h3 style="color: white;"><b> Get to Know Us </b></h3>
                    
                       <a href="#"> About Us </a><br>
                        <a href="#"> Careers </a><br> 
                         <a href="#"> Press Releases </a><br>
                         <a href="#"> FairDeal Cares </a><br>
                          <a href="#"> Gift a Smile </a>
                          </li></ul>
                </div>
                
                 <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                    
                    <h3 style="color: white;"><b> Policy Info </b></h3>
                    
                       <a href="#"> Privacy Policy </a><br>
                        <a href="#"> Terms of Sale </a><br> 
                         <a href="#"> Terms of Use </a><br>
                         <a href="#"> Report Abuse and Takedown Policy </a><br>
                          <a href="#"> CSR Policy </a>
                          </li></ul>
                </div>
                
                  <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                
                 <h3 style="color: white;"><b> Let Us Help You </b></h3>
                    
                       <a href="#"> Your Account </a><br>
                        <a href="#"> Returns Centre </a><br> 
                         <a href="#"> 100% Purchase Protection </a><br>
                         <a href="#"> FairDeal Assistant </a><br>
                          <a href="#"> Help </a>
                          </li></ul>
                </div>
                
                
                 <div class="col-lg-3 col-md-3">
                  <ul class="list-unstyled clear-margins">
                  <li class="widget-container widget_recent_news">
                    
                  <h3 class="title-widget"><b style="color: white;">Contact Detail </b></h3>
                                
                   <div class="footerp"> 
                                
                   <h2 class="title-median" style="color: white;"><font style="border-bottom-style: double;">FairDeal Pvt. Ltd.</font></h2>
                                <p><b style="color: white;">Email id:</b> <a href="#">FairDeal@gmail.com</a></p>
                                <p><b style="color: white;">Helpline Numbers </b>
         <b style="color:#ffc106;">(8AM to 10PM):</b><br><b style="color: white;">  +91-0987654321, +91-1234567890 </b></p>
    
                    <p><b style="color: white;">Corp Office / Postal Address</b></p>
                     <p><b style="color: white;">Phone Numbers : 1234567890, </b></p>
                      <p><b style="color: white;"> 011-12345678, 1234567890</b></p>
                        </div>
                                
                <div class="social-icons">
                                    
                <a href="https://www.facebook.com"><i class="fa fa-facebook-square fa-2x" id="social"></i></a>
	            <a href="https://twitter.com"><i class="fa fa-twitter-square fa-2x" id="social"></i></a>
	            <a href="https://plus.google.com"><i class="fa fa-google-plus-square fa-2x" id="social"></i></a>
	            <a href="#"><i class="fa fa-envelope-square fa-2x" id="social"></i></a>
                 </div>             
                 </ul>
                 </div>
    
                 </div>
                </div>
                 </div>
               </footer><hr>
    
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left" style="color: white;"> Copyright © 2017. FairDeal Private Limited. All Rights Reserved. </p>
            <div class="pull-right">
                <ul class="nav nav-pills payments" style="color: white;">
                	<li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-amex"></i></li>
                    <li><i class="fa fa-cc-paypal"></i></li>
                </ul>  
            </div>
   </div>
   </div>
   </div>
   </nav>
                                
                    <!------------------------------------ Ending of Footer ------------------------------------->
                    
</body>
</html>