<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add Category</div>
		</div>
		<div class="panel-body">
			<div class="col-md-offset-3 col-sm-offset-3 col-md-6">
				<div class="row">
					<form:form method="POST" action="${contextPath}/admin/saveCategory"
						class="form" role="form" modelAttribute="category">
						<div class="form-groups">
							<label for="categoryName"
								class="control-label label-size text-primary">Name</label>
							<form:input path="name" class="form-control" name="categoryName"
								id="categoryName" placeholder="Enter Category Name" value="${category.name}"/>
							<form:hidden path="id" class="form-control" name="categoryId"
								id="categoryId" placeholder="Category Id" value="${category.id}" />
						</div>
						<div class="form-groups">
							<label for="categoryDescription"
								class="control-label label-size text-primary">Description</label>
							<form:textarea path="description" rows="5" cols="25"
								class="form-control" placeholder="Enter Description" value = "${category.description}"/>
						</div>
						<br>
						<div class="form-groups">
							<input type="submit"
								class="btn btn-primary col-md-5 col-sm-5 col-xs-5 col-md-offset-3 col-sm-offset-3 col-xs-offset-3"
								value="Save">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div class="panel">
		<div class="panel-primary">
			<div class="panel-heading">
				<div class="panel-title">Categories</div>
			</div>
		</div>
	</div>
	<table class="table table-hover" id="no-border">
		<thead>
			<tr>
				<td><strong>Name</strong></td>
				<td><strong>Description</strong></td>
				<td><strong>Action</strong></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${categories}" var="category">
				<tr>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td>
						<button type="submit" class=" btn btn-info"
							onclick="window.location='${contextPath}/admin/update/category/${category.id}';">Edit</button>
						<input type="submit" class="btn btn-danger" value="Remove"
						onclick="window.location='${contextPath}/admin/delete/category/${category.id}';">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
