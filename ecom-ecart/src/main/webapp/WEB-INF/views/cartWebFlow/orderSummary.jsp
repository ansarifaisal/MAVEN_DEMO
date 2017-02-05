<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>E-Cart - ${title}</title>
<script type="text/javascript">
	window.hoverMenu = '${title}';
</script>
<!-- import JS Files -->
<script type="text/javascript" src="${js}/jquery.js"></script>
<script type="text/javascript" src="${js}/jquery.validate.js"></script>
<script type="text/javascript" src="${js}/bootstrap.js"></script>
<script type="text/javascript" src="${js}/myScript.js"></script>


<!-- Import CSS Files -->
<link href="${css}/bootstrap-paper.css" rel="stylesheet" type="text/css">
<link href="${css}/font-awesome.css" rel="stylesheet" type="text/css">
<link href="${css}/app.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<%@include file="../shared/header.jsp"%>
		<div class="panel panel-primary">
			<div class="panel-heading" style="font-size: 15px;">Delivery
				Address</div>
			<div class="panel-body">
				<div class="col-md-10 col-sm-10 col-xs-10">
					<div class="lead nomargin">
						<strong>${orderBean.address.firstName}
							${orderBean.address.lastName}</strong>
						&nbsp;${orderBean.address.mobileNumber}
					</div>
					${orderBean.address.lineOne}, ${orderBean.address.lineTwo},
					${orderBean.address.landmark}, ${orderBean.address.city},
					${orderBean.address.state} - ${orderBean.address.pincode}
				</div>
				<div class="col-md-2 col-sm-2 col-xs-2">
					<form:form modelAttribute="orderBean">
						<input type="submit" name="_eventId_addressList"
							class="btn btn-warning" value="Change Address">
					</form:form>
				</div>
			</div>
		</div>


		<div class="panel panel-primary">
			<div class="panel-heading" style="font-size: 15px;">Order
				Summary</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<td>ITEM</td>
							<td>QTY</td>
							<td>PRICE</td>
							<td>DELIVERY DETAILS</td>
							<td>SUBTOTAL</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderBean.cartItems}" var="cartItem">
							<tr>
								<%--item column --%>
								<td class="col-md-7">
									<div class="col-md-1" style="padding: 0px;">
										<img alt="${cartItem.product.productName}"
											src="${images}/product/${cartItem.product.id}.png"
											style="height: 100px; width: 50px;">
									</div>
									<div class="col-md-11">
										${cartItem.product.productName}<br />
										<div class="text-muted">${cartItem.product.description}</div>
										<%-- <div class="text-right">
											<a href="${contextPath}/user/cart/delete/${cartItem.id}"
												class="btn btn-danger">Remove</a>
										</div>
									</div> --%>
								</td>
								<%--item column Ends here --%>

								<%-- QTY Column Starts Here--%>
								<td>${cartItem.quantity}</td>
								<%-- QTY Column Ends Here--%>
								<%--Price Column Starts Here --%>
								<td>
									<div style="font-color: black; font-size: 16px;">&#8377;${cartItem.itemPrice}</div>
								</td>
								<%--Price Column Starts Here --%>
								<td>
									<div class="text-info" style="font-weight: bold;">Free</div>
								</td>
								<td>
									<div
										style="font-color: black; font-weight: bold; font-size: 16px;">
										&#8377;${cartItem.totalPrice }</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-right well"
					style="margin-top: -20px; font-size: 25px;">Amount Payable:
					&nbsp;&#8377;${orderBean.cart.grandTotal}</div>

				<div class="text-right">
					<%-- <a href="${contextPath}/" class="btn-lg btn-default">< Continue
						Shopping</a> --%>
					<form:form modelAttribute="orderBean">
						<input type="submit" name="_eventId_payment"
							value="Proceed to Pay" class="btn-lg btn-warning">
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
