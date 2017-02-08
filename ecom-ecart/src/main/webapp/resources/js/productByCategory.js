var angularModule = angular.module("myApp", []);

angularModule.controller('ProductByCategory', [
		'$scope',
		'$http',
		'orderByFilter',
		function($scope, $http, orderBy) {

			// set the property for orderBy
			$scope.propertyName = '';
			$scope.reverse = '';

			$http.get('/ecom-ecart/product/category/show').then(
					// success callback
					function(response) {

						$scope.products = orderBy(response.data,
								$scope.propertyName, $scope.reverse);

					},
					// error callback
					function(error) {
						console.log(error);
					});

			$scope.sortByASC = function(propertyName) {
				$scope.propertyName = propertyName;

				$scope.reverse = false;

				$scope.products = orderBy($scope.products, $scope.propertyName,
						$scope.reverse);
			}

			$scope.sortByDESC = function(propertyName) {
				$scope.propertyName = propertyName;

				$scope.reverse = true;

				$scope.products = orderBy($scope.products, $scope.propertyName,
						$scope.reverse);
			}

		} ]);