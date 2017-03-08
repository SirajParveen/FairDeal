<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Admin Page </title>
</head>
<body>

<a href="Manage_Category"> Category </a> <br>
<a href="Manage_Product"> Product </a> <br>
<a href="Manage_Supplier"> Supplier </a> <br>

<c:if test="${isUserClickedCategory == true}">
<jsp:include page="Category.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedProduct == true}">
<jsp:include page="Product.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedSupplier == true}">
<jsp:include page="Supplier.jsp"></jsp:include>
</c:if>

</body>
</html>