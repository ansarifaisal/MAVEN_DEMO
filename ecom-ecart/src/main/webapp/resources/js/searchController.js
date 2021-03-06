var angularModule = angular.module("myApp", []);

angularModule.controller('SearchProduct', [
		'$http',
		'$scope',
		'orderByFilter',
		function($http, $scope, orderBy) {
			$scope.$watch('keywords', function() {
				$scope.$emit('LOAD');
				$scope.propertyName = '';
				$scope.reverse = '';
				$http.get(
						'/ecom-ecart/data/product/searchProduct?keywords='
								+ $scope.keywords).then(
						function(response) {
							$scope.products = orderBy(response.data,
									$scope.propertyName, $scope.reverse);
							$scope.$emit('UNLOAD');
						}, function(error) {
							console.log(error);
						});
				$scope.sortByASC = function(propertyName) {
					$scope.propertyName = propertyName;

					$scope.reverse = false;

					$scope.products = orderBy($scope.products,
							$scope.propertyName, $scope.reverse);
				}

				$scope.sortByDESC = function(propertyName) {
					$scope.propertyName = propertyName;

					$scope.reverse = true;

					$scope.products = orderBy($scope.products,
							$scope.propertyName, $scope.reverse);
				}
			});

		} ]);

angularModule.run(function($rootScope) {

	$rootScope.$on('LOAD', function() {
		$rootScope.loading = true;
	});

	$rootScope.$on('UNLOAD', function() {
		$rootScope.loading = false;
	});

});