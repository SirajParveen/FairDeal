<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Product Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('../resources/images/header.jpg')";
</script>

<!-- =============================================================================================== -->

<nav class="navbar navbar-default">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li><a href="../temp"><img src="<c:url value="/resources/images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="60px" height="60px" align="left"> </a>
        </ul>
        
        <ul class="nav navbar-nav">
       <li> <h3><b>FairDeal</b><small> <br> 
		IT IS ALL ABOUT YOU</small></h3>
		</li>
		</ul>
		
		<form class="navbar-form navbar-right">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
		
		 <ul class="nav navbar-nav navbar-right">
      <li><a href="../HomePage"><b>Home </b><span class="glyphicon glyphicon-home"></span> </a>
        </ul>
		
		 <div class="container">
    <ul class="nav navbar-nav navbar-right">
     <security:authorize access="!isAuthenticated()">
      <li><a href="../login"><b>Login </b><span class="glyphicon glyphicon-user"></span> </a>
      <li><a href="../Registration"><b>New Customer? Register Here </b><span class="glyphicon glyphicon-log-in"></span> </a>
      </li>
      </security:authorize>
        </ul>
      
    <ul class="nav navbar-nav navbar-right">
    <security:authorize access="isAuthenticated()">
    <li><a href="../perform_logout"><b>Logout </b><span class="glyphicon glyphicon-log-out"></span></a>
    </li>

    <li class="nav navbar-nav">
    <li style="float: right"><a href="../Cart" class="w3-hover-none w3-text-sand w3-hover-text-white"><b>MyCarts </b>
  <i class="fa fa-shopping-cart"></i> <span class="w3-badge w3-white"></span></a></li>
    </security:authorize>
    </ul>
    </div>
		

</div>
 </nav>

<!-- =============================================================================================== -->

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
        
         <ul class="nav navbar-nav">
     <li><a href="#">CATEGORIES  <span class="glyphicon glyphicon-hand-right"></span></a></li>
        </ul>
 
 	<ul class="nav navbar-nav" role="tablist">
 	<c:forEach items="${categoryList}" var="category">
 	<li class="dropdown"><a class="dropdown-toggle"  href="../navproducts/${category.id}">${category.name}</a>
 	
 	</li>
 	</c:forEach>
 	</ul>
 	
 	 <ul class="nav navbar-nav navbar-right">
 	<sec:authorize access="isAuthenticated()">
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME 
     <sec:authentication property="principal.username"/></a>
     </sec:authorize>
     </ul>
    
    </div>
    
</nav>

<!-- =============================================================================================== -->

<center><h1 style="color: white;">Your Product Details</h1></center>

	<div class="container">
		<c:forEach items="${IndividualProduct}" var="product">
		<h2 style="color: white;"><c:out value="${product.name}"/></h2>
			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img  height="300px" width="300px" alt="${product.id}" src="<c:url value="/resources/images/${product.id}.jpg"></c:url>">
					<div class="desc">
					</div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						<div class="form-group">
							<h3 style="color: white;">Name : </h3><input type="text" class="form-control" value="${product.name}" readonly="readonly">
						</div>
						
						<div class="form-group">
							 <h3 style="color: white;">Price : </h3><input type="text" class="form-control" value="Rs. ${product.price}" readonly="readonly">
							 </div>
							 
							 <div class="form-group">
							 <h3 style="color: white;">Description : </h3><input type="text" class="form-control" value="${product.description}" readonly="readonly">
							 </div>
							 <br>
							 <form action="../addtoCart/${userid}/${product.id}">
							<input type="submit" class="btn btn-primary" value="Add To Cart"/>
							</form>
							 
							 </div>
						</div>
						</div>
						</c:forEach>
						</div>
						<br><br>

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
