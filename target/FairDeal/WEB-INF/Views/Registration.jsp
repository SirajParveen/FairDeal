<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Registration Page</title>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

<h2>Please Register</h2>

<!--  Before coming to this page, you have to add  userDetails in ModelAndView object-->

<c:url var="action" value="Registration"></c:url>

	<form:form action="${action}" method="post" commandName="user">
<%-- 
		<div class="input-group margin-bottom-sm">
			<form:label path="id"><spring:message text="id" /></form:label>
			<form:input path="id" required="true" />
		</div> --%>

	<div class="input-group margin-bottom-sm">
			<form:label path="name"><spring:message text="name" /></form:label>
			<form:input path="name" required="true" />
		</div>


		<div class="input-group margin-bottom-sm">
			<form:label path="password"><spring:message text="password" /></form:label>
			<form:input path="password" required="true" />
		</div>
		
		<div class="input-group margin-bottom-sm">
		<form:label path="contact"><spring:message text="contact" /></form:label>
		<form:input path="contact" required="true" />
		</div>
		
		<div class="input-group margin-bottom-sm">
		<form:label path="mail"><spring:message text="mail" /></form:label>
		<form:input path="mail" required="true" />
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="submit" class="btn btn-default" value="Register">
	</form:form>
	
	<jsp:include page="Menu/Footer.jsp"></jsp:include>
	
</body>
</html>