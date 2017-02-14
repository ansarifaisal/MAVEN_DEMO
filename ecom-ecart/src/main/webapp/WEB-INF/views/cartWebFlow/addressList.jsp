<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>E-Cart - Addresses List</title>
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

		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title">Delivery Address</div>
				</div>
				<div class="panel-body">
					<c:choose>
						<c:when test="${not empty orderBean.addresses}">
							<div class="row">
								<form:form role="form" modelAttribute="orderBean">
									<input type="hidden" class="choose" name="addressChoosen">
									<c:forEach items="${orderBean.addresses}" var="address">
										<div class=" col-md-3 col-sm-12 col-xs-12">
											<div class="thumbnail nopadding default-border">
												<div class="well no-bottom-margin">
													<div class="caption">
														<address>
															<Strong>${address.id} ${address.firstName}
																${address.lastName}</Strong><br> ${address.lineOne },<br>
															${address.lineTwo },<br>${address.landmark},<br>${address.city}
															- ${address.pincode}<br> ${address.state}<br> <abbr
																title="Phone">Ph:</abbr> ${address.mobileNumber }
														</address>
														<c:choose>
															<c:when test="${address.defaultAddress == true }">
																<input type="radio" class="cAddress"
																	name="chooseAddress" value="${address.id}">
																<input type="submit" name="_eventId_addressList"
																	class="btn btn-primary" value="Continue">
															</c:when>
															<c:otherwise>
																<input type="radio" class="cAddress"
																	name="chooseAddress" value="${address.id}">
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
							<div class="well">
								<div class="text-center">
									<button type="button" class="btn btn-default btn-lg"
										data-toggle="modal" data-target="#myModal">Add
										Address</button>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="well">
								<div class="text-center">
									<button type="button" class="btn btn-default btn-lg"
										data-toggle="modal" data-target="#myModal">Add
										Address</button>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<div class="modal-title">
										<h5>Add New Address</h5>
									</div>
								</div>
								<div class="modal-body">
									<form:form method="POST"
										action="${contextPath}/user/address/saveNewAddress"
										class="form addAddress" role="form" modelAttribute="address">
										<div class="form-group validate">
											<label for="firstName" class="control-label text-primary">First
												Name</label>
											<form:input path="firstName" class="form-control"
												placeholder="Enter Name" value="${address.firstName}" />
											<form:hidden path="id" class="form-control"
												value="${address.id} " />
											<%-- <form:hidden path="user" value="${user.id}" class="form-control" /> --%>
										</div>
										<div class="form-group validate">
											<label for="lastName" class="control-label text-primary">Last
												Name</label>
											<form:input path="lastName" class="form-control"
												placeholder="Enter Name" value="${address.lastName }" />
										</div>
										<div class="form-group validate">
											<label for="lineOne" class="control-label text-primary"
												id="label-text-area">Address Line 1</label>
											<form:input path="lineOne" class="form-control"
												placeholder="Enter Address Line 1"
												value="${address.lineOne }" />
										</div>
										<div class="form-group validate">
											<label for="lineTwo" class="control-label text-primary"
												id="label-text-area">Address Line 2</label>
											<form:input path="lineTwo" class="form-control"
												placeholder="Enter Address Line 2"
												value="${address.lineTwo}" />
										</div>
										<div class="form-group validate">
											<label for="landmark" class="control-label text-primary">Landmark
												(Optional)</label>
											<form:input path="landmark" class="form-control"
												id="landmark" placeholder="Enter Landmark"
												value="${address.landmark}" />
										</div>
										<div class="form-group validate">
											<label for="city" class="control-label text-primary">City</label>
											<form:input path="city" class="form-control" id="city"
												placeholder="Enter City" value="${address.city}" />
										</div>
										<div class="form-group validate">
											<label for="state" class="control-label text-primary">State</label>
											<form:input path="state" class="form-control" id="state"
												placeholder="Enter State" value="${address.state}" />
										</div>
										<div class="form-group validate">
											<label for="pincode" class="control-label text-primary">Pincode</label>
											<form:input path="pincode" class="form-control" id="pin"
												placeholder="Enter Pincode" value="${address.pincode }" />
										</div>
										<div class="form-group validate">
											<label for="country" class="control-label text-primary">Country</label>
											<form:input path="country" class="form-control" id="country"
												placeholder="Enter Pincode" value="India"
												disabled="disabled" />
										</div>

										<div class="form-group validate">
											<label for="mobileNumber" class="control-label text-primary">Phone
												Number</label>
											<form:input path="mobileNumber" class="form-control"
												id="phoneNumber" placeholder="Enter Phone Number"
												value="${address.mobileNumber }" />
										</div>
										<div class="form-group">
											<input type="submit"
												class="btn btn-primary col-md-offset-3 col-sm-offset-3"
												id="saveAddress" value="Add Address">
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
