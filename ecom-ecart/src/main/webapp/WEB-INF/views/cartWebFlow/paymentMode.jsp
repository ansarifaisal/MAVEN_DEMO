<div class="panel panel-primary">
	<div class="panel-heading" style="font-size: 15px;">Payment Mode</div>
	<div class="panel-body">
		<div class="text-center">
			<form:form class="form" action = "${contextPath}/user/cart/order/addOrder" modelAttribute="order">
				<form:radiobutton path="paymentMode" value = "Debit/Credit Card"/>Debit/Credit Card<br>
				<form:radiobutton path="paymentMode" value = "Cash On Delievery" />Cash On Delievery<br>
				<input type="submit" class="btn btn-primary" value="Proceed">
			</form:form>
		</div>
	</div>
</div>