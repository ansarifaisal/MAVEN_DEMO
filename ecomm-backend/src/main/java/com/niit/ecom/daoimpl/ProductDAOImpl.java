package com.niit.ecom.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	List<Product> products;
	
	public ProductDAOImpl() {
		products = new ArrayList<>();
		products.add(new Product(1,2000,"Mobile"));
		products.add(new Product(2,7000,"TVs"));
		products.add(new Product(3,10000,"Mobile"));
	}
	@Override
	public Product get(int id) {
		for(Product product : products){
			if(product.getId() == id){
				return product;
			}
		}
		return null;
	}

	@Override
	public List<Product> list() {
		return products;
	}

	@Override
	public double price(int id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
