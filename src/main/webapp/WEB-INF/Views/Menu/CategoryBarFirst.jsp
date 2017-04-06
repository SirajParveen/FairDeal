<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li><a href="Home"><img src="<c:url value="/resources/images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="60px" height="60px" align="left"> </a>
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
      <li><a href="Home"><b>Home </b><span class="glyphicon glyphicon-home"></span> </a>
        </ul>
		
		 <div class="container">
    <ul class="nav navbar-nav navbar-right">
     <security:authorize access="!isAuthenticated()">
      <li><a href="login"><b>Login </b><span class="glyphicon glyphicon-user"></span> </a>
      <li><a href="Registration"><b>New Customer? Register Here </b><span class="glyphicon glyphicon-log-in"></span> </a>
      </li>
      </security:authorize>
        </ul>
      
    <ul class="nav navbar-nav navbar-right">
    <security:authorize access="isAuthenticated()">
    <li><a href="perform_logout"><b>Logout </b><span class="glyphicon glyphicon-log-out"></span></a>
    </li>

    <li class="nav navbar-nav">
    <li style="float: right"><a href="Cart" class="w3-hover-none w3-text-sand w3-hover-text-white"><b>MyCarts </b>
  <i class="fa fa-shopping-cart"></i> <span class="w3-badge w3-white"></span></a></li>
    </security:authorize>
    </ul>
    </div>
		

</div>
 </nav>

</body>
</html>