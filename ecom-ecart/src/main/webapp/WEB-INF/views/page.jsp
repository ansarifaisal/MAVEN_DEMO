<%-- All the tag will be here --%>
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
<script type="text/javascript">
	window.hoverMenu = '${title}';
</script>
<link href="${css}/bootstrap-paper.css" rel="stylesheet" type="text/css">
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
			<%@include file="user/cart.jsp"%>
		</c:if>
		<%-- Click On Single Product--%>
		<c:if test="${ifUserClickedProduct == true}">
			<%@include file="product.jsp"%>
		</c:if>
		<%-- Search for all products--%>
		<c:if test="${ifUserClickedProductList == true}">
			<%@include file="productList.jsp"%>
		</c:if>
		<%-- if user clicks on Login--%>
		<c:if test="${ifUserClickedLogin == true}">
			<%@include file="login.jsp"%>
		</c:if>
		<%-- if user clicks on Register--%>
		<c:if test="${ifUserClickedRegister == true}">
			<%@include file="register.jsp"%>
		</c:if>

		<%--if user clicks on Personal Information --%>
		<c:if test="${ifUserClickedPersonalInformation == true }">
			<%@include file="user/account.jsp"%>
		</c:if>
		<%--if user clicks on Change Password --%>
		<c:if test="${ifUserClickedChangePassword == true }">
			<%@include file="user/account.jsp"%>
		</c:if>

		<%--if user clicks on Update Mobile And Email--%>
		<c:if test="${ifUserClickedUpdateEmailMobile == true }">
			<%@include file="user/account.jsp"%>
		</c:if>

		<%--if user clicks on Addresses--%>
		<c:if test="${ifUserClickedAddresses == true }">
			<%@include file="user/account.jsp"%>
		</c:if>

		<%--if user clicks on Add Product--%>
		<c:if test="${ifUserClickedAddProduct == true }">
			<%@include file="admin/admin.jsp"%>
		</c:if>

		<%--if user clicks on Add Category--%>
		<c:if test="${ifUserClickedAddCategory == true }">
			<%@include file="admin/admin.jsp"%>
		</c:if>

		<%--if user clicks on Add Supplier--%>
		<c:if test="${ifUserClickedAddSeller == true }">
			<%@include file="admin/admin.jsp"%>
		</c:if>

		<%--if user clicks on Update Category--%>
		<c:if test="${ifUserClickedUpdateCategory == true }">
			<%@include file="admin/admin.jsp"%>
		</c:if>
		
		<%--if user clicks on add seller--%>
		<c:if test="${ifUserClickedUpdateProduct == true }">
			<%@include file="admin/admin.jsp"%>
		</c:if>

	</div>
	<div class="container-fluid">
		<%@include file="./shared/footer.jsp"%>
	</div>


	<script type="text/javascript" src="${js}/jquery.js"></script>
	<script type="text/javascript" src="${js}/bootstrap.js"></script>
	<script type="text/javascript" src="${js}/myScript.js"></script>

</body>
</html>
