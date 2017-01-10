<div class="row tenpadding">
	<!-- Panel Created with heading -->
	<div class="panel panel-primary col-md-8 col-md-offset-2">
		<div class="panel-heading">
			<h3 class="panel-title">Sign Up</h3>
		</div>
		<!-- Panel Body Created with padding-top 10px -->
		<div class="panel-body .tenpadding">
			<!-- Login Form Started from here -->
			<form id="loginForm" class="col-md-offset-2 col-md-8" role="form">
				<div class="form-groups">
					<div class="col-md-6 col-sm-6 nopadding">
						<label for="firstName" class="text-primary">First Name</label> <input
							type="text" class="form-control" id="firstName" name="firstName"
							placeholder="Enter First Name" required="required">
					</div>
					<div class="col-md-6 col-sm-6">
						<label for="lastName" class="text-primary">Last Name</label> <input
							type="text" class="form-control" id="lastName" name="lastName"
							placeholder="Enter Last Name" required="required">
					</div>
				</div>
				<%-- End of LastName and FirstName --%>
				<div class="form-group tenpadding">
					<label for="email" class="text-primary">Email Address</label> <input
						type="email" class="form-control" id="email" name="email"
						placeholder="Enter Email Address" required="required">
				</div>
				<%--End Of Email Field --%>

				<div class="form-group nopadding">
					<label for="email" class="text-primary">Password</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Enter Password" required="required">
				</div>
				<%-- End of Password Field --%>

				<div class="form-group nopadding">
					<label for="email" class="text-primary">Re-Enter Password</label> <input
						type="password" class="form-control" id="rePassword"
						name="rePassword" placeholder="Re-Enter Password"
						required="required">
				</div>
				<%-- End of Re-Type Password Field --%>

				<div class="form-group">
					<label for="gender" class="text-primary">Gender</label>
					<div class="radio">
						<label class="radio-inline"><input type="radio"
							name="gender" id="male">Male</label> <label class="radio-inline"><input
							type="radio" name="gender" id="female">Female</label>
					</div>
				</div>
				<%--End of Gender Fields --%>
				
					<%-- <div class="form-group">
					<label for="As A" class="text-primary">Gender</label>
					<div class="radio">
						<label class="radio-inline"><input type="radio"
							name="gender" id="male">Male</label> <label class="radio-inline"><input
							type="radio" name="gender" id="female">Female</label>
					</div>
				</div>
				End of Gender Fields
 --%>
				<div class="form-group nopadding">
					<label for="mobileNumber" class="text-primary">Mobile
						Number</label> <input type="text" class="form-control" id="mobileNumber"
						name="mobileNumber" placeholder="Enter Mobile Number"
						required="required">
				</div>
				<%--End of Mobile Number Field --%>

				<div class="form-group col-md-offset-1">
					<div class="checkbox">
						<input type="checkbox"> Agree With The Terms and
						Conditions
					</div>
				</div>
				<%--End of Terms And Condition --%>
				<div class="form-group">
				 	<button type="submit" class="btn btn-success col-md-3">Sign
						Up</button>
					<button type="Reset"
						class="btn btn-warning col-md-offset-1 col-md-3">Reset</button>
				</div>
				<%--End of Submit and reset Button --%>
			</form>
			<!-- End of form -->
		</div>
		<!-- End of panel-body -->
	</div>
	<!-- End of panel -->
</div>
<!-- End of row -->