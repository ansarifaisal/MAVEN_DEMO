<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/categoryController.js" type="text/javascript"></script>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div ng-app="myApp" ng-cloak>
	<div ng-controller="ProductByCategory"
		ng-init="categoryId = ${categoryId}">
		<nav class="navbar navbar-default">
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
				<ul class="nav navbar-nav">
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
		<div class="preloader" ng-show="loading">
			<img src="${images}/preloader.gif">
		</div>
		<div ng-repeat="product in products | filter:searchText">
			<div class="thumbnail thumbnail-setting col-md-3 col-sm-6 col-xs-12">
				<a ng-href="${contextPath}/product/{{product.id}}"><img
					alt="{{product.productName}}"
					ng-src="${images}/product/{{product.id}}.png"
					class="img-resize zoom" /></a>
				<div class="caption">
					<p>
						<a ng-href="${contextPath}/product/{{product.id}}">{{product.productName}}</a>
					</p>
					<h6 class="text-muted price">Now at &#8377;{{product.price}}</h6>
					<div class="row nopadding nomargin">
						<sec:authorize access="hasAuthority('USER')">
							<div class="text-left col-md-6 col-sm-6 col-xs-6 nopadding nomargin">
								<a ng-href="${contextPath}/user/wishlist/add/{{product.id}}"
									class="btn btn-default"><span
									class="glyphicon glyphicon-heart"></span></a>
							</div>
							<div class="text-right">
								<a ng-href="${contextPath}/user/cart/add/{{product.id}}"
									class="btn btn-default"><span
									class="glyphicon glyphicon-shopping-cart"></span></a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ADMIN')">
							<div class="text-left col-md-6 nopadding nomargin">
								<a ng-href="${contextPath}/admin/update/product/{{product.id}}"
									class="btn btn-default"><span
									class="glyphicon glyphicon-pencil"></span></a>
							</div>
							<div class="col-md-offset-9 ">
								<a ng-href="${contextPath}/admin/delete/product/{{product.id}}"
									class="btn btn-default"><span
									class="glyphicon glyphicon-trash"></span></a>
							</div>
						</sec:authorize>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
