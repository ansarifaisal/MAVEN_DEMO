<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-body">
		<c:choose>
			<c:when test="${not empty items }">
				<c:forEach items="${items }" var="item">
					<table class="table">
						<tbody>
							<tr>
								<td>
									<div class="col-md-2" style="padding: 0px;">
										<img alt="${item.product.productName}"
											src="${images}/product/${item.product.id}.png"
											style="height: 150px; width: 100px;">
									</div>
								</td>

								<td><a href="${contextPath}/product/${item.product.id}"><span
										class="lead">${item.product.productName}</span></a><br>
									${item.product.description }</td>

								<td>
									<div class="text-right">
										<span class="lead"> <strong>&#8377;${item.product.price }</strong></span><br>
										<br> <a href="${contextPath}/user/cart/move/${item.id}"
											class="btn btn-info">Move To Cart</a><br> <br> <a
											href="${contextPath}/user/cart/delete/${item.id}"
											class="btn btn-danger">Delete</a>
									</div>
								</td>

							</tr>


						</tbody>
					</table>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h3>No Items Present In Your WishList</h3>
			</c:otherwise>
		</c:choose>
	</div>
</div>