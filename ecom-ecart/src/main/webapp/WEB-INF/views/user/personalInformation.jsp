<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Personal Information</div>
		</div>

		<div
			class="panel-body col-md-offset-3 col-sm-offset-3">
			<form:form method="POST" commandName= "user">
				<div class="col-md-9 col-sm-9 col-xs-9">
					<label for="firstName" class="text-primary ">First Name</label>
					<div class="form-group">
						<form:input path="firstName" class="form-control" placeholder="Enter First Name"
							name="firstName" id="firstName" required="required"/>
						<!-- <input type="text" class="form-control" placeholder="Enter First Name"
							name="firstName" id="firstName" required="required"> -->
					</div>
					<label for="lastName" class="text-primary ">Last Name</label>
					<div class="form-group">
						<form:input path="lastName" class="form-control" placeholder="Last Name"
							name="lastName" id="lastName" required="required"/>
						<!-- <input type="text" class="form-control" placeholder="Last Name"
							name="lastName" id="lastName" required="required"> -->
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
