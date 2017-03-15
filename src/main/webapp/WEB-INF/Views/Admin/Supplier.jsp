<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Supplier Page </title>
</head>
<body>

<center>
<h2> Manage Supplier Details </h2>

<form action="Supplier_Create" method="post">
ID: <input type="text" name="id"><br>
Name: <input type="text" name="name"><br>
Address: <input type="text" name="address"><br>
<input type="submit" value="Create">
</form>
<br>

<table border="7">
<thead>
<tr> 
<td> ID </td>
<td> Name </td>
<td> Address </td>
<td> Action </td>
</tr>
</thead>

<c:forEach var="supplier" items="${supplierList}">

<tr>
<td>${supplier.ID}</td>
<td>${supplier.name}</td>
<td>${supplier.address}</td>
<td><a href="<c:url value='/Supplier_Edit/${supplier.ID}'/>">Edit </a> || <a href="<c:url value='/Supplier_Delete/${supplier.ID}'/>">Delete </a></td>
</tr>

</c:forEach>
</table>

</center>
</body>
</html>