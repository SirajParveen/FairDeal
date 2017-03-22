<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring"%>
<title>Registration Page</title>
</head>
<body>

<h2>Please Register</h2>

<!--  Before coming to this page, you have to add  userDetails in ModelAndView object-->

<form action="/Registration" method="post">

USER ID: <input type="text" name="user">  <br>
 
PASSWORD : <input type="password" name="password">   <br>

CONTACT : <input type="text" name="contact"> <br>

EMAIL : <input type="text" name="email"> <br>

ADDRESS : <input type="text" name="address"><br>

<input type="submit" value="Register">


</form>
</body>
</html>