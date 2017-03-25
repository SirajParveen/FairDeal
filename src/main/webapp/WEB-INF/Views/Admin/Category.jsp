<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Manage Category Page </title>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="../Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="../Menu/CategoryMenu.jsp"></jsp:include>

${Message}

<center>
<h2> Manage Category Details </h2>

<c:url var="addAction" value="/Manage_Category_Create"></c:url>
	<form:form action="${addAction}" commandName="category"  method="post">

<table border="7">
<thead>

<tr>

<td><form:label path="id"><spring:message text="id" /></form:label></td>

	<c:choose>
	<c:when test="${not empty category.id} ">
	<td><form:input path="id"  readonly="true" /></td>
	</c:when>
	<c:otherwise>
	<td><form:input path="id" required="true" title="id should contain 5 to 20 characters" /></td>
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
			<th width="80">id</th>
			<th width="120">Name</th>
			<th width="120">Description</th>
			<th width="60">Edit</th>
			<th width="60">Delete</th>
			</tr>
	<c:forEach items="${categoryList}" var="category">
			<tr>
			<td>${category.id}</td>
			<td>${category.name}</td>
			<td>${category.description}</td>
			<td><a href="<c:url value='/Manage_Category_Edit/${category.id}' />">Edit</a></td>
					
			<td><a href="<c:url value='/Manage_Category_Delete/${category.id}' />">Delete</a></td>
			</tr>
	</c:forEach>
	</table>
	</c:if>

</center>

<jsp:include page="../Menu/Footer.jsp"></jsp:include>
</body>
</html>