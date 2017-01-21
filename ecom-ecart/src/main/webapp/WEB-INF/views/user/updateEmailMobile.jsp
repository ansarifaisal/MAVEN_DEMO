<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Update Email/Mobile</div>
		</div>
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

		<div
			class="panel-body col-md-offset-3 col-sm-offset-3 col-xs-offset-3">
			<form:form action="${contextPath}/user/update/address"
				modelAttribute="user" class="form">
				<div class="col-md-9 col-sm-9 col-xs-9">
					<label for="email" class="text-primary label-size">E-Mail</label>
					<div class="form-group">
						<form:input path="email" class="form-control"
							placeholder="Enter E-Mail"/>
					</div>
					<form:hidden path="id" value="${user.id}" />
					<label for="mobile" class="text-primary label-size">Mobile</label>

					<div class="form-group">
						<form:input path="mobileNumber" class="form-control"
							placeholder="Enter Mobile Number" />
					</div>
					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-4 col-sm-4 col-xs-4 col-md-offset-3 col-sm-offset-3 col-xs-offset-3"
							value="Save">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>