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
		<%@include file="./shared/header.jsp"%>
		<div class="row tenpadding">
			<!-- Panel Created with heading -->
			<div class="panel panel-primary col-md-8 col-md-offset-2">
				<div class="panel-heading">
					<h3 class="panel-title">Sign Up</h3>
				</div>
				<!-- Panel Body Created with padding-top 10px -->
				<div class="panel-body .tenpadding">
					<!-- Login Form Started from here -->
					<form:form id="registerForm" class="col-md-offset-2 col-md-8"
						role="form" modelAttribute="user">
						<div class="form-group">
							<label for="firstName" class="text-primary control-label">First
								Name</label>
							<div class="label-size">
								<strong>${user.firstName}</strong>
							</div>
						</div>
						<div class="form-group">
							<label for="lastName" class="text-primary control-label">Last
								Name</label>
							<div class="label-size">
								<strong>${user.lastName}</strong>
							</div>
						</div>
						<%-- End of LastName and FirstName --%>
						<div class="form-group">
							<label for="email" class="text-primary control-label">Email
								Address</label>
							<div class="label-size">
								<strong>${user.email}</strong>
							</div>
						</div>
						<%--End Of Email Field --%>

						<div class="form-group">
							<label for="gender" class="text-primary">Gender</label>
							<div class="label-size">
								<strong>${user.gender}</strong>
							</div>
						</div>
						<%--End of Gender Fields --%>

						<div class="form-group">
							<label for="mobileNumber" class="text-primary">Mobile
								Number</label>
							<div class="label-size">
								<strong>${user.mobileNumber}</strong>
							</div>
						</div>
						<%--End of Mobile Number Field --%>

						<div class="form-group">
							<input type="submit" name="_eventId_registerUser"
								class="btn btn-success col-md-3" value="Confirm">
							<input type="submit" name="_eventId_editRegister"
								class="btn btn-warning col-md-offset-1 col-md-3" value="Edit">
						</div>
						<%--End of Submit and reset Button --%>
					</form:form>
					<!-- End of form -->
				</div>
				<!-- End of panel-body -->
			</div>
			<!-- End of panel -->
		</div>
		<!-- End of row -->
	</div>
	<div class="container-fluid">
		<%@include file="./shared/footer.jsp"%>
	</div>
</body>
</html>