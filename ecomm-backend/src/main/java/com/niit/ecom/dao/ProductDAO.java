package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.Product;

public interface ProductDAO {
	Product get(int id);
	List<Product> list();
	List<Product> listByCategory(int categoryId);
	List<Product> searchProduct(String keywords);
	boolean addProduct(Product product);
	boolean updateProduct(Product product);
	boolean deleteProduct(Product product);
	Product getByCategory(int categoryId);
	
}
