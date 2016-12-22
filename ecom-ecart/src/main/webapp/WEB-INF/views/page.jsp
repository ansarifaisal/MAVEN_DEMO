<%-- All the tag will be here --%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>E-Cart - ${title}</title>
<link href="${css}/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${css}/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="${css}/font-awesome.css" rel="stylesheet" type="text/css">
<link href="${css}/app.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
			<%@include file="./shared/header.jsp"%>

			<%-- if user clicks on home --%>
			<c:if test="${ifUserClickedHome==true}">
				<%@include file="index.jsp"%>
			</c:if>
			
				<%-- if user clicks on about us--%>
			<c:if test="${ifUserClickedAbout == true}">
				<%@include file="about.jsp"%>
			</c:if>
			
			<%-- if user clicks on contact us--%>
			<c:if test="${ifUserClickedContact == true}">
				<%@include file="contact.jsp"%>
			</c:if>
			
			<%-- if user clicks on cart--%>
			<c:if test="${ifUserClickedCart == true}">
				<%@include file="cart.jsp"%>
			</c:if>
				<%-- if user clicks on cart--%>
			<c:if test="${ifUserClickedProduct == true}">
				<%@include file="product.jsp"%>
				</c:if>
					<%-- if user clicks on cart--%>
			<c:if test="${ifUserClickedProductList == true}">
				<%@include file="productList.jsp"%>
			</c:if>
		</div>
		
		<%@include file="./shared/footer.jsp"%>
	<script type="text/javascript" src="${js}/jquery.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.js"></script>
	<script type="text/javascript" src="${js}/angular.js"></script>
	<script type="text/javascript" src="${js}/myScript.js"></script>

</body>
</html>
