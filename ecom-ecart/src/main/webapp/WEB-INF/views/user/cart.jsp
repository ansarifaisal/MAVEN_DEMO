<div class="panel panel-primary">
	<c:choose>
		<c:when test="${not empty cartItems }">
			<div class="panel-heading" style="font-size: 20px;">Cart(${cart.numberOfCartItems})</div>
			<div class="panel-body">

				<c:if test="${!empty successMsg}">
					<div class="alert-msg">
						<div class="alert alert-success" role="alert">
							<strong>${successMsg}</strong>
						</div>
					</div>
				</c:if>
				<c:if test="${!empty failureMsg}">
					<div class="alert-msg">
						<div class="alert alert-danger" role="alert">
							<strong>${failureMsg}</strong>
						</div>
					</div>
				</c:if>

				<table class="table row">
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
								<td class="col-md-7 col-sm-5 col-xs-12">
									<div class="col-md-1 col-sm-1 col-xs-1 nopadding">
										<img src="${images}/product/${cartItem.product.id}.png"
											style="height: 100px; width: 75px; padding-right:20px;">
									</div>
									<div class="col-md-8 col-sm-8 col-xs-8">
										${cartItem.product.productName}<br />
										<div class="text-muted">${cartItem.product.description}</div>
										<div class="text-right">
											<a href="${contextPath}/user/wishlist/move/${cartItem.id}"
												class="btn btn-info">Move To Wishlist</a> <a
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
											<form:input id="${cartItem.id}" path="quantity"
												placeholder="1" class="form-control text-center quantity"
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
						Shopping</a> <a href="${contextPath}/addressList"
						class="btn-lg btn-warning">Place Order</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="panel-body">
				<h3>No Items Present In Cart</h3>
			</div>
		</c:otherwise>
	</c:choose>
</div>
