<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${css}/bootstrap-paper.css" rel="stylesheet" type="text/css">
<%-- <link href="${css}/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${css}/bootstrap-theme.css" rel="stylesheet" type="text/css"> --%>
<link href="${css}/app.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${css}/font-awesome.min.css"
	type="text/css">
<script type="text/javascript" src="${js}/jquery.js"></script>
<script type="text/javascript" src="${js}/bootstrap.js"></script>
<script type="text/javascript" src="${js}/jquery.validate.js"></script>

<script type="text/javascript">
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
		$('#signupForm').tooltip();
		$("#signupForm")
				.validate(
						{
							rules : {
								firstname : {
									required : true,
									minlength : 2
								},
								lastname : {
									required : true,
									minlength : 2
								},
								username : {
									required : true,
									minlength : 2
								},
								confirm_password:{
									required:true,
									minlength:2,
									equalTo: "#password"
								}
							},
							messages : {
								firstname : {
									required : "Please enter your first name",
									minlength : "Your first name must consist of at least 2 charachters"
								},
								lastname:{
									required : "Please enter your last name",
									minlength : "Your last name must consist of at least 2 charachters"
								},
								username:{
									required : "Please enter your user name",
									minlength : "Your user name must consist of at least 2 charachters"
								},
								password:{
									required : "Please enter your password",
									minlength : "Your password must consist of at least 2 charachters"
								},
								confirm_password:{
									required : "Please enter your user name",
									minlength : "Your password must consist of at least 2 charachters",
									equalTo: "Enter password same as above"
								}
							},
							errorElement : "em",
							errorPlacement : function(error, element) {
								// Add the `help-block` class to the error element
								error.addClass("help-block");

								// Add `has-feedback` class to the parent div.form-group
								// in order to add icons to inputs
								element.parents(".col-sm-5").addClass(
										"has-feedback");
								if (element.prop("type") === "checkbox") {
									error.insertAfter(element.parent("label"));
								} else {
									error.insertAfter(element);
								}

								// Add the span element, if doesn't exists, and apply the icon classes to it.
								if (!element.next("span")[0]) {
									$(
											"<span class='glyphicon glyphicon-remove form-control-feedback'></span>")
											.insertAfter(element);
								}
							},
							success : function(label, element) {
								// Add the span element, if doesn't exists, and apply the icon classes to it.
								if (!$(element).next("span")[0]) {
									$(
											"<span class='glyphicon glyphicon-ok form-control-feedback'></span>")
											.insertAfter($(element));
								}
							},
							highlight : function(element, errorClass,
									validClass) {
								$(element).parents(".col-sm-5").addClass(
										"has-error").removeClass("has-success");
								$(element).next("span").addClass(
										"glyphicon-remove").removeClass(
										"glyphicon-ok");
							},
							unhighlight : function(element, errorClass,
									validClass) {
								$(element).parents(".col-sm-5").addClass(
										"has-success").removeClass("has-error");
								$(element).next("span")
										.addClass("glyphicon-ok").removeClass(
												"glyphicon-remove");
							}
						});
	});
</script>
</head>

<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Simple Form</h3>
			</div>
			<div class="panel-body">
				<form data-toggle="validator" id="signupForm" method="post"
					class="form-horizontal" action="">
					<div class="form-group has-feedback">
						<label class="col-sm-4 control-label" for="firstname">First
							name</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="firstname"
								name="firstname" placeholder="First name" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="lastname">Last
							name</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="lastname"
								name="lastname" placeholder="Last name" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="username">Username</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="Username" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="email">Email</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="Email" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="password">Password</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-4 control-label" for="confirm_password">Confirm
							password</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="confirm_password"
								name="confirm_password" placeholder="Confirm password" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-5 col-sm-offset-4">
							<div class="checkbox">
								<label> <input type="checkbox" id="agree" name="agree"
									value="agree" />Please agree to our policy
								</label>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-9 col-sm-offset-4">
							<button type="submit" class="btn btn-primary" name="signup"
								value="Sign up">Sign up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>