var angularModule = angular.module("myApp", []);

angularModule.controller('test', [ '$scope', '$http', function($scope, $http) {
	$scope.$emit('LOAD');
	$http.get("/ecom-ecart/data/category/all").then(function(response) {
		$scope.categories = response.data;
		$scope.$emit('UNLOAD');
	}, function(error) {
		console.log(error);
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