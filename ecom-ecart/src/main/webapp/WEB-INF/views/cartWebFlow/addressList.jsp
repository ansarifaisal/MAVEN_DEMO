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

		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title">Delivery Address</div>
				</div>
				<div class="panel-body">
					<form:form role="form" modelAttribute="orderBean">
						<c:forEach items="${orderBean.addresses}" var="address">
							<div class=" col-md-3 col-sm-12 col-xs-12">
								<div class="thumbnail nopadding default-border">
									<div class="well no-bottom-margin">
										<div class="caption">
											<address>
												<Strong>${address.firstName} ${address.lastName}</Strong><br>
												${address.lineOne },<br> ${address.lineTwo },<br>${address.landmark},<br>${address.city}
												- ${address.pincode}<br> ${address.state}<br> <abbr
													title="Phone">Ph:</abbr> ${address.mobileNumber }
											</address>
											<c:choose>
												<c:when test="${address.defaultAddress == true }">
													<input type="submit" name="_eventId_toOrderSummary"
														class="btn btn-primary" value="Continue">
												</c:when>
												<c:otherwise>
													<a href="${contextPath}/user/cart/order?add=${address.id}"
														class="btn btn-default">Deliver Here</a>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
