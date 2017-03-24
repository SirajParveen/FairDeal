<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li><a href="#"><img src="<c:url value="/resources/Images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="60px" height="60px" align="left"> </a>
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
	 
     <c:if test="${empty LoginMessage}">  
     <security:authorize access="!isAuthenticated()">
    <ul class="nav navbar-nav navbar-right">
    
      <li><a href="login"><b>Login </b><span class="glyphicon glyphicon-user"></span> </a>
      <li><a href="Registration"><b>New Customer? Register Here </b><span class="glyphicon glyphicon-log-in"></span> </a>
    
        </ul>
         </security:authorize>
        </c:if> 
         
        
        <div class="container">
     <c:if test="${not empty LoginMessage}">
      <security:authorize access="!isAuthenticated()">
    <ul class="nav navbar-nav navbar-right">
    <li><a href="/secure_logout"><b>Logout </b><span class="glyphicon glyphicon-log-out"></span></a>
    </li>
    </ul>
</security:authorize>
    </c:if> 
    
    <c:if test="${isAdmin == false || isUserClickedCart == true}">
    <ul class="nav navbar-nav navbar-right">
    <li><a href="Cart"><b>MyCarts </b><span class="glyphicon glyphicon-shopping-cart"></span></a>
    </li>
    </ul>
    </c:if>
		
</div>
</div>		
 </div>
 </nav>

</body>
</html>