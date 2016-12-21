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

<h1>fa fa-chevron-circle-right</h1>

<i class="fa fa-chevron-circle-right"></i>
<i class="fa fa-chevron-circle-right" style="font-size:24px"></i>
<i class="fa fa-chevron-circle-right" style="font-size:36px"></i>
<i class="fa fa-chevron-circle-right" style="font-size:48px"></i>
	<script type="text/javascript" src="${js}/jquery.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.js"></script>
	<script type="text/javascript" src="${js}/angular.js"></script>
</body>
</html>