<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart WebSite</title>
</head>
<body>

<img src="<c:url value="/resources/Images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="100px" height="100px" align="left">
<h1><b>Shopping Cart</b><small> <br> 
Your Need Your Choice</small></h1>
<hr>

<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

<center>
<h1>${Role} <br>
${ErrorMessage} <br>
${LoginMessage} <br></h1>
</center>

<c:if test="${isAdmin == true}">
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>
</c:if>

<center>
<c:if test="${empty LoginMessage}">
<a href="Login"> Login Page </a> <br>
<a href="Registration"> Registration Page </a> <br>
</c:if>

<c:if test="${not empty LoginMessage}">
<a href="Logout"> Logout </a> <br>
</c:if>

<c:if test="${isAdmin == false}">
<a href="MyCart"> MyCarts </a> <br>
</c:if>
</center>

<c:if test="${isUserClickedLogin == true}">
<jsp:include page="Login.jsp"></jsp:include>
</c:if>

<c:if test="${not empty ErrorMessage}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>	

<c:if test="${isUserClickedRegistration==true}">
	<jsp:include page="Registration.jsp"></jsp:include>
	</c:if>

</body>
</html>
