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

<script>
document.body.style.backgroundImage = "url('resources/images/header.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
  
     <nav class="navbar navbar-inverse">
  <div class="container-fluid"> 
  <div class="navbar-header" class=" pull-left">
  <a class="navbar-brand" style="font-size:27px;margin-top: -4px;">
    </a>
    <sec:authorize access="isAuthenticated()">
     <a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME <sec:authentication property="principal.username"/> </a>
     
  	
</sec:authorize>
    </div>
     <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;">    
	  <li><a href="#">CONTACT US</a></li>
					  
   </ul>
   </div>
  </nav>
  <br>
  <br>
  <br>
  <div style="text-align:center;padding-top:40px;padding-bottom:40px">
  <h1 style="color: white;"> Thank You !!!</h1>
  <h3 style="color: white;">Your Payment Has Been Received <span class="glyphicon glyphicon-ok"></span></h3><br>
  <img src="resources\images\giphy.gif" class="img-rounded" alt="tq" width="400" height="250"> 
  </div>
   
</body>
</html>
