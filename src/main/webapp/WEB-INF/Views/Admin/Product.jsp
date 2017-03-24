<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Product Page </title>
</head>
<body>

${Message}

<center>
<h2> Manage Product Details </h2>

<c:url var="addAction" value="/Manage_Product_Create"></c:url>
	<form:form action="${addAction}" commandName="product"  method="post">

<table border="7">
<thead>

<tr>

<td><form:label path="id"><spring:message text="ID" /></form:label></td>

	<c:choose>
	<c:when test="${not empty product.ID} ">
	<td><form:input path="id"  readonly="true" /></td>
	</c:when>
	<c:otherwise>
	<td><form:input path="id" pattern=".{5,20}" required="true" title="ID should contain 5 to 20 characters" /></td>
	</c:otherwise>
	</c:choose>

<tr>
<td><form:label path="name"><spring:message text="Name" /></form:label></td>
<td><form:input path="name" required="true" /></td>
</tr>

<tr>
<td><form:label path="price"><spring:message text="Price" /></form:label></td>
<td><form:input path="price" required="true" /></td>
</tr>

<tr>
<td><form:label path="description"> <spring:message text="Description"/></form:label></td>
<td><form:input path="description" required="true" /></td>
</tr>

<tr>
<td><form:label path="category_id"><spring:message text="Category_ID" /></form:label></td>
<td><form:input path="category_id" required="true" /></td>
</tr>

<tr>
<td><form:label path="supplier_id"><spring:message text="Supplier_ID" /></form:label></td>
<td><form:input path="supplier_id" required="true" /></td>
</tr>
			
<tr>
<td colspan="2"><c:if test="${!empty product.name}"><input type="submit" value="<spring:message text="Update Product"/>" />
	</c:if>
	<c:if test="${empty product.name}">
	<input type="submit" value="<spring:message text="Create Product"/>" />
	</c:if>
	</td>
	</tr>

</table>
</form:form>
<br>
	
<h3>Product List</h3>
	<c:if test="${!empty productList}">
	<table class="tg">
			<tr>
			<th width="80">ID</th>
			<th width="120">Name</th>
			<th width="120">Price</th>
			<th width="120">Description</th>
			<th width="120">Category_ID</th>
			<th width="120">Supplier_ID</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
			</tr>
	<c:forEach items="${productList}" var="product">
			<tr>
			<td>${product.ID}</td>
			<td>${product.name}</td>
			<td>${product.price}</td>
			<td>${product.description}</td>
			<td>${product.category_ID}</td>
			<td>${product.supplier_ID}</td>
			<td><a href="<c:url value='/Manage_Product_Edit/${product.ID}' />">Edit</a></td>
					
			<td><a href="<c:url value='/Manage_Product_Delete/${product.ID}' />">Delete</a></td>
			</tr>
	</c:forEach>
	</table>
	</c:if>

</center>

<%-- <center>
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

</center> --%>
</body>
</html>