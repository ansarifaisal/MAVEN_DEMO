///*
// * All Angular Code Will be here
// */
//
//var productData = [
//                   	{
//                   		id:1,
//                   		name:'apple iphone',
//                   		description:'Phone for premium user'
//                   		
//                   	},
//                   	{
//                   		id:2,
//                   		name:'Samsung S7',
//                   		description:'Phone for premium user'
//                   	},
//                   	{
//                   		id:3,
//                   		name:'Micromax Canvas',
//                   		description:'Phone for Average User'
//                   	}
//                   
//                   ];
//
//var app = angular.module("productApp", []);
//app.controller("ProductListController", function(){	
//	var me = this;
//	me.products = productData;
//});
//

var angularModule = angular.module("myApp", []);

angularModule.controller('ProductListController', ['$scope','$http','orderByFilter',function($scope, $http,orderBy) {
	
	// set the property for orderBy
	$scope.propertyName = 'price';
	$scope.reverse = false;
		
	
	$http.get('/ecom-ecart/product/all').then( // success callback
	function(response) {
		// console.log(data);
		$scope.products = orderBy(response.data,$scope.propertyName, $scope.reverse);
	},
	// error callback
	function(error) {
		console.log(error);
	});
	
	
	$scope.sortBy = function(propertyName) {
		console.log('sort called');
		$scope.propertyName = propertyName;
		$scope.reverse = !$scope.reverse;
		//set the reverse
		console.log($scope.reverse);
		
		$scope.products = orderBy($scope.products,$scope.propertyName, $scope.reverse);
		
		
	}
		
	
	
	
	
}]);
