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

	<h2>LOGIN</h2>
	<br> 
	${Message}

	<c:url var="action" value="perform_login"></c:url>

	<form name='loginForm' action="${action}" method="post">

		<div class="input-group margin-bottom-sm">
			<span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span> 
			<input class="form-control" type="text" name="username" placeholder="User ID">
		</div>

		<div class="input-group"><span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
			<input class="form-control" type="password" name="password" placeholder="Password">
		</div>

		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		<input type="submit" class="btn btn-default" value="Login">
	</form>

	<%-- <b>Enter USER ID:</b> <input type="text" name="username"> <br><br>

<b>Enter PASSWORD:</b> <input type="password" name="password"> <br><br>

<b><input type="submit" value="Login"></b> &nbsp; &nbsp; &nbsp; &nbsp; 

<b><input type="reset" value="Reset"></b>

</form>--%>

</body>
</html>