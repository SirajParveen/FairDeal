<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Admin Home Page</title>
 <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/images/header.jpg')";
</script>

<jsp:include page="../Menu/AdminBarFirst.jsp"></jsp:include>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
       </div>
    <ul class="nav navbar-nav">
          <li><a class="navbar-brand" style="font-size:15px;"><span class="glyphicon glyphicon-user"></span> WELCOME ADMIN </a></li>
       <li><a class="active" href="Manage_Category">Category</a></li>
      <li><a href="Manage_Product">Product</a></li>
      <li><a href="Manage_Supplier">Supplier</a></li> 
      </ul>
  </div>
</nav>

	<c:if test="${isAdminClickedCategory == true}">
		<jsp:include page="Category.jsp"></jsp:include>
	</c:if>

	<c:if test="${isAdminClickedProduct == true}">
		<jsp:include page="Product.jsp"></jsp:include>
	</c:if>

	<c:if test="${isAdminClickedSupplier == true}">
		<jsp:include page="Supplier.jsp"></jsp:include>
	</c:if>

</body>
</html>