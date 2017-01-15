<div class="row">
	<c:forEach items="${products}" var="product">
		<div class="thumbnail thumbnail-setting col-md-3 col-sm-3 col-xs-3" style="margin-left:15px;">
			<a href="${contextPath}/product/${product.id}"><img alt="#image" src="${contextPath}/resources/images/product/${product.id}.png"
				class="img-resize zoom" /></a>
			<div class="caption">
					<p><a href="">${product.productName}</a></p>
				<h6 class="text-muted price">Now at &#8377;${product.price}</h6>
			</div>
		</div>
	</c:forEach>
</div> 
<!--  <script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/productController.js" type="text/javascript"></script>

<div ng-app="productApp">
	<div class="row" ng-controller="ProductListController as pc">
		<div class="col-md-6" ng-repeat="product in pc.products">

			<h1>{{product.id}}</h1>
			<h1>{{product.name}}</h1>
			<h1>{{product.description}}</h1>

		</div>
	</div>
</div>
 -->