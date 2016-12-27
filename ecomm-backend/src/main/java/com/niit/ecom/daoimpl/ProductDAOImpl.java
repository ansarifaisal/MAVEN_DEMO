package com.niit.ecom.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	List<Product> products;
	
	public ProductDAOImpl() {
		products = new ArrayList<>();
		products.add(new Product(1,2000,"SAMSUNG Galaxy On Nxt (Gold, 32 GB)", "moto.jpeg"));
		products.add(new Product(2,7000,"TVs", "moto.jpeg"));
		products.add(new Product(3,10000,"Mobile", "moto.jpeg"));
		
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
	
	@Override
	@Transactional
	public boolean add(Product product) {
		
		sessionFactory.getCurrentSession().persist(product);
		
		return true;
	}
}
