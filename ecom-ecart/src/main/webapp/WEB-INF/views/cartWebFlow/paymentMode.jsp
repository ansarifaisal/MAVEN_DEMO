<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Payment Mode</div>
	<div class="panel-body">
		<div class="text-center">
			<form:form class="form" action = "${contextPath}/user/cart/order/addOrder" modelAttribute="order">
				<form:radiobutton path="paymentMode" />Debit/Credit Card<br>
				<form:radiobutton path="paymentMode" />Cash On Delievery<br>
				<input type="submit" class="btn btn-primary" value="Proceed">
			</form:form>
		</div>
	</div>
</div>