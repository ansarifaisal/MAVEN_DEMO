<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="${css}/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${css}/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="${css}/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${css}/font-awesome.min.css" type="text/css">
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextPath}/index">E-Cart</a>
		</div>
			<div class="collapse navbar-collapse" id="collapse-1">
				<form class="navbar-form">
					<div class="form-group">
						<div class="input-group col-md-12">
							<input type="text" class="form-control"
								placeholder="Search for products"> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">
									<span class="glyphicon glyphicon-search" id="btn-search"
										aria-hidden="true"></span>
								</button>
							</span>
						</div>
						</div></form></div></div></nav>
	<script type="text/javascript" src="${js}/jquery.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.js"></script>
	<script type="text/javascript" src="${js}/angular.js"></script>
</body>
</html>