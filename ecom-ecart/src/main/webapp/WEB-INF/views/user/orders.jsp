<div class="col-md-12 col-sm-12 col-xs-12">
	<c:choose>
		<c:when test="${not empty orders }">
			<c:forEach items="${orders}" var="order">
				<div class="panel">
					<div class="panel-primary">
						<div class="panel-heading">
							<a href="${contextPath}/user/cart/order/invoice/${order.id}" class="btn btn-default">View Details</a>
						</div>
					</div>
					<div class="panel-body">
						<table class="table">
							<tbody>
								<c:forEach items="${order.orderItems}" var="orderItem">
									<tr>
										<td><div class="col-md-1" style="padding: 0px;">
												<img src="${images}/product/${orderItem.product.id}.png"
													style="height: 100px; width: 50px;"></td>
										<td><strong>${orderItem.product.productName }</strong><br>
											${orderItem.product.description}</td>
										<td><small><span class="text-muted">Quantity
													: ${orderItem.quantity}</span></small></td>
										<td>&#8377;${orderItem.totalPrice}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="4">
										<div class="well nomargin">
											<div class="text-right">
												<strong>Paid: &#8377;${order.grandTotal} <sub>through
														${order.paymentMode}</sub></strong>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="panel">
				<div class="panel-body">
					<h3>No Orders Yet!</h3>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>



