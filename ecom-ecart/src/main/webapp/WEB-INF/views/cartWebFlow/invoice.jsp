<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Order Details</div>
	<div class="panel-body">
		<table class="table">
			<tbody>
				<tr>
					<td>
						<table class="table">
							<tbody>
								<tr>
									<td>Order ID:</td>
									<td>${order.id }</td>
								</tr>
								<tr>
									<td>Amount Paid:</td>
									<td><strong>&#8377;${order.grandTotal }</strong></td>
								</tr>
							</tbody>
						</table>
					</td>
					<td>
						<table class="table">
							<tr>
								<td><div class="lead nomargin">${address.firstName}
										${address.lastName}</div></td>
							</tr>
							<tr>

							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Product
		Details</div>
	<div class="panel-body">
		<table class="table">
			<thead>
				<tr>
					<td>ITEM</td>
					<td>QTY</td>
					<td>PRICE</td>
					<td>DELIVERY DETAILS</td>
					<td>SUBTOTAL</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderItems}" var="orderItem">
					<tr>
						<%--item column --%>
						<td class="col-md-7">
							<div class="col-md-1" style="padding: 0px;">
								<img src="${images}/moto.jpeg"
									style="height: 100px; width: 50px;">
							</div>
							<div class="col-md-11">
								${orderItem.product.productName}<br />
								<div class="text-muted">${orderItem.product.description}</div>
							</div>
						</td>
						<td>${orderItem.quantity}</td>
						<td>${orderItem.itemPrice}</td>
						<td><div class="text-info">
								<strong>Free</strong>
							</div></td>
						<td>${orderItem.totalPrice }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-right well"
			style="margin-top: -20px; font-size: 25px;">Total:
			&ensp;&#8377;${order.grandTotal}</div>
	</div>
</div>