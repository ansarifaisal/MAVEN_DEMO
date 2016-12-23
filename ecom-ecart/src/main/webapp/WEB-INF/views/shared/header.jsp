<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextPath}/">E-Cart</a>
		</div>
		<div class="collapse navbar-collapse" id="collapse-1">
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">
								<span class="glyphicon glyphicon-search" id="btn-search"
									aria-hidden="true"></span>
							</button>
						</span>
					</div>
				</div>
			</form>
			<ul class="nav navbar-nav">
				<li><a href="${contextPath}/cart"><span
						class="glyphicon glyphicon-shopping-cart"></span> Cart <span
						class="badge">1</span></a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li id="about"><a href="${contextPath}/product/all">All Products</a></li>
				<li id="about"><a href="${contextPath}/about">About Us</a></li>
				<li id="contact"><a href="${contextPath}/contact">Contact
						Us</a></li>
				<li id="login"><a href="${contextPath}/login"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
				<li id="register"><a href="${contextPath}/register"><span
						class="glyphicon glyphicon-log-in"></span> Sign Up</a></li>
				<li class="dropdown"><a href="#admin" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Admin<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#allproducts">All Products</a></li>
						<li><a href="#allsuppliers">All Suppliers</a></li>
						<li class="divider" role="separator"></li>
						<li><a href="#addproduct">Add Product</a></li>
						<li><a href="#addsupplier">Add Supplier</a></li>
						<li class="divider" role="separator"></li>
						<li><a href="#logout">Logout</a>
					</ul></li>
				<li class="dropdown"><a href="#user" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span class="glyphicon glyphicon-user"></span>
						User<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#allproducts">Profile</a></li>
						<li><a href="#allsuppliers">Wish List</a></li>
						<li class="divider" role="separator"></li>
						<li><a href="#addproduct">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>