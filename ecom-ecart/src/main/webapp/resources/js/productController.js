var angularModule = angular.module("myApp", []);

angularModule.controller('ProductListController', [
		'$scope',
		'$http',
		'orderByFilter',
		function($scope, $http, orderBy) {

			$scope.$emit('LOAD');
			// set the property for orderBy
			$scope.propertyName = '';
			$scope.reverse = '';

			$http.get('/ecom-ecart/product/all').then(
					// success callback
					function(response) {
						$scope.products = orderBy(response.data,
								$scope.propertyName, $scope.reverse);
						$scope.$emit('UNLOAD');

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

angularModule.run(function($rootScope) {

	$rootScope.$on('LOAD', function() {
		$rootScope.loading = true;
	});

	$rootScope.$on('UNLOAD', function() {
		$rootScope.loading = false;
	});

});