<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Product Page </title>
</head>
<body>

<center>
<h2> Manage Product Details </h2>

<form action="">
ID: <input type="text" name="id">
Name: <input type="text" name="name">
Price: <input type="text" name="price">
Description: <input type="text" name="description">
Category_ID: <input type="text" name="category_id"> <br>
Supplier_ID: <input type="text" name="supplier_id">
Create: <input type="submit" value="Create">
</form>
<br>

<table border="2">
<thead>
<tr> 
<td> ID </td>
<td> Name </td>
<td> Price </td>
<td> Description </td>
<td> Category_id </td>
<td> Supplier_id </td>
<td> Action </td>
</tr>
</thead>

<c:forEach var="product" items="${productList}">

<tr>
<td>${product.ID}</td> 
<td>${product.name}</td>
<td>${product.price}</td>
<td>${product.description}</td>
<td>${product.category_ID}</td>
<td>${product.supplier_ID}</td>
<td> <a href="/Product_Edit">Edit</a> | <a href="/Product_Delete">Delete</a>
</tr>

</c:forEach>
</table>

</center>
</body>
</html>