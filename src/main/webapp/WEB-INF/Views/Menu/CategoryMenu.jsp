<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
  
    <ul class="nav navbar-nav">
      <li><a href="Home">Home <span class="glyphicon glyphicon-home"></span> </a>
        </ul>
 
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ELECTRONICS<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Mobiles</a></li>
          <li><a href="#">Laptops</a></li>
          <li><a href="#">Televisions</a></li>
          <li><a href="#">Camera</a></li>
        </ul>
    </ul>
     <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">APPLIANCES<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Air Coditioners</a></li>
          <li><a href="#">Refrigerator</a></li>
          <li><a href="#">Washing Machine</a></li>
          <li><a href="#">Kitchen Appliances</a></li>
        </ul>
    </ul>
     <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">MEN<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Clothing</a></li>
          <li><a href="#">Footwear</a></li>
          <li><a href="#">Watches</a></li>
          <li><a href="#">Accessories</a></li>
        </ul>
    </ul>
     <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">WOMEN<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Clothing</a></li>
          <li><a href="#">Footwear</a></li>
          <li><a href="#">Jewellery</a></li>
          <li><a href="#">Accessories</a></li>
        </ul>
    </ul>
     <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">KIDS AND BABIES<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Kids Clothing</a></li>
          <li><a href="#">Kids Footwear</a></li>
          <li><a href="#">Toys</a></li>
          <li><a href="#">Baby Care</a></li>
        </ul>
    </ul>
    <div class="container">
    <c:if test="${empty LoginMessage}">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Login">Login <span class="glyphicon glyphicon-user"></span> </a>
      <li><a href="Registration">New Customer? Register Here <span class="glyphicon glyphicon-log-in"></span> </a>
        </ul>
        </c:if>
     <div class="container">
    <c:if test="${not empty LoginMessage}">
    <ul class="nav navbar-nav navbar-right">
    <li><a href="Logout">Logout <span class="glyphicon glyphicon-user"></span> </a>
    </li>
    </ul>
    </c:if>
    
    <c:if test="${isAdmin == false}">
    <ul class="nav navbar-nav navbar-right">
    <li><a href="Cart">MyCarts <span class="glyphicon glyphicon-user"></span> </a>
    </li>
    </ul>
    </c:if>
    </div>
    </div>
  </div>
</nav>


</body>
</html>
