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
<link rel="stylesheet" href="${css}/font-awesome.min.css"
	type="text/css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="thumbnail thumbnail-setting col-md-3">
				<a href=""><img alt="#image" src="${images}/${product.image}"
					class="img-resize zoom" /></a>
				<div class="caption">
					<p>${product.name}</p>
					<h6 class="text-muted price">Now at &#8377;${product.price}</h6>
				</div>
			</div>

			<div class="thumbnail thumbnail-setting col-md-3">
				<a href=""><img alt="#image" src="${images}/${product.image}"
					class="img-resize zoom" /></a>
				<div class="caption">
					<p>${product.name}</p>
					<h6 class="text-muted price">Now at &#8377;${product.price}</h6>
				</div>
			</div>
		</div>
	</div>
</body>
</html>