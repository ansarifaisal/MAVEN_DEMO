package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.Product;

public interface ProductDAO {
	Product get(int id);
	List<Product> list();
	double price(int id);
	boolean add(Product product);
}
