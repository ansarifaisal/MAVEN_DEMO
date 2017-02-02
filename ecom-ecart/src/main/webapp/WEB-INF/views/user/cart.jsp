<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 20px;">Cart(${cart.numberOfCartItems})</div>

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
									<input type="submit" class="btn btn-info"
										value="Move To Wishlist"
										onclick="window.location=${contextPath}/"> <a
										href="${contextPath}/user/cart/delete/${cartItem.id}"
										class="btn btn-danger">Remove</a>
								</div>
							</div>
						</td>
						<%--item column Ends here --%>

						<%-- QTY Column Starts Here--%>
						<td><form:form method="POST"
								action="${contextPath}/user/cart/update"
								modelAttribute="cartItem">
								<div class="form-group">
									<form:input id="${cartItem.id}" path="quantity" placeholder="1"
										class="form-control text-center quantity"
										style="max-width: 30px;" value="${cartItem.quantity}" />
									<form:hidden path="id" value="${cartItem.id}" />
									<input type="submit" class="btn btn-primary"
										id="btn_${cartItem.id}" value="save" id="Test"
										style="display: none;">
								</div>
							</form:form></td>
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
			&ensp;&#8377;${cart.grandTotal}</div>
		<div class="text-right">
			<a href="${contextPath}/" class="btn-lg btn-default">< Continue
				Shopping</a> <a href="${contextPath}/addressList" class="btn-lg btn-warning">Place
				Order</a>
		</div>
	</div>

</div>
