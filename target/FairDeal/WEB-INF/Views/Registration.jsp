<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

 --%>
 
 
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
      <link rel="stylesheet" href="resources/registration/css/style.css">
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

   <c:url var="action" value="Registration"></c:url>

	<form:form action="${action}" method="post" commandName="user">

	<hgroup>
  <h1>Registration</h1>
</hgroup>
<br><br>
<form>
  <div class="group">
    <form:label path="name"><spring:message var="name" /></form:label>
	<form:input path="name" required="true" /><span class="highlight"></span><span class="bar"></span>
  </div>
    <div class="group">
   <form:label path="password"><spring:message text="password" /></form:label>
	<form:input path="password" required="true" />
  </div>
    <div class="group">
    <form:label path="contact"><spring:message text="contact" /></form:label>
	<form:input path="contact" required="true" />
  </div>
  <div class="group">
   <form:label path="mail"><spring:message text="mail" /></form:label>
	<form:input path="mail" required="true" />
  </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
   <input type="submit" class="btn btn-default" value="Register">
</form>
<footer><a href="http://www.polymer-project.org/" target="_blank"><img src="https://www.polymer-project.org/images/logos/p-logo.svg"></a>
  <p><a href="http://www.polymer-project.org/" target="_blank"></a></p>
</footer>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="resources/registration/js/index.js"></script>
    
	</form:form>
	
	<jsp:include page="Menu/Footer.jsp"></jsp:include>
	
</body>
</html>
 