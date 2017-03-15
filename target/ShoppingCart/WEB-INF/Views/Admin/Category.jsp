<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Category Page </title>
</head>
<body>

<center>
<h2> Manage Category Details </h2>
<hr>

<form action="Category_Create" method="post">
ID: <input type="text" name="id">
Name: <input type="text" name="name">
Description: <input type="text" name="description">
<input type="submit" value="Create">
</form>
<br>

<table border="2">
<thead>
<tr> 
<td> ID </td>
<td> Name </td>
<td> Description </td>
<td> Action </td>
</tr>
</thead>

<c:forEach var="category" items="${categoryList}">

<tr>
<td>${category.ID}</td>
<td>${category.name}</td>
<td>${category.description}</td>
<td><a href="<c:url value='/Category_Edit/${category.ID}'/>">Edit </a> || <a href="<c:url value='/Category_Delete/${category.ID}'/>">Delete </a></td>
</tr>

</c:forEach>
</table>

</center>
</body>
</html>