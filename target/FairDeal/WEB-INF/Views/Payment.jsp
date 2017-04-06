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
<title>Payment Page</title>
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
  </style>
</head>
<body  style="background-color:#ffffff;">

 <img  src="https://egybikers.com/images/dealershowroom/facebook%20profile%20pic.jpg" alt="logo" width="60px" height="60px" align="left">  

     <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid"> 
  <div class="navbar-header" class=" pull-left">
  <a class="navbar-brand" style="font-size:27px;margin-top: -4px;">
     <i class="fa fa-opencart" aria-hidden="true"></i> FairDeal </a>
    <sec:authorize access="isAuthenticated()">
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME <sec:authentication property="principal.username"/> </a>
     
  	
</sec:authorize>
    </div>
     <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;">    
      <li><a href="Home">HOME</a></li>
       <sec:authorize access="!isAuthenticated()">
      <li><a href="Registration">REGISTER</a></li>
      <li><a href="login">LOGIN</a></li>
      </sec:authorize>
	  <li><a href="CONTACTUS">CONTACT US</a></li>
   <sec:authorize access="isAuthenticated()">
   <li ><a href="Cart" >CART <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
	<li><a href="<c:url value="/perform_logout" />">LOGOUT <span class="glyphicon glyphicon-log-out"></span></a></li>
</sec:authorize>
					  
   </ul>
   </div>
  </nav>
  <br><br>
  <br><br>
  <br>
  <br>
   <div class="container">
  <div class="row col-xs-4"></div>
  <div class="col-xs-4">
  <div class="panel panel-primary">
     <div class="panel-heading">
   
      <div class="row">
       <h3 class="panel-title " style="padding-left: 20px">Select Payment Type</h3>
       
      </div>
     </div>
     <div class="panel-body">
<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="method">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
      <input type="radio" name="method" value="cod">  Cash On Delivery<br><br>
     <input type="radio" name="method" value="card">  Credit Card <br><br>
         <button class="btn btn-success btn-sm btn-block" type="submit">Proceed</button>  
        </form>
        </div>
        </div>
        </div>
        </div>
        <br><br><br><br><br><br>
        
</body>
</html>
