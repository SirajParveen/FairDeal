<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/Images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include>

	<h2>LOGIN</h2>
	<br> 
	${Message}

	<c:url var="action" value="perform_login"></c:url>

	<form name='loginForm' action="${action}" method="post">

		<div class="input-group margin-bottom-sm">
			<span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span> 
			<input class="form-control" type="text" name="username" placeholder="Username">
		</div>

		<div class="input-group"><span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
			<input class="form-control" type="password" name="password" placeholder="Password">
		</div>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="submit" class="btn btn-default" value="Login">
	</form>

<jsp:include page="Menu/Footer.jsp"></jsp:include>

</body>
</html>