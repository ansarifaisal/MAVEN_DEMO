<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Delivery Address</div>
		</div>
		<div class="panel-body">
			<c:forEach items="${addresses}" var="address">
				<div class=" col-md-3 col-sm-12 col-xs-12">
					<div class="thumbnail nopadding default-border">
						<div class="well no-bottom-margin">
							<div class="caption">
								<address>
									<Strong>${address.firstName} ${address.lastName}</Strong><br>
									${address.lineOne },<br> ${address.lineTwo },<br>${address.landmark},<br>${address.city}
									- ${address.pincode}<br> ${address.state}<br> <abbr
										title="Phone">Ph:</abbr> ${address.mobileNumber }
								</address>
								<c:choose>
									<c:when test="${address.defaultAddress == true }">
										<a href="${contextPath}/user/cart/order?add=${address.id}" class="btn btn-primary">Continue</a>
									</c:when>
									<c:otherwise>
										<a href="${contextPath}/user/cart/order?add=${address.id}" class="btn btn-default">Deliver Here</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>