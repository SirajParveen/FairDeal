<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
 <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart Page</title>
<style>#myCarousel{display:none;}
#myproduct{display:none;}
.col-md-4
{
display:none;
}
</style>
</head>
<body>
<h1 align="center" style="margin-top:60px;">Your Cart</h1>
${emptycart}
<div class="container">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Update</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td data-th="product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="<c:url value="/resources/images/${product.id}.jpg"></c:url>" alt="${product.id }" class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin"><c:out value="${cart.productname}"/></h4>
									</div>
								</div>
							</td>
							<td data-th="price"><c:out value="${cart.price}"/></td>
							<td data-th="quantity"><c:out value="${cart.quantity}"/></td>
							<td data-th="quantity">
							 <c:url var="action" value="editorder/${cart.id}"></c:url>
		                       <form:form action="${action}" name="formID" modelAttribute="cart" method="post">
								<form:input type="number" class="form-control text-center" path="quantity" id="sel1" name="quantity" onchange="checkAndSubmit()" />
								</form:form>
							</td>
							<%-- <td data-th="Subtotal" class="text-center"><c:out value="${cart.subtotal}"/></td> --%>
							<td class="actions" data-th="">
								<a href="delete/${cart.id}"><button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button></a>								
							</td>
						</tr>
						
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>Total </strong></td>
						</tr>
						<tr>
							<td><a href="ROLE_USER" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total:<c:out value="${cartprice}"></c:out> </strong></td>
							<td><a href="checkoutFlow" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
</div>



 
<%-- <form:select >
<form:option value="1">1</form:option>
<form:option value="2">2</form:option>
<form:option value="3">3</form:option>
<form:option value="4">4</form:option>
<form:option value="5">5</form:option>
<form:option value="6">6</form:option>
<form:option value="7">7</form:option>
<form:option value="8">8</form:option>
<form:option value="9">9</form:option>
<form:option value="10">10</form:option>
</form:select> --%>
<script type="text/javascript">
function checkAndSubmit()
{
  if (document.getElementById('sel1').selectedIndex > -1)
  {
      document.formID.submit();
     // alert('both have been selected!');
  }
}
</script>
</body>
</html>
