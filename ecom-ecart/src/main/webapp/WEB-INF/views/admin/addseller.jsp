<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add Product</div>
		</div>
		<div class="panel-body">
			<div class="col-md-offset-3 col-sm-offset-3 col-md-6">
				<form:form method="POST" action="${contextPath}/admin/saveProduct"
					class="form" role="form" >
					<div class="form-group">
						<label for="productName"
							class="control-label label-size text-primary">Name</label>
						<form:input path="productName" class="form-control"
							name="productName" id="productName"
							placeholder="Enter Product Name" value="${product.productName}" />
						<form:hidden path="id" class="form-control" name="productId"
							id="productId" placeholder="Enter Product Id"
							value="${product.id}" />
					</div>
					<div class="form-group">
						<label for="productPrice"
							class="control-label label-size text-primary">Price</label>
						<form:input path="price" class="form-control" name="productPrice"
							id="productPrice" placeholder="Enter Product Price"
							value="${product.price}" />
					</div>
					<div class="form-group">
						<label for="productQuantity"
							class="control-label label-size text-primary">Quantity</label>
						<form:input path="quantity" class="form-control"
							name="productQuantity" id="productQuantity"
							placeholder="Enter Product Quantity" value="${product.quantity }" />
					</div>
				<%-- 	<div class="form-group">
						<label for="productCategory"
							class="control-label label-size text-primary">Category</label>
						<form:select path="categoryId" class="form-control">
							<c:forEach items="${categories}" var="category">
								<form:option value="${category.id}">${category.name}</form:option>
							</c:forEach>
						</form:select>
					</div> --%>
					<!-- 	<div class="form-group">
						<label for="uploadImage"
							class="control-label label-size text-primary">Upload
							Image</label> <input type="file" name="uploadImage" id="uploadImage">
					</div> -->
					<div class="form-group">
						<label for="productDescription"
							class="control-label label-size text-primary">Description</label>
						<form:textarea path="description" rows="5" cols="25"
							class="form-control" placeholder="Enter Description"
							value="${product.description}" />
					</div>
					<br>
					<div class="form-group">
						<input type="submit"
							class="btn btn-primary col-md-5 col-sm-5 col-xs-5 col-md-offset-3 col-sm-offset-3 col-xs-offset-3"
							value="Save"><br>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>
