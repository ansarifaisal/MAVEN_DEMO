<script src="${js}/angular.js" type="text/javascript"></script>
<script src="${js}/categoryListController.js" type="text/javascript"></script>

<div class="col-md-9 col-sm-9 col-xs-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="panel-title">Add Category</div>
		</div>
		<div class="panel-body">
			<c:if test="${!empty successMsg}">
				<div class="alert-msg">
					<div id="success-alert" class="alert alert-success" role="alert">
						<strong>${successMsg}</strong>
					</div>
				</div>
			</c:if>
			<div class="col-md-offset-3 col-sm-offset-3 col-md-6">
				<div class="row">
					<form:form method="POST" action="${contextPath}/admin/saveCategory"
						class="form" role="form" modelAttribute="category">
						<div class="form-groups">
							<label for="Name" class="control-label label-size text-primary">Name</label>
							<div class="validate">
								<form:input path="name" class="form-control"
									placeholder="Enter Category Name" value="${category.name}" />
							</div>
							<form:hidden path="id" class="form-control"
								placeholder="Category Id" value="${category.id}" />
						</div>
						<div class="form-groups">
							<label for="Description"
								class="control-label label-size text-primary">Description</label>
							<div class="validate">
								<form:textarea path="description" rows="5" cols="25"
									class="form-control" placeholder="Enter Description"
									value="${category.description}" />
							</div>
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
	<div ng-app="myApp">
		<div ng-controller="test">
			<table class="table table-hover" id="no-border">
				<thead>
					<tr>
						<td align="center" colspan="4">
							<form action="" class="form" role="form" id="searchProduct">
								<div class="form-group">
									<div class="validate col-sm-11">
										<input type="text" class="form-control"
											placeholder="Search for products" ng-model="searchText.name">
									</div>
								</div>
							</form>
						</td>
					</tr>
					<tr>
						<td><strong>Name</strong></td>
						<td><strong>Description</strong></td>
						<td><strong>Action</strong></td>
					</tr>
				</thead>
				<tbody>
				<span ng-show = "loading">Loading Data Please Wait!</span>
					<tr ng-repeat="category in categories | filter:searchText">
						<td><a ng-href="${contextPath}/category/show/{{category.id}}">{{category.name}}</a></td>
						<td>{{category.description}}</td>
						<td><a
							ng-href="${contextPath}/admin/update/category/{{category.id}}"
							class="btn btn-primary" data-toggle="tooltip" title="Edit"> <span
								class="glyphicon glyphicon-pencil" style="font-size: 20px;"></span>
						</a> <a ng-href="${contextPath}/admin/delete/category/{{category.id}}"
							class="btn btn-danger" data-toggle="tooltip" title="Delete">
								<span class="glyphicon glyphicon-trash" style="font-size: 20px;"></span>
						</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
