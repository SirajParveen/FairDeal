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
      <li><a href="temp"><img src="<c:url value="/resources/images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="60px" height="60px" align="left"> </a>
        </ul>
        
        <ul class="nav navbar-nav">
       <li> <h3><b>FairDeal</b><small> <br> 
		IT IS ALL ABOUT YOU</small></h3>
		</li>
		</ul>
      
    <ul class="nav navbar-nav navbar-right">
    <security:authorize access="isAuthenticated()">
    <li><a href="perform_logout"><b>Logout </b><span class="glyphicon glyphicon-log-out"></span></a>
    </li>
    </security:authorize>
    </ul>
    </div>
 </nav>
 
<jsp:include page="CategoryMenu.jsp"></jsp:include> 

</body>
</html>