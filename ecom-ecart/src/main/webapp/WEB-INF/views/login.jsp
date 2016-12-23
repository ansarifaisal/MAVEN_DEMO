<div class="row" style="padding-top: 10px;">
<!-- Panel Created with heading -->
	<div class="panel panel-primary col-md-8 col-md-offset-2">
		<div class="panel-heading">
			<h3 class="panel-title">Log In</h3>
		</div>
		<!-- Panel Body Created with padding-top 10px -->
		<div class="panel-body" style="padding-top: 10px;">
		<!-- Login Form Started from here -->
			<form id="loginForm" class="col-md-offset-2 col-md-8" role="form">
				<div class="form-group " style="padding-top:20px;">
					<label for="email" class="text-primary">Email Address</label>
					<input type="email" class="form-control" id="email" name="email"
						placeholder="Enter Email Address" required="required">
				</div>
				<!-- End of form-group -->
				
				<div class="form-group" style="padding-top:10px;">
				<label for="password" class="text-primary">Password</label>
					<input type="password" class="form-control" id="password" name="password"
						placeholder="Enter Password" required="required">
				</div>
				<!-- End of form-group -->
				
				<div class="form-group col-md-offset-1">
					<div class="checkbox">
						<input type="checkbox">Remember Password
					</div>
				</div>
				
				<div class="form-group">
				<button type="submit" class="btn btn-success col-md-3">Log In <span class="glyphicon glyphicon-log-in"></span></button>
				<button type="Reset" class="btn btn-warning col-md-offset-1 col-md-3">Reset <span class="glyphicon glyphicon-repeat"></span></button>
				</div>
				<br><br>
				New On E-Cart? <a href="${contextPath}/register">Register</a>
			</form>
			<!-- End of form -->
		</div>
		<!-- End of panel-body -->
	</div>
	<!-- End of panel -->
</div>
<!-- End of row -->