<div class="col-md-4">
	<div class="panel panel-default" style="margin-bottom: 10px;">
		<div class="panel-body">
			<img src="${images}/${product.image}" style="width: 100%; max-height:430px; max-width: 200px; margin-left:50px;">
		</div>
	</div>
	<div class="col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
	<div class="btn btn-warning col-md-5" style="margin-right:30px;"><span class="glyphicon glyphicon-shopping-cart"></span> Add To Cart</div>
	<div class="btn btn-danger col-md-5"><span class="glyphicon glyphicon-heart"></span> Wish List</div>
	</div>
</div>
<div class="panel panel-default col-md-7" style="margin-left: 15px;">
	<div class="panel-body">
		<div class="lead clearfix" style="color:black;"><strong>${product.productName}</strong></div>
		<div class="text-info" style="font-size:20px"><b><strong>&#8377;${product.price}</strong></b></div>
		<hr/>
		<div class="text-muted" style="font-size: 18px;">Description: </div>
		<div style="font-size: 16px;">${product.description}</div>
	</div>
</div>