<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add New Address</div>
		</div>
		<div class="panel-body ">
			<div class="col-md-offset-2 col-sm-offset-2">
				<form:form class="form" role="form">
					<label for="name" class="control-label text-primary">Name</label>
					<div class="form-group">
					<form:input path="" class="form-control" id="name"
							placeholder="Enter Name" required="required"/>
						<!-- <input type="text" class="form-control" id="name"
							placeholder="Enter Name" required="required"> -->
					</div>

					<label for="lineOne" class="control-label text-primary"
						id="label-text-area">Address Line 1</label>
					<div class="form-group">
					<form:input path = "" class="form-control" name="line1" id="line1"
							placeholder="Enter Address Line 1" required="required"/>
						<!-- <input type="text" class="form-control" name="line1" id="line1"
							placeholder="Enter Address Line 1" required="required"> -->
					</div>

					<label for="lineTwo" class="control-label text-primary"
						id="label-text-area">Address Line 2</label>
					<div class="form-group">
					<form:input path="" class="form-control" name="line2" id="line2"
							placeholder="Enter Address Line 2" required="required"/>
						<!-- <input type="text" class="form-control" name="line2" id="line2"
							placeholder="Enter Address Line 2" required="required"> -->
					</div>

					<label for="landmark" class="control-label text-primary">Landmark</label>

					<div class="form-group">
					<form:input path="" class="form-control" id="landmark"
							placeholder="Enter Landmark" required="required"/>
						<!-- <input type="text" class="form-control" id="landmark"
							placeholder="Enter Landmark" required="required"> -->
					</div>

					<label for="city" class="control-label text-primary">City</label>
					<div class="form-group">
					<form:input path="" class="form-control" id="city"
							placeholder="Enter City" required="required"/>
						<!-- <input type="text" class="form-control" id="city"
							placeholder="Enter City" required="required"> -->
					</div>

					<label for="state" class="control-label text-primary">State</label>
					<div class="form-group">
					<form:input path="" class="form-control" id="state"
							placeholder="Enter State" required="required"/>
						<!-- <input type="text" class="form-control" id="state"
							placeholder="Enter State" required="required"> -->
					</div>

					<label for="pincode" class="control-label text-primary">Pincode</label>
					<div class="form-group">
					<form:input path="" class="form-control" id="pincode"
							placeholder="Enter Pincode" required="required"/>
						<!-- <input type="text" class="form-control" id="pincode"
							placeholder="Enter Pincode" required="required"> -->
					</div>

					<label for="phoneNumber" class="control-label text-primary">Phone
						Number</label>
					<div class="form-group">
					<form:input path="" class="form-control" id="phoneNumber"
							placeholder="Enter Phone Number" required="required"/>
						<!-- <input type="text" class="form-control" id="phoneNumber"
							placeholder="Enter Phone Number" required="required"> -->
					</div>

					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-offset-3 col-sm-offset-3"
							id="saveAddress" value="Add Address">
					</div>
				</form>
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
