<div class="row tenpadding">
	<!-- Panel Created with heading -->
	<div class="panel panel-primary col-md-8 col-md-offset-2">
		<div class="panel-heading">
			<h3 class="panel-title">Log In</h3>
		</div>
		<!-- Panel Body Created with padding-top 10px -->
		<div class="panel-body tenpadding">
			<!-- Login Form Started from here -->
			<form id="loginForm" class="col-md-offset-2 col-md-8" role="form">
				<div class="form-group twentypadding">
					<label for="email" class="text-primary">Email Address</label>
					<div class="validate">
						<input type="email" class="form-control" id="email" name="email"
							placeholder="Enter Email Address" required="required">
					</div>
				</div>
				<!-- End of form-group -->

				<div class="form-group tenpadding">
					<label for="password" class="text-primary">Password</label>
					<div class="validate">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Enter Password" required="required">
					</div>
				</div>
				<!-- End of form-group -->

				<div class="form-group col-md-offset-1">
					<div class="checkbox">
						<input type="checkbox">Remember Password
					</div>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-success col-md-3">
						Log In <span class="glyphicon glyphicon-log-in"></span>
					</button>
					<button type="Reset"
						class="btn btn-warning col-md-offset-1 col-md-3">
						Reset <span class="glyphicon glyphicon-repeat"></span>
					</button>
				</div>
				<br> <br> New On E-Cart? <a href="${contextPath}/register">Register</a>
			</form>
			<!-- End of form -->
		</div>
		<!-- End of panel-body -->
	</div>
	<!-- End of panel -->
</div>
<!-- End of row -->