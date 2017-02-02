package com.niit.ecom.webflow;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.OrderDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Order;
import com.niit.ecom.entity.OrderAddress;
import com.niit.ecom.entity.User;

@Component
public class CartFlow {

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Cart cart;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private CartItem cartItem;

	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	private Order order;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderAddress orderAddress;

	@Autowired
	private Address address;

	@Autowired
	private AddressDAO addressDAO;

	public Address initFlow() {
		user = userDAO.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		List<Address> addresses = addressDAO.list(user.getId());
		for(Address address : addresses){
			address = addressDAO.get(address.getId());
		}
		return address;
	}
}
