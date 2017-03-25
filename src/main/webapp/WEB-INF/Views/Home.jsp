<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FairDeal</title>
</head>
<body>

${Message}

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>
<jsp:include page="Menu/Carousel.jsp"></jsp:include>

<c:if test="${isAdmin == true}">
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedLogin == true || invalidCredentials == true}">
	<div id="loginError">${errorMessage}</div>
	<jsp:include page="Login.jsp"></jsp:include>
	</c:if>

<c:if test="${isUserClickedRegistration==true}">
	<jsp:include page="Registration.jsp"></jsp:include>
	</c:if>
	
<c:if test="${isUserClickedCart == true}">
	<jsp:include page="Cart.jsp"></jsp:include>
	</c:if>
	
<c:if test="${displayCart == true}">
<jsp:include page="Cart.jsp"></jsp:include>
</c:if>

<jsp:include page="Menu/Footer.jsp"></jsp:include>

</body>
</html>
