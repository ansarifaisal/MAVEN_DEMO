package com.niit.ecom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@RestController
public class JsonDataController {

	@Autowired
	private ProductDAO productDAO;
	
	
	/*
	 * to access all product
	 */
	@RequestMapping(value = { "/product/all" })
	public @ResponseBody List<Product> getAllProduct(){
		return productDAO.list();
	}
}
