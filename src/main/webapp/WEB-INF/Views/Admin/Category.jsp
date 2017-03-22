<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Category Page </title>
</head>
<body>

${Message}

<center>
<h2> Manage Category Details </h2>

<c:url var="addAction" value="/Manage_Category_Create"></c:url>
	<form:form action="${addAction}" commandName="category"  method="post">
	
<!-- <b>ID:</b> <input type="text" name="id"><br><br>
<b>Name:</b> <input type="text" name="name"><br><br>
<b>Description:</b> <input type="text" name="description"><br><br>
<b><input type="submit" value="Create"></b>&nbsp; &nbsp; &nbsp; &nbsp;
<b><input type="reset" value="Reset"></b>
<br> -->

<table border="7">
<thead>

<tr>

<td><form:label path="id"><spring:message text="ID" /></form:label></td>

	<c:choose>
	<c:when test="${not empty category.ID} ">
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
<td><form:label path="description"> <spring:message text="Description"/></form:label></td>
<td><form:input path="description" required="true" /></td>
</tr>
			
<tr>
<td colspan="2"><c:if test="${!empty category.name}"><input type="submit" value="<spring:message text="Update Category"/>" />
	</c:if>
	<c:if test="${empty category.name}">
	<input type="submit" value="<spring:message text="Create Category"/>" />
	</c:if>
	</td>
	</tr>

</table>
</form:form>
<br>
	
<h3>Category List</h3>
	<c:if test="${!empty categoryList}">
	<table class="tg">
			<tr>
			<th width="80">ID</th>
			<th width="120">Name</th>
			<th width="120">Description</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
			</tr>
	<c:forEach items="${categoryList}" var="category">
			<tr>
			<td>${category.ID}</td>
			<td>${category.name}</td>
			<td>${category.description}</td>
			<td><a href="<c:url value='/Manage_Category_Edit/${category.ID}' />">Edit</a></td>
					
			<td><a href="<c:url value='/Manage_Category_Delete/${category.ID}' />">Delete</a></td>
			</tr>
	</c:forEach>
	</table>
	</c:if>

</center>
</body>
</html>