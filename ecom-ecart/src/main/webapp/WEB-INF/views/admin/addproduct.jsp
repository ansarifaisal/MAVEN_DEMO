<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/productController.js" type="text/javascript"></script>


<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add Product</div>
		</div>
		<div class="panel-body">
			<c:if test="${!empty msg}">
				<div class="alert-msg">
					<div id="success-alert" class="alert alert-success" role="alert">
						<strong>${msg}</strong>
					</div>
				</div>
			</c:if>
			<div class="col-md-offset-3 col-sm-offset-3 col-md-6">
				<form:form method="POST" action="${contextPath}/admin/saveProduct"
					class="form" role="form" modelAttribute="product"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="productName"
							class="control-label label-size text-primary">Name</label>
						<div class="validate">
							<form:input path="productName" class="form-control"
								placeholder="Enter Product Name" value="${product.productName}" />
						</div>
						<div class="validate">
							<form:hidden path="id" class="form-control"
								placeholder="Enter Product Id" value="${product.id}" />
						</div>
					</div>
					<div class="form-group">
						<label for="productPrice"
							class="control-label label-size text-primary">Price</label>
						<div class="validate">
							<form:input path="price" class="form-control"
								placeholder="Enter Product Price" value="${product.price}" />
						</div>
					</div>
					<div class="form-group">
						<label for="productQuantity"
							class="control-label label-size text-primary">Quantity</label>
						<div class="validate">
							<form:input path="quantity" class="form-control"
								placeholder="Enter Product Quantity"
								value="${product.quantity }" />
						</div>
					</div>
					<div class="form-group">
						<label for="productCategory"
							class="control-label label-size text-primary">Category</label>
						<div class="validate">
							<form:select path="categoryId" class="form-control">
								<c:forEach items="${categories}" var="category">
									<form:option value="${category.id}">${category.name}</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>
					<div class="form-group">
						<label for="uploadImage"
							class="control-label label-size text-primary">Upload
							Image</label>
						<div class="validate">
							<form:input path="image" type="file" id="uploadFile" />
						</div>
					</div>
					<div class="form-group">
						<label for="productDescription"
							class="control-label label-size text-primary">Description</label>
						<div class="validate">
							<form:textarea path="description" rows="5" cols="25"
								class="form-control" placeholder="Enter Description"
								value="${product.description}" />
						</div>
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
	<div class="panel">
		<div class="panel-primary">
			<div class="panel-heading">
				<div class="panel-title">Products</div>
			</div>
		</div>
	</div>
	<div ng-app="myApp">
		<div ng-controller="ProductListController">
			<table class="table table-hover" id="no-border">
				<thead>
					<tr>
						<td align="center" colspan="4">
							<form action="" class="form" role="form" id="searchProduct">
								<div class="form-group">
									<div class="validate col-sm-11">
										<input type="text" class="form-control"
											placeholder="Search for products"
											ng-model="searchText.productName">
									</div>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<td><strong>Name</strong></td>
						<td><strong>Price</strong></td>
						<td><strong>Action</strong></td>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="product in products | filter:searchText">
						<td>
							<div class="col-md-1">
								<img alt="{{product.productName}}" src="${images}/product/{{product.id}}.png"
									style="height: 100px; width: 75px;">
							</div>
							<div class="col-md-offset-3"><a ng-href = "${contextPath}/product/{{product.id}}">{{product.productName}}</a></div>
						</td>
						<td>{{product.price }}</td>
						<td><a
							href="${contextPath}/admin/update/product/{{product.id}}"
							class="btn btn-primary" data-toggle="tooltip" title="Edit"><span
								class="glyphicon glyphicon-pencil" style="font-size: 20px;"></span></a>
							<a href="${contextPath}/admin/delete/product/{{product.id}}"
							data-toggle="tooltip" title="Delete" class="btn btn-danger"><span
								class="glyphicon glyphicon-trash" style="font-size: 20px;"></span></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>