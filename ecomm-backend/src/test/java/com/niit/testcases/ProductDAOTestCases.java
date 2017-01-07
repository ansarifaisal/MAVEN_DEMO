package com.niit.testcases;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

import junit.framework.Assert;

public class ProductDAOTestCases {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	Product product;
	
	@Autowired
	AnnotationConfigApplicationContext context;
	
	/*
	 * Default Constructor for initialization
	 */
	public ProductDAOTestCases(){
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
		product = (Product) context.getBean("product");
	}
	
	/*
	 *Test to get product by id 
	 */
		@Test
		public void getByIdTest(){
			product = productDAO.get(1);
			Assert.assertEquals("This is valid!",product.getId(), productDAO.get(1).getId());
		}
	/*
	 *Test to get all the product 
	 */
	/*@Test
	public void getAllProductTest(){
		int size = productDAO.list().size();
		Assert.assertEquals(1, size);
	}
	*/
	/*
	 *Test to delete the product 
	 */
	/*@Test
	public void deleteProductTest(){
		product = productDAO.get(2);
		Assert.assertEquals(true, productDAO.deleteProduct(product));
	}*/
	
	
	/*
	 *Test to update the product 
	 */
	
	/*@Test
	public void updateProductTest(){
		product = productDAO.get(1);
		Assert.assertEquals(true, productDAO.updateProduct(product));
	}*/
	/*
	 *Test to add the product 
	 */
	/*@Test
	public void addProductTest(){
		product.setId(2);
		product.setProductName("Motorola G");
		product.setDescription("This is a Smart Phone");
		product.setPrice(23000);
		product.setCategoryId(1);
		product.setQuantity(10);
		Assert.assertEquals(true, productDAO.addProduct(product));
	}*/
}
