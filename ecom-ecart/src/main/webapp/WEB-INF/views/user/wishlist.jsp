<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-body">
		<c:forEach items="${items }" var="item">
			<div class="col-md-2" style="padding: 0px;">
				<img alt="${item.product.productName}"
					src="${images}/product/${item.product.id}.png"
					style="height: 150px; width: 75px;">
			</div>
			<a href="${contextPath}/product/${item.product.id}"><span
				class="lead">${item.product.productName}</span></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="lead text-right"> <strong>&#8377;${item.product.price }</strong>
			</span>
			<a href="" class="btn btn-info">Move To Cart</a>
			<a href="" class="btn btn-danger">Delete</a>
		</c:forEach>
	</div>
</div>