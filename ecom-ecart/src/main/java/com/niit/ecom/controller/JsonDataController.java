
package com.niit.ecom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Category;
import com.niit.ecom.entity.Product;

@RestController
public class JsonDataController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	/*
	 * to access all product
	 */
	@RequestMapping(value = { "/product/all" })
	public @ResponseBody List<Product> getAllProduct(){
		return productDAO.list();
	}
	
	@RequestMapping(value = {"/data/category/all"})
	public @ResponseBody List<Category> getAllCategory(){
		return categoryDAO.list();
	}
	
	@RequestMapping(value = {"/data/product/category/{id}"})
	public @ResponseBody List<Product> getProductByCategory(@PathVariable(name = "id", required = false) int categoryId){
		return productDAO.listByCategory(categoryId);
	}
	
	@RequestMapping(value = {"/data/product/searchProduct"})
	public @ResponseBody List<Product> searchProduct(@RequestParam(name = "keywords", required = false) String keywords){
		return productDAO.searchProduct(keywords);
	}
}
