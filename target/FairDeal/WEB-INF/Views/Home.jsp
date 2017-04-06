<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FairDeal</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<script>
document.body.style.backgroundImage = "url('resources/images/BackgroundImage.jpg')";
</script>

<jsp:include page="Menu/CategoryBarFirst.jsp"></jsp:include>
<jsp:include page="Menu/CategoryMenu.jsp"></jsp:include> 

<h3><b>
${Message}
${SuccessRegister}
${errorMessage}
</b></h3>

<c:if test="${isAdmin == true}">
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>
</c:if>

<c:if test="${isAdmin != true}">
<jsp:include page="Menu/Carousel.jsp"></jsp:include>
</c:if>

<c:if test="${isUserClickedLogin == true || invalidCredentials == true}">
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

<c:if test="${UserClickedshowproduct}">
<jsp:include page="/WEB-INF/Views/ShowProduct.jsp"></jsp:include>
</c:if>

<c:choose>
	 <c:when test="${Clickedcatproduct}">
			<c:import url="/WEB-INF/Views/CatProducts.jsp"></c:import>
		</c:when>
	</c:choose> 
 


<%-- <c:if test="${isUserClickedCart!=true}">
				
	<c:forEach items="${productList}" var="product">
		<tr>


			<td>
				<!-- <div class="thumbnail"> -->
				<div class="col-md-4">
					<a href="ShowProduct/${product.id}"> <img height="150px"
						width="150px" alt="${product.id }"
						src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>

					<td><c:url var="action" value="addtoCart/${userid}/${product.id}"></c:url>
						<form:form action="${action}" modelAttribute="cart">
							<td id="td1"><c:out value="${product.name}" /><br>
							<td id="td1"><c:out value="${product.price}" /> <input
								type="submit" class="btn btn-primary" value="Add To Cart" /><br>
						</form:form></td> <br>

				</div>
				<!-- </div> -->

			</td>
		</tr>
	</c:forEach>
	</c:if> --%>


				<c:if test="${isUserClickedCart != true}">
					<div id="product">
						<!-- <ul> -->
						<div class="row" id="product"
							style="padding-top: 20px; padding-botton: 20px; padding-left: 20px; padding-bottom: 20px;">
							<!-- <h3 style="margin-left: 15px">Latest Products</h3> -->
							<c:forEach items="${productList}" var="product">
								<div class="col-xs-2 w3-animate-zoom">
									<div class="img" style="margin: 5px">
										<a href="ShowProduct/${product.id}"> <img height="192px"
							                                width="192px" alt="${product.id}"
							src="<c:url value="/resources/images/${product.id}.jpg"></c:url>"></a>
							<c:url var="action" value="addtoCart/${userid}/${product.id}"></c:url>
							<form:form action="${action}" modelAttribute="cart">
								<td id="td1"><c:out value="${product.name}" /><br>
								<td id="td1"><c:out value="${product.price}" /> 								
								<input type="submit" class="btn btn-primary" value="Add To Cart"/><br>
							</form:form>
							</div>
								</div>
							</c:forEach>
						</div>
						<!-- </ul> -->
					</div>
					</c:if>
	
 
                       <!-- Starting of Footer -->

<footer>
    <div class="footer" id="footer">
    
        <div class="container">
            <div class="row">
               <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                    
                    <h3><b> Get to Know Us </b></h3>
                    
                       <a href="#"> About Us </a><br>
                        <a href="#"> Careers </a><br> 
                         <a href="#"> Press Releases </a><br>
                         <a href="#"> FairDeal Cares </a><br>
                          <a href="#"> Gift a Smile </a>
                          </li></ul>
                </div>
                
                 <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                    
                    <h3><b> Policy Info </b></h3>
                    
                       <a href="#"> Privacy Policy </a><br>
                        <a href="#"> Terms of Sale </a><br> 
                         <a href="#"> Terms of Use </a><br>
                         <a href="#"> Report Abuse and Takedown Policy </a><br>
                          <a href="#"> CSR Policy </a>
                          </li></ul>
                </div>
                
                  <div class="col-lg-3 col-md-3">
                <ul class="list-unstyled clear-margins">
                <li class="widget-container widget_nav_menu">
                
                 <h3><b> Let Us Help You </b></h3>
                    
                       <a href="#"> Your Account </a><br>
                        <a href="#"> Returns Centre </a><br> 
                         <a href="#"> 100% Purchase Protection </a><br>
                         <a href="#"> FairDeal Assistant </a><br>
                          <a href="#"> Help </a>
                          </li></ul>
                </div>
                
                
                 <div class="col-lg-3 col-md-3">
                  <ul class="list-unstyled clear-margins">
                  <li class="widget-container widget_recent_news">
                    
                  <h3 class="title-widget"><b>Contact Detail </b></h3>
                                
                   <div class="footerp"> 
                                
                   <h2 class="title-median"><font style="border-bottom-style: double;">FairDeal Pvt. Ltd.</font></h2>
                                <p><b>Email id:</b> <a href="#">FairDeal@gmail.com</a></p>
                                <p><b>Helpline Numbers </b>
         <b style="color:#ffc106;">(8AM to 10PM):</b><br>  +91-0987654321, +91-1234567890  </p>
    
                    <p><b>Corp Office / Postal Address</b></p>
                     <p><b>Phone Numbers : </b>1234567890, </p>
                      <p> 011-12345678, 1234567890</p>
                        </div>
                                
                <div class="social-icons">
                                    
                <a href="https://www.facebook.com"><i class="fa fa-facebook-square fa-2x" id="social"></i></a>
	            <a href="https://twitter.com"><i class="fa fa-twitter-square fa-2x" id="social"></i></a>
	            <a href="https://plus.google.com"><i class="fa fa-google-plus-square fa-2x" id="social"></i></a>
	            <a href="#"><i class="fa fa-envelope-square fa-2x" id="social"></i></a>
                 </div>             
                 </ul>
                 </div>
    
                 </div>
                </div>
                 </div>
               </footer><hr>
    
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left"> Copyright © 2017. FairDeal Private Limited. All Rights Reserved. </p>
            <div class="pull-right">
                <ul class="nav nav-pills payments">
                	<li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-amex"></i></li>
                    <li><i class="fa fa-cc-paypal"></i></li>
                </ul>  
            </div>
   </div>
   </div>
                                
                               <!-- Ending of Footer -->
                               
</body>
</html>

 
