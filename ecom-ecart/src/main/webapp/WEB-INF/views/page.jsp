<%-- All the tag will be here --%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<html>
<head>
<title>E-Cart</title>
<link href="${css}/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${css}/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="${css}/font-awesome.css" rel="stylesheet" type="text/css">
<link href="${css}/app.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="wrapper">

			<%@include file="./shared/header.jsp"%>


			<%@include file="index.jsp"%>

		</div>
		<%@include file="./shared/footer.jsp"%>
	</div>
	<script type="text/javascript" src="${js}/jquery.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.js"></script>
	<script type="text/javascript" src="${js}/angular.js"></script>

</body>
</html>
