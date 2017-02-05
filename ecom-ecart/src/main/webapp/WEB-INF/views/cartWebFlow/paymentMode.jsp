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
			<div class="panel-heading" style="font-size: 15px;">Payment
				Mode</div>
			<div class="panel-body">
				<div class="text-center">
					<form:form class="form" modelAttribute="orderBean">
						<form:radiobutton path="paymentMode" value="Debit/Credit Card"
							name="payment" />Debit/Credit Card<br>
						<form:radiobutton path="paymentMode" value="Cash On Delivery"
							name="payment" />Cash On Delivery<br>
						<input type="submit" name = "_eventId_paymentMode" class="btn btn-primary" value="Proceed">
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>