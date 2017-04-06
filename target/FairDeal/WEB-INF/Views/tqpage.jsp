<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Thank You Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  footer {
    
    margin-top: 100px;  
} 
body {
width:100%;
}
.glyphicon-ok { color:green; }
  </style>
</head>
<body  style="background-color:#ffffff;">



<!--  <div class="text-left" >
  <h1 style="font-family:Georgia; font-size:30px;"><i>SHOPIN </i>
    <img  src="https://www.sitewelder.com/art2012/logo-big-shopping.png" alt="logo" width="40px" height="40px" align="left" >
  <img  src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/F_icon.svg/768px-F_icon.svg.png" alt="fb" width="25px" height="25px" align="right" >
  <img  src="https://upload.wikimedia.org/wikipedia/en/thumb/9/9f/Twitter_bird_logo_2012.svg/1259px-Twitter_bird_logo_2012.svg.png" alt="twitter" width="25px" height="25px" align="right" >
  <img  src="http://icons.iconarchive.com/icons/danleech/simple/1024/linkedin-icon.png" alt="linkedin" width="25px" height="25px" align="right" >
  </h1>
  
  </div> -->
  
     <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid"> 
  <div class="navbar-header" class=" pull-left">
  <a class="navbar-brand" style="font-size:27px;margin-top: -4px;">
     <i class="fa fa-opencart" aria-hidden="true"></i>FairDeal </a>
    <sec:authorize access="isAuthenticated()">
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME <sec:authentication property="principal.username"/> </a>
     
  	
</sec:authorize>
    </div>
     <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;">    
      <li><a href="Home">HOME</a></li>
       <sec:authorize access="!isAuthenticated()">
     <li><a href="<c:url value="/perform_logout" />">Logout</a></li>
      <li><a href="login">LOGIN</a></li>
      </sec:authorize>
	  <li><a href="CONTACTUS">CONTACT US</a></li>
   <sec:authorize access="isAuthenticated()">
   <li ><a href="Cart" >CART <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
	<li><a href="<c:url value="/perform_logout" />">LOGOUT<span class="glyphicon glyphicon-log-out"></span></a></li>
</sec:authorize>
					  
   </ul>
   </div>
  </nav>
  <br>
  <br>
  <br>
  <div style="text-align:center;padding-top:40px;padding-bottom:40px">
  <h1> Thank You !!!</h1>
  <h3>Your Payment Has Been Received <span class="glyphicon glyphicon-ok"></span></h3>
  <img src="C:\Users\dell1\Mronline\Shoppingsite\src\main\webapp\resources\images\tq.jpg.png" class="img-rounded" alt="tq" width="304" height="236"> 
  </div>
   
</body>
</html>
