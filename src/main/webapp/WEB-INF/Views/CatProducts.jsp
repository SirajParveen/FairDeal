<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CatProducts Page</title>
<link href="<c:url value="/resources/css/itempage.css" />"
	rel="stylesheet">
	
<style type="text/css">
#product
{
display: none;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
    $("#mycategory").click(function(){
        $("#myproduct").hide();
    });
});
 </script>

</head>
<body style="padding-top: 60px">

<script>
document.body.style.backgroundImage = "url('resources/images/header.jpg')";
</script>

		<div class="container">
		<c:forEach items="${navproducts}" var="product">
			<div class="col-xs-3 w3-animate-zoom">
				<div class="img">
					<a href="ShowProduct/${product.id}"> <img height="192px" width="192px" alt="${product.id}"
						src="<c:url value="/resources/images/${product.id}.jpg"></c:url>">
					</a>

					<div class="desc">
						<p style="color: white;">
							${product.name}<br> <i class="fa fa-inr" aria-hidden="true"></i>
							${product.price}
						
									<form action="addtoCart/${userid}/${product.id}">
									<input type="submit" class="btn btn-primary" value="Add To Cart"/>
									</form>
									
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
		<c:choose>
		<c:when test="${isUserClickedCart}">
			<c:import url="/WEB-INF/Views/Cart.jsp"></c:import>
		</c:when>
	</c:choose>
</body>