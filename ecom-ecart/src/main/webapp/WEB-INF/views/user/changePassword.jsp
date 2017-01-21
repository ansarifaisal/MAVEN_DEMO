<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Change Password</div>
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
		<c:if test="${!empty wrongMsg}">
			<div class="alert-msg">
				<div class="alert alert-info" role="alert">
					<strong>${wrongMsg}</strong>
				</div>
			</div>
		</c:if>

		<div class="panel-body col-md-offset-3 col-sm-offset-3">
			<form:form class="form" role="form" modelAttribute="user"
				method="POST" action = "${contextPath}/user/update/password">
				<div class="col-md-9 col-sm-12 col-xs-12">
					<label for="oldPassword" class="text-primary">Old Password</label>
					<div class="form-group">
						<form:password path = "oldPassword" id="oldPassword"
							class="form-control" placeholder="Enter Old Password"/>
							<form:hidden path="id" value = "${user.id}"/> 
					</div>
					<label for="newPassword " class="text-primary">New Password</label>
					<div class="form-group">
						<form:password path = "password" id="newPassword"
							placeholder="Enter New Password" class="form-control"/>
					</div>
					<label for="reTypeNewPassword" class="text-primary">Re-Type
						New Password</label>

					<div class="form-group">
						<form:password path = "confirmPassword" class="form-control" id="reTypeNewPassword"
							placeholder="Re-Type New Password"/>
					</div>
					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-4 col-sm-4 col-xs-6 col-md-offset-4 col-sm-offset-4 col-xs-offset-4"
							value="Save">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
</div>