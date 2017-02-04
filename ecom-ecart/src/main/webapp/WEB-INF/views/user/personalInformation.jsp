<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Personal Information</div>
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

		<div class="panel-body col-md-offset-3 col-sm-offset-3">
			<form:form id="information" class="form"
				action="${contextPath}/user/update/personalinformation"
				method="POST" modelAttribute="user">
				<div class="col-md-9 col-sm-9 col-xs-9">
					<label for="firstName" class="text-primary ">First Name</label>
					<div class="form-group validate">
						<form:input path="firstName" class="form-control"
							placeholder="Enter First Name" id="firstName"
							value="${user.firstName}" />
						<form:hidden path="id" value="${user.id}" disable="disable" />
					</div>
					<label for="lastName" class="text-primary ">Last Name</label>
					<div class="form-group validate">
						<form:input path="lastName" class="form-control"
							placeholder="Last Name" id="lastName" value="${user.lastName}" />
					</div>
					<div class="form-group">
						<label for="gender" class="text-primary">Gender</label>
						<div class="validate">
							<div class="gender">
								<select class="form-control" name="gender">
									<c:if test="${user.gender == 'Female' }">
										<option value="${user.gender }">${user.gender }</option>
										<option value="Male">Male</option>
									</c:if>
									<option value="${user.gender }">${user.gender }</option>
									<option value="Female">Female</option>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-4 col-sm-6 col-xs-8 col-md-offset-4 col-sm-offset-4"
							value="Save">
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
