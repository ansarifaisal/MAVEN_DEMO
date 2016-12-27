
<div class="panel panel-primary">

	<div class="panel-heading" style="font-size: 20px;">Cart(0)</div>

	<div class="panel-body">
		<div class="table-responsive">
			<table border="1" class="table">
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
					<tr>
						<%--item column --%>
						<td class="col-md-7">
							<div class="col-md-1" style="padding: 0px;">
								<img src="${images}/moto.jpeg"
									style="height: 100px; width: 50px;">
							</div>
							<div class="col-md-11">
								SAMSUNG SM-G610FZDGINS Galaxy On Nxt Gold<br />
								<div class="text-muted">Lorem Ipsum is simply dummy text
									of the printing and typesetting industry. Lorem Ipsum has been
									the industry's standard dummy text ever since the 1500s, when
									an unknown printer took a galley of type and scrambled it to
									make a type specimen book.</div>
								<div class="text-right">
									<input type="submit" class="btn btn-info"
										value="Move To Wishlist"
										onclick="window.location=${contextPath}/"> <input
										type="submit" class="btn btn-danger" value="Remove"
										onclick="window.location=${contextPath}/">
								</div>
							</div>
						</td>
						<%--item column Ends here --%>

						<%-- QTY Column Starts Here--%>
						<td>
							<form method="post">
								<div class="form-group">
									<input type="text" placeholder="1"
										class="form-control text-center" style="max-width: 30px;">
								</div>
							</form>
						</td>
						<%-- QTY Column Ends Here--%>
						<%--Price Column Starts Here --%>
						<td>
							<div style="font-color: black; font-size: 16px;">
								&#8377;123</div>
						</td>
						<%--Price Column Starts Here --%>
						<td>
							<div class="text-info" style="font-weight: bold;">Free</div>
						</td>
						<td>
							<div
								style="font-color: black; font-weight: bold; font-size: 16px;">
								&#8377;123</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%--End of table-responsive --%>

		<%-- <div class="panel-body">
		<div class="text-center text-danger" style="font-size:20px; font-weight: bold;">
		<img src="${images}/cart_empty.png" alt="cart" style="height:200px; width:200px;"><br><br>
			There is no items in this cart.<br><br>
			<input type="submit" class="btn btn-primary" value="< Continue Shopping"
			onclick="window.location='${contextPath}/'">
		</div>			
	</div>
 --%>
		<div class="text-right well" style="margin-top: -20px; font-size:25px;">Amount
			Payable: &ensp;&#8377;123</div>
		<div class="text-right">
			<input type="submit" class="btn-lg btn-default" value="< Continue Shopping">
			<input type="submit" class="btn-lg btn-warning" value="Place Order">
		</div>
	</div>

</div>


