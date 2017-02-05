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
			<div class="panel-heading" style="font-size: 15px;">Order
				Details</div>
			<div class="panel-body">
				<table class="table">
					<tbody>
						<tr>
							<td>
								<table class="table">
									<tbody>
										<tr>
											<td>Order ID:</td>
											<td>${orderBean.order.id}</td>
										</tr>
										<tr>
											<td>Amount Paid:</td>
											<td><strong>&#8377;${order.grandTotal }</strong></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table class="table">
									<tr>
										<td><div class="lead nomargin">${address.firstName}
												${address.lastName}</div></td>
									</tr>
									<tr>

									</tr>
								</table>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading" style="font-size: 15px;">Product
				Details</div>
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
						<c:forEach items="${orderItems}" var="orderItem">
							<tr>
								<%--item column --%>
								<td class="col-md-7">
									<div class="col-md-1" style="padding: 0px;">
										<img src="${images}/moto.jpeg"
											style="height: 100px; width: 50px;">
									</div>
									<div class="col-md-11">
										${orderItem.product.productName}<br />
										<div class="text-muted">${orderItem.product.description}</div>
									</div>
								</td>
								<td>${orderItem.quantity}</td>
								<td>${orderItem.itemPrice}</td>
								<td><div class="text-info">
										<strong>Free</strong>
									</div></td>
								<td>${orderItem.totalPrice }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-right well"
					style="margin-top: -20px; font-size: 25px;">Total:
					&ensp;&#8377;${order.grandTotal}</div>
			</div>
		</div>
	</div>
</body>
</html>