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

<form action="Product_Create" method="post">
<b>ID:</b> <input type="text" name="id"><br><br>
<b>Name:</b> <input type="text" name="name"><br><br>
<b>Price:</b> <input type="text" name="price"><br><br>
<b>Description:</b> <input type="text" name="description"><br><br>
<b>Category_ID:</b> <input type="text" name="category_id"><br><br>
<b>Supplier_ID:</b> <input type="text" name="supplier_id"><br><br>
<b><input type="submit" value="Create"></b>&nbsp; &nbsp; &nbsp; &nbsp;
<b><input type="reset" value="Reset"></b>
</form>
<br>

<table border="7">
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
<td><a href="<c:url value='/Product_Edit/${product.ID}'/>">Edit </a> || <a href="<c:url value='/Product_Delete/${product.ID}'/>">Delete </a></td>
</tr>

</c:forEach>
</table>

</center>
</body>
</html>