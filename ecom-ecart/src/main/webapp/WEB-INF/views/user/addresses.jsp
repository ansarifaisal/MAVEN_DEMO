<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add New Address</div>
		</div>
		<div class="panel-body ">
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

			<div class="col-md-offset-2 col-sm-offset-2">
				<form:form action="${contextPath}/user/address/save" class="form"
					role="form" modelAttribute="address" method="POST">
					<div class="form-group">
						<label for="firstName" class="control-label text-primary">First
							Name</label>
						<form:input path="firstName" class="form-control"
							placeholder="Enter Name" id="firstName"
							value="${address.firstName }" />
						<form:hidden path="id" class="form-control" value="${address.id} " />
						<form:hidden path="userId" value="${user.id}" class="form-control" />
					</div>

					<div class="form-group">
						<label for="lastName" class="control-label text-primary">Last
							Name</label>
						<form:input path="lastName" class="form-control"
							placeholder="Enter Name" value="${address.lastName }" />
					</div>
					<div class="form-group">
						<label for="lineOne" class="control-label text-primary"
							id="label-text-area">Address Line 1</label>
						<form:input path="lineOne" class="form-control"
							placeholder="Enter Address Line 1" value="${address.lineOne }" />
					</div>
					<div class="form-group">
						<label for="lineTwo" class="control-label text-primary"
							id="label-text-area">Address Line 2</label>
						<form:input path="lineTwo" class="form-control"
							placeholder="Enter Address Line 2" value="${address.lineTwo}" />
					</div>
					<div class="form-group">
						<label for="landmark" class="control-label text-primary">Landmark</label>
						<form:input path="landmark" class="form-control" id="landmark"
							placeholder="Enter Landmark" value="${address.landmark}" />
					</div>
					<div class="form-group">
						<label for="city" class="control-label text-primary">City</label>
						<form:input path="city" class="form-control" id="city"
							placeholder="Enter City" value="${address.city}" />
					</div>
					<div class="form-group">
						<label for="state" class="control-label text-primary">State</label>
						<form:input path="state" class="form-control" id="state"
							placeholder="Enter State" value="${address.state}" />
					</div>
					<div class="form-group">
						<label for="pincode" class="control-label text-primary">Pincode</label>
						<form:input path="pincode" class="form-control" id="pincode"
							placeholder="Enter Pincode" value="${address.pincode }" />
					</div>
					<div class="form-group">
						<label for="country" class="control-label text-primary">Country</label>
						<form:input path="country" class="form-control" id="country"
							placeholder="Enter Pincode" value="India" readonly="readonly" />
					</div>

					<div class="form-group">
						<label for="mobileNumber" class="control-label text-primary">Phone
							Number</label>
						<form:input path="mobileNumber" class="form-control"
							id="phoneNumber" placeholder="Enter Phone Number"
							value="${address.mobileNumber }" />
					</div>

					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-offset-3 col-sm-offset-3"
							id="saveAddress" value="Add Address">
					</div>
				</form:form>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h6>
					<strong>Your Saved Address</strong>
				</h6>
			</div>
			<div class=" col-md-4 col-sm-12 col-xs-12">
				<div class="thumbnail nopadding">
					<div class="well no-bottom-margin">
						<div class="caption">
							<address>
								<Strong>Ansari Faisal</Strong><br> Plot No. 6, Line. N,
								Room No. 2, Baiganwadi,<br> Govandi Road No. 7, Near
								Govandi Nursing Home<br> Mumbai - 400043<br> <abbr
									title="Phone">Ph:</abbr> (123) 456-7890
							</address>
							<input type="radio" name="default" id="default">Default
							Address<br> <a href="#edit">Edit</a> | <a href="#delete">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<div class=" col-md-4 col-sm-12 col-xs-12">
				<div class="thumbnail  nopadding">
					<div class="well no-bottom-margin">
						<div class="caption">
							<address>
								<Strong>Ansari Faisal</Strong><br> Plot No. 6, Line. N,
								Room No. 2, Baiganwadi,<br> Govandi Road No. 7, Near
								Govandi Nursing Home<br> Mumbai - 400043<br> <abbr
									title="Phone">Ph:</abbr> (123) 456-7890
							</address>
							<input type="radio" name="default" id="default">Default
							Address<br> <a href="#edit">Edit</a> | <a href="#delete">Delete</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
