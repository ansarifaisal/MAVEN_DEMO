<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/productByCategory.js" type="text/javascript"></script>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div ng-app="myApp" ng-cloak>
	<div ng-controller="ProductByCategory">
		<nav class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<li><a><strong>Sort By:</strong></a></li>
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
		</nav>
		<div ng-repeat="product in products | filter:searchText">
			<div class="thumbnail thumbnail-setting col-md-3 col-sm-3 col-xs-3">
				<a ng-href="${contextPath}/product/{{product.id}}"><img
					alt="#image" ng-src="${images}/product/{{product.id}}.png"
					class="img-resize zoom" /></a>
				<div class="caption">
					<p>
						<a ng-href="${contextPath}/product/{{product.id}}">{{product.productName}}</a>
					</p>
					<h6 class="text-muted price">Now at &#8377;{{product.price}}</h6>
					<div class="row nopadding nomargin">
						<sec:authorize access="hasAuthority('USER')">
							<div class="text-left col-md-6 nopadding nomargin">
								<a ng-href="${contextPath}/user/wishlist/add/{{product.id}}"
									class="btn btn-default"><span
									class="glyphicon glyphicon-heart"></span></a>
							</div>
							<div class="col-md-offset-9 ">
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
