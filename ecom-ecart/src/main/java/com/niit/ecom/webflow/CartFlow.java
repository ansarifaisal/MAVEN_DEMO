package com.niit.ecom.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.OrderBean;
import com.niit.ecom.entity.User;

@Component
public class CartFlow {

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private OrderBean orderBean;

	public OrderBean initFlow() {
		user = userDAO.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		orderBean.setCart(user.getCart());
		orderBean.setCartItems(user.getCart().getCartItems());
		orderBean.setAddresses(user.getAddress());
		return orderBean;
	}
	
}
