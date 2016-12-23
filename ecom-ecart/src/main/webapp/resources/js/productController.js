/*
 * All Angular Code Will be here
 */

var productData = [
                   	{
                   		id:1,
                   		name:'apple iphone',
                   		description:'Phone for premium user'
                   		
                   	},
                   	{
                   		id:2,
                   		name:'Samsung S7',
                   		description:'Phone for premium user'
                   	},
                   	{
                   		id:3,
                   		name:'Micromax Canvas',
                   		description:'Phone for Average User'
                   	}
                   
                   ];

var app = angular.module("productApp", []);
app.controller("ProductListController", function(){	
	var me = this;
	me.products = productData;
});