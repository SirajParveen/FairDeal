<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart WebSite</title>
</head>
<body>

<img src="<c:url value="/resources/Images/ShoppingCartPic.jpg"></c:url>" alt="ShoppingCartPic" width="50px" height="50px" align="left">
<h2><b>Shopping Cart</b><small> <br> 
Your Need Your Choice</small></h2>
<br>

<h4><b>${ErrorMessage}</b></h4>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>

<c:if test="${isAdmin == true}">
<jsp:include page="Menu/CategoryBarAdmin.jsp"></jsp:include>
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>
</c:if>

<c:if test="${isAdmin != true  }">
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedLogin == true}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>

<c:if test="${not empty ErrorMessage}">
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>	

<c:if test="${isUserClickedRegistration==true}">
	<jsp:include page="Registration.jsp"></jsp:include>
	</c:if>
	
<c:if test="${isUserClickedCart == true}">
	<jsp:include page="Cart.jsp"></jsp:include>
	</c:if>

</body>
</html>
