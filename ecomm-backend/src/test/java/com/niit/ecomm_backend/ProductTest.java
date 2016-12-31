package com.niit.ecomm_backend;


import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

public class ProductTest {
	public static void main(String[] args) {
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();		
		ProductDAO productDAO = (ProductDAO)context.getBean("productDAO");
		
		Product p = new Product();
		p.setName("PQR");
		p.setPrice(1000);
		
		productDAO.add(p);
		
		p = new Product();
		p.setName("XYZ");
		p.setPrice(100);
		
		productDAO.add(p);
		
		context.close();
				
	}
}
