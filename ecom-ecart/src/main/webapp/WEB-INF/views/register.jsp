<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>E-Cart - Register</title>
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
							<div class="validate">
								<form:input class="form-control" id="firstName" path="firstName"
									placeholder="Enter First Name" />
									
								<form:hidden class="form-control" id="userId" path="id"
									disable="disable" />
							</div>
						</div>
						<div class="form-group">
							<label for="lastName" class="text-primary control-label">Last
								Name</label>
							<div class="validate">
								<form:input class="form-control" id="lastName" path="lastName"
									placeholder="Enter Last Name" />
							</div>
						</div>
						<%-- End of LastName and FirstName --%>
						<div class="form-group">
							<label for="email" class="text-primary control-label">Email
								Address</label>
								
							<div class="validate">
								<form:input class="form-control" id="email" path="email"
									placeholder="Enter Email Address" />
							</div>
							<c:forEach items = "${flowRequestContext.messageContext.getMessagesBySource('email')}" var = "error">
										<span class="text-danger">${error.text}</span>
									</c:forEach>
						</div>
						<%--End Of Email Field --%>

						<div class="form-group">
							<label for="password" class="text-primary control-label">Password</label>
							<div class="validate">
								<form:password class="form-control" id="password"
									path="password" placeholder="Enter Password" />
							</div>
						</div>
						<%-- End of Password Field --%>

						<div class="form-group">
							<label for="rePassword" class="text-primary control-label">Re-Enter
								Password</label>
							<div class="validate">
								<form:password class="form-control" id="rePassword"
									path="confirmPassword" placeholder="Re-Enter Password" />
							</div>
						</div>
						<%-- End of Re-Type Password Field --%>

						<div class="form-group">
							<label for="gender" class="text-primary">Gender</label>
							<div class="validate">
								<div class="gender">
									<select class="form-control" name="gender">
										<option value = "">What you are</option>
										<option value = "Male">Male</option>
										<option value = "Female">Female</option>
									</select>
								</div>
							</div>
						</div>
						<%--End of Gender Fields --%>

						<div class="form-group">
							<label for="mobileNumber" class="text-primary">Mobile
								Number</label>
							<div class="validate">
								<form:input class="form-control" id="mobileNumber"
									path="mobileNumber" placeholder="Enter Mobile Number" />
							</div>
						</div>
						<%--End of Mobile Number Field --%>

					<!-- 	<div class="form-group col-md-offset-1">
							<div class="checkbox">
								<div class="validate">
									<div class="terms">
										<input type="checkbox" id="terms" name="terms"> Agree
										With The Terms and Conditions
									</div>
								</div>
							</div>
						</div> -->
						<%--End of Terms And Condition --%>

						<%-- Hidden Fields --%>
						<form:hidden path="enabled" value = "TRUE" disable = "disable"/>
						<form:hidden path="role" value = "USER" disable = "disable"/>
						<div class="form-group">
							<input type="submit" name="_eventId_submitRegister"
								class="btn btn-success col-md-3" value="Sign Up"> <input
								type="reset" class="btn btn-warning col-md-offset-1 col-md-3"
								value="Reset">
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