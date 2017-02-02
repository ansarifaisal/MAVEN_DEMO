<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Delivery
		Address</div>
	<div class="panel-body">
		<div class="col-md-10 col-sm-10 col-xs-10">
			<div class="lead nomargin">
				<strong>${address.firstName} ${address.lastName}</strong>
				&nbsp;${address.mobileNumber}
			</div>
			${address.lineOne}, ${address.lineTwo}, ${address.landmark},
			${address.city}, ${address.state} - ${address.pincode}
		</div>
		<div class="col-md-2 col-sm-2 col-xs-2">
			<a href="${contextPath}/user/cart/addressList"
				class="btn btn-warning">Change Address</a>
		</div>
	</div>
</div>


<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Order Summary</div>
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
				<c:forEach items="${cartItems}" var="cartItem">
					<tr>
						<%--item column --%>
						<td class="col-md-7">
							<div class="col-md-1" style="padding: 0px;">
								<img src="${images}/moto.jpeg"
									style="height: 100px; width: 50px;">
							</div>
							<div class="col-md-11">
								${cartItem.product.productName}<br />
								<div class="text-muted">${cartItem.product.description}</div>
								<div class="text-right">
									<a href="${contextPath}/user/cart/delete/${cartItem.id}"
										class="btn btn-danger">Remove</a>
								</div>
							</div>
						</td>
						<%--item column Ends here --%>

						<%-- QTY Column Starts Here--%>
						<td>${cartItem.quantity}</td>
						<%-- QTY Column Ends Here--%>
						<%--Price Column Starts Here --%>
						<td>
							<div style="font-color: black; font-size: 16px;">&#8377;${cartItem.itemPrice}</div>
						</td>
						<%--Price Column Starts Here --%>
						<td>
							<div class="text-info" style="font-weight: bold;">Free</div>
						</td>
						<td>
							<div
								style="font-color: black; font-weight: bold; font-size: 16px;">
								&#8377;${cartItem.totalPrice }</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-right well"
			style="margin-top: -20px; font-size: 25px;">Amount Payable:
			&nbsp;&#8377;${cart.grandTotal}</div>

		<div class="text-right">
			<a href="${contextPath}/" class="btn-lg btn-default">< Continue
				Shopping</a> <a href="${contextPath}/user/cart/order/paymentMode?add=${address.id}" class="btn-lg btn-warning">Proceed to Pay</a>
		</div>
	</div>
</div>