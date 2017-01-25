package com.niit.testcases;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Product;
import com.niit.ecom.entity.User;

import junit.framework.Assert;

public class CartDAOTestCase {
	
	@Autowired
	AnnotationConfigApplicationContext context;

	@Autowired
	Cart cart;
	
	@Autowired
	CartItemDAO cartItemDAO;
	
	@Autowired
	CartItem cartItem;
	
	@Autowired
	User user;
	
	@Autowired
	UserDAO userDAO;	
	
	@Autowired
	Product product;
	
	@Autowired
	ProductDAO productDAO;
	
	
	public CartDAOTestCase() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();
		cartItemDAO = (CartItemDAO) context.getBean("cartItemDAO");
		cart = (Cart) context.getBean("cart");
		cartItem = (CartItem) context.getBean("cartItem");
		user = (User) context.getBean("user");
		userDAO = (UserDAO) context.getBean("userDAO");
		product = (Product) context.getBean("product");
		productDAO = (ProductDAO) context.getBean("productDAO");
	}
	
	@Test
	public void listCartItem(){
		
		int size = cartItemDAO.list(8).get(0).getId();
		System.out.println(cartItemDAO.list(8).get(0).getId());
		Assert.assertEquals(1, size);
	}
	
	/*@Test
	public void AddCartItem(){
		user = userDAO.getByUserName("ansarifaisal480@gmail.com");
		product = productDAO.get(227);
		Set<CartItem> cartItems = new HashSet<>();
		cartItem.setProduct(product.getId());
		cartItem.setQuantity(1);
		cartItem.setItemPrice(product.getPrice());
		cartItem.setTotalPrice(cartItem.getTotalPrice());
		cartItems.add(cartItem);
		cart.setCartItems(cartItems);
		cart.setNumberOfCartItems(cartItems.size());
		cart.setUser(user);
		cart.setGrandTotal(cart.getGrandTotal());
		cartItem.setCart(cart);
		cartItemDAO.addCartItem(cartItem);
	}*/
	
}
