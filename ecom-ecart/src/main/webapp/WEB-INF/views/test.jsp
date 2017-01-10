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
<link href="${css}/app.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${css}/font-awesome.min.css"
	type="text/css">
	<script type = "text/javascript" src="${js}/jquery.js"></script>
<script type="text/javascript" src="${js}/bootstrap.js"></script>

<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
</head>

<body>
	<div class="container">
		<a href="#" data-toggle="tooltip" title="Some tooltip text!">Hover
			over me</a>
			
			<button type="button" class="btn btn-default" data-toggle="tooltip" data-placement="left" title="Tooltip on left">Tooltip on left</button>
	</div>
</body>
</html>