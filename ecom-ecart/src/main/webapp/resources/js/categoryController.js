var angularModule = angular.module("myApp", []);

angularModule.controller('CategoryListController', [ '$scope', '$http',
		function($scope, $http) {
			$http.get('/ecom-ecart/category/all').then(function(response) {
				$scope.categories = response.data;
			}, function(error) {
				console.log(error);
			});
		} ]);