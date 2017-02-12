var angularModule = angular.module("myApp", []);

angularModule.controller('SearchProduct', [ '$http', '$scope',
		function($http, $scope) {
			$scope.$watch('keywords', function(){
				$scope.$emit('LOAD');
				$http.get('/ecom-ecart/data/product/searchProduct?keywords='+$scope.keywords).then(function(response) {
					$scope.products = response.data;
					$scope.$emit('UNLOAD');
				}, function(error) {
					console.log(error);
				});	
			});
			
		} ]);

angularModule.run(function($rootScope){
	
	$rootScope.$on('LOAD', function(){
		$rootScope.loading = true;
	});
	
	$rootScope.$on('UNLOAD', function(){
		$rootScope.loading = false;
	});
	
});