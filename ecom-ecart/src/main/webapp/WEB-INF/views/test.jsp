<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<spring:url value="/resources/images" var="images" />
<spring:url value="/resources/css" var="css" />
<spring:url value="/resources/js" var="js" />
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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

<script type="text/javascript">
	window.hoverMenu = '${title}';
</script>
<script type="text/javascript" src="${js}/jquery.js"></script>
<script type="text/javascript" src="${js}/bootstrap.js"></script>
<script type="text/javascript" src="${js}/jquery.validate.js"></script>
<script type="text/javascript" src="${js}/myScript.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed " data-toggle="collapse"
					data-target="#collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${contextPath}/">E-Cart</a>
			</div>
			<div class="collapse navbar-collapse" id="collapse-1">
				<form class="navbar-form navbar-left searchForm"
					action="${contextPath}/product/searchProduct" method="GET">
					<div class="form-group">
						<div class="input-group validate">
							<input type="text" name="keywords" id="keywords"
								class="form-control" placeholder="Search for products">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit">
									<span class="glyphicon glyphicon-search" id="btn-search"
										aria-hidden="true"></span>
								</button>
							</span>
						</div>
					</div>
				</form>
				<sec:authorize access="hasAuthority('USER')">
					<ul class="nav navbar-nav">
						<li><a href="${contextPath}/user/cart"><span
								class="glyphicon glyphicon-shopping-cart"></span> Cart <span
								class="badge">${noOfCartItem}</span></a></li>
					</ul>
				</sec:authorize>
				<div class="auto-hide">
					<ul class="nav navbar-nav ">
						<li class=""><a>Category <span
								class="glyphicon glyphicon-resize-vertical"></span>
						</a></li>
					</ul>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li id="allProduct"><a href="${contextPath}/product/show/all">All
							Products</a></li>
					<li id="about"><a href="${contextPath}/about">About Us</a></li>
					<li id="contact"><a href="${contextPath}/contact">Contact
							Us</a></li>

					<%-- Display Controls to all the user--%>
					<sec:authorize access="isAnonymous()">
						<li id="login"><a href="${contextPath}/login">Login</a></li>
						<li id="register"><a href="${contextPath}/register">Sign
								Up</a></li>
					</sec:authorize>

					<%-- Display Controls To Admin --%>
					<sec:authorize access="hasAuthority('ADMIN')">
						<li class="dropdown"><a href="#admin" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">${firstName} ${lastName}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<!-- <li><a href="#allproducts">All Products</a></li>
							<li><a href="#allsuppliers">All Sellers</a></li> 
							<li class="divider" role="separator"></li> -->
								<li><a href="${contextPath}/admin/addproduct">Add
										Product</a></li>
								<li><a href="${contextPath}/seller/addseller">Add
										Seller</a></li>
								<li><a href="${contextPath}/admin/addcategory">Add
										Category</a></li>
								<li class="divider" role="separator"></li>
								<li><a href="${contextPath}/logout">Logout</a>
							</ul></li>
					</sec:authorize>

					<%--Display Controls To User --%>
					<sec:authorize access="hasAuthority('USER')">
						<li class="dropdown"><a href="#userPanel"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false">${firstName}
								${lastName}<span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="${contextPath }/user/personalinformation">Account</a></li>
								<li><a href="${contextPath}/user/changepassword">Change
										Password</a></li>
								<li><a href="${contextPath}/user/addresses">Addresses</a></li>
								<li><a href="${contextPath}/user/wishlist/show">Wish
										List</a></li>
								<li><a href="${contextPath}/user/cart/order">Orders</a></li>
								<li class="divider" role="separator"></li>
								<li><a href="${contextPath}/logout">Logout</a></li>
							</ul></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>

	<div class="showNavBar" style="display: none;">
		<nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<button class="navbar-toggle collapsed " data-toggle="collapse"
					data-target="#collapse-2" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">Filter:</a>
			</div>

			<div class="collapse navbar-collapse" id="collapse-2">
				<ul class="nav navbar-nav" id="">
					<li id="sortPriceASC" class="sort"><a href="#"
						ng-click="sortByASC('price')">Price -- Low to High</a></li>
					<li id="sortPriceDESC" class="sort"><a href="#"
						ng-click="sortByDESC('price')">Price -- High to Low</a></li>
					<li id="sortName"><a href="#"
						ng-click="sortByASC('productName')">Name</a></li>
					<li id="sortId"><a href="#" ng-click="sortByDESC('id')">Newest
							First</a></li>
					<li>
						<form class="navbar-form navbar-right">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder="Search For Products"
									ng-model="searchText.productName">
							</div>
						</form>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="test">Hello</div>
</body>
</html>