<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Product Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  
  footer{
  margin-top:50px;
  }
body {
width:100%;
}
  
  </style>
</head>
<body>

	<div class="container">
		<c:forEach items="${IndividualProduct}" var="product">
		<h2><c:out value="${product.name}"/></h2>
			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img  height="300px" width="300px" alt="${product.id}" src="<c:url value="/resources/images/${product.id}.jpg"></c:url>">
					<div class="desc">
					<%-- 	<strong>${product.name}</strong> --%>
						
					</div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						<div class="form-group">
							<input type="text" class="form-control" value="${product.name}" readonly="readonly">
						</div>
						
						<div class="form-group">
							 <input type="text" class="form-control" value="Rs. ${product.price}" readonly="readonly">
						</div>
						</div>
						</div>
						</div>
						</c:forEach>
						</div>
</body>
</html>
