<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Page</title>
</head>
<body>
	${Message}
	<center>
		<h2 style="color: white;">Enter Category Details</h2>

	<c:if test="${empty category.name}">
		<c:url var="addAction" value="/Manage_Category_Create"></c:url>
		</c:if>
		<c:if test="${!empty category.name}">
		<c:url var="addAction" value="/Manage_Category_Update"></c:url>
		</c:if>
		
		<form:form action="${addAction}" commandName="category" method="post">

			<table border="7">
				<thead>

					<tr>

						<td style="color: white;"><form:label path="id">
								<spring:message text="Id" />
							</form:label></td>

						<c:choose>
							<c:when test="${not empty category.id} ">
								<td style="color: white;"><form:hidden path="id" readonly="true" editable="false"/></td>
							</c:when>
							<c:otherwise>
								<td style="color: white;"><form:hidden path="id" required="true"
										title="id should contain 5 to 20 characters" /></td>
							</c:otherwise>
						</c:choose>
					<tr>
						<td style="color: white;"><form:label path="name">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input path="name" required="true" /></td>
					</tr>

					<tr>
						<td style="color: white;"><form:label path="description">
								<spring:message text="Description" />
							</form:label></td>
						<td><form:input path="description" required="true" /></td>
					</tr>

					<tr>
						<td colspan="2"><c:if test="${!empty category.name}">
								<input type="submit"
									value="<spring:message text="Update Category"/>" />
							</c:if> <c:if test="${empty category.name}">
								<input type="submit"
									value="<spring:message text="Create Category"/>" />
							</c:if></td>
					</tr>
			</table>
		</form:form>

	</center>


	<center>
		<h2 style="color: white;">Category List</h2>

		<c:if test="${!empty categoryList}">
			<table class="tg" border="2">
				<thead>
					<tr style="color: white;">
						<td>ID</td>
						<td>NAME</td>
						<td>DESCRIPTION</td>
						<td>Action</td>
					</tr>
				</thead>

				<c:forEach var="category" items="${categoryList}">

					<tr style="color: white;">
						<td>${category.id}</td>
						<td>${category.name}</td>
						<td>${category.description}</td>

						<td><a href="Manage_Category_Edit/${category.id}">Edit </a>||
							<a href="Manage_Category_Delete/${category.id}">Delete</a></td>
					</tr>


				</c:forEach>
			</table>
		</c:if>
	</center>
</body>
</html>