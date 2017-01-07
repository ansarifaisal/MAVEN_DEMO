<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add Product</div>
		</div>
		<div class="panel-body">
			<div class="col-md-offset-3 col-sm-offset-3 col-md-6">
				<form class="form" role="form">
					<div class="form-groups">
						<label for="productName"
							class="control-label label-size text-primary">Name</label> <input
							type="text" class="form-control" name="productName"
							id="productName" placeholder="Enter Product Name"> <input
							type="hidden" class="form-control" name="productId"
							id="productId" placeholder="Enter Product Id">
					</div>
					<div class="form-groups">
						<label for="productPrice"
							class="control-label label-size text-primary">Price</label> <input
							type="text" class="form-control" name="productPrice"
							id="productPrice" placeholder="Enter Product Price">
					</div>
					<div class="form-groups">
						<label for="productQuantity"
							class="control-label label-size text-primary">Quantity</label> <input
							type="text" class="form-control" name="productQuantity"
							id="productQuantity" placeholder="Enter Product Quantity">
					</div>
					<div class="form-groups">
						<label for="productCategory"
							class="control-label label-size text-primary">Category</label>
							 <select class="form-control">
							<option>Mobile</option>
						</select>
					</div>
					<div class="form-groups">
						<label for="productDescription"
							class="control-label label-size text-primary">Description</label>
						<textarea rows="5" cols="25" class="form-control"
							placeholder="Enter Description"></textarea>
					</div>
					<br>
					<div class="form-groups">
						<input type="submit"
							class="btn btn-primary col-md-5 col-sm-5 col-xs-5 col-md-offset-3 col-sm-offset-3 col-xs-offset-3"
							value="Save"><br>
					</div>
				</form>
				<hr>
				<form class="form-inline" role="form">
					<div class="form-groups">
							<input type="text" class="form-control" name="productName"
								id="productName" placeholder="Enter Product Name">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search" id="btn-search"
								aria-hidden="true"></span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>