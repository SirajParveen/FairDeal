<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

</head>

<body>
	<div id="AdminHome">
		<a href="Manage_Category">Manage Category</a> &nbsp; &nbsp; <a
			href="Manage_Supplier">Manage Supplier</a> &nbsp; &nbsp; <a
			href="Manage_Product">Manage Product</a> &nbsp; &nbsp;

	</div>

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