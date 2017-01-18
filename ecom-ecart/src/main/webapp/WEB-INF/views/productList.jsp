<%-- <div class="row">
	<c:forEach items="${products}" var="product">
		<div class="thumbnail thumbnail-setting col-md-3 col-sm-3 col-xs-3" style="margin-left:15px;">
			<a href="${contextPath}/product/${product.id}"><img alt="#image" src="${images}/product/${product.id}.png"
				class="img-resize zoom" /></a>
			<div class="caption">
					<p><a href="">${product.productName}</a></p>
				<h6 class="text-muted price">Now at &#8377;${product.price}</h6>
			</div>
		</div>
	</c:forEach>
</div>  --%>

<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/productController.js" type="text/javascript"></script>


<div ng-app="myApp" ng-cloak>

<div ng-controller = "ProductListController">
<button ng-click="sortBy('price')">Price</button>
<span ng-show="propertyName==='price'"></span>

	<div ng-repeat="product in products">
		<div class="thumbnail thumbnail-setting col-md-3 col-sm-3 col-xs-3" style="margin-left:15px;">
			<a ng-href="${contextPath}/product/{{product.id}}"><img alt="#image" ng-src="${images}/product/{{product.id}}.png"
				class="img-resize zoom" /></a>
			<div class="caption">
					<p><a ng-href="">{{product.productName}}</a></p>
				<h6 class="text-muted price">Now at &#8377;{{product.price}}</h6>
			</div>
		</div>

	</div>
</div>
</div>
