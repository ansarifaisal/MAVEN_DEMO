<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/productController.js" type="text/javascript"></script>


<div ng-app="myApp" ng-cloak>
	<div ng-controller="ProductListController">
		<nav class="navbar navbar-default">
			<ul class="nav navbar-nav">
				<li><a><strong>Sort By:</strong></a></li>
				<li id="sortPriceASC" class="sort"><a href="#"
					ng-click="sortByASC('price')">Price -- Low to High</a></li>
				<li id="sortPriceDESC" class="sort"><a href="#"
					ng-click="sortByDESC('price')">Price -- High to Low</a></li>
				<li id="sortName"><a href="#"
					ng-click="sortByASC('productName')">Name</a></li>
				<li id="sortId"><a href="#" ng-click="sortByASC('id')">Newest
						First</a></li>
				<li>
					<form class="navbar-form navbar-right">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Search For Products" ng-model="searchText.productName">
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
						<a ng-href="">{{product.productName}}</a>
					</p>
					<h6 class="text-muted price">Now at &#8377;{{product.price}}</h6>
				</div>
			</div>

		</div>
	</div>
</div>
