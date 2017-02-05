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

		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title">Delivery Address</div>
				</div>
				<div class="panel-body">
					<form:form role="form" modelAttribute="orderBean">
					<input type="hidden" class = "choose" name = "addressChoosen">
						<c:forEach items="${orderBean.addresses}" var="address">
							<div class=" col-md-3 col-sm-12 col-xs-12">
								<div class="thumbnail nopadding default-border">
									<div class="well no-bottom-margin">
										<div class="caption">
											<address>
												<Strong>${address.id} ${address.firstName} ${address.lastName}</Strong><br>
												${address.lineOne },<br> ${address.lineTwo },<br>${address.landmark},<br>${address.city}
												- ${address.pincode}<br> ${address.state}<br> <abbr
													title="Phone">Ph:</abbr> ${address.mobileNumber }
											</address>
											<c:choose>
												<c:when test="${address.defaultAddress == true }">
													<input type="radio" class="cAddress" name = "chooseAddress" value="${address.id}">
													<input type="submit" name="_eventId_addressList"
														class="btn btn-primary" value="Continue">
												</c:when>
												<c:otherwise>
													<input type="radio" class="cAddress" name = "chooseAddress" value="${address.id}">
													<input type="submit" name="_eventId_addressList"
														class="btn btn-default" value="Deliver Here">
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
