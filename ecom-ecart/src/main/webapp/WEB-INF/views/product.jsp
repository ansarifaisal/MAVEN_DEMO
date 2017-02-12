<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<div class="col-md-4 col-xs-4">
	<div class="panel panel-default" style="margin-bottom: 10px;">
		<div class="panel-body">
			<img alt = "No Image Available" src="${images}/product/${product.id}.png"
				style="max-height: 100%; max-width: 100%;">
		</div>
	</div>
	<sec:authorize access="hasAuthority('USER')">
		<div class="col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
			<a href="${contextPath}/user/cart/add/${product.id}"
				class="btn btn-warning col-md-5" style="margin-right: 10%;"><span
				class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</a> <a
				href="${contextPath}/user/wishlist/add/${product.id}"
				class="btn btn-danger col-md-5"><span
				class="glyphicon glyphicon-heart"></span> Wish List</a>
		</div>
	</sec:authorize>
	<sec:authorize access="hasAuthority('ADMIN')">
		<div class="col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
			<a href="${contextPath}/admin/update/product/${product.id}"
				class="btn btn-warning col-md-5" style="margin-right: 10%;"><span
				class="glyphicon glyphicon-pencil"></span> Edit </a> <a
				href="${contextPath}/admin/delete/product/${product.id}"
				class="btn btn-danger col-md-5"><span
				class="glyphicon glyphicon-trash"></span> Delete</a>
		</div>
	</sec:authorize>
</div>
<div class="panel panel-default col-md-7" style="margin-left: 15px;">
	<div class="panel-body">
		<div class="lead clearfix" style="color: black;">
			<strong>${product.productName}</strong>
		</div>
		<div class="text-info" style="font-size: 20px">
			<b><strong>&#8377;${product.price}</strong></b>
		</div>
		<hr />
		<div class="text-muted" style="font-size: 18px;">Description:</div>
		<div style="font-size: 16px;">${product.description}</div>
	</div>
</div>