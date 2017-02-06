package com.niit.ecom.webflow;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.OrderAddressDAO;
import com.niit.ecom.dao.OrderDAO;
import com.niit.ecom.dao.OrderItemDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Order;
import com.niit.ecom.entity.OrderAddress;
import com.niit.ecom.entity.OrderBean;
import com.niit.ecom.entity.OrderItem;
import com.niit.ecom.entity.User;

@Component
public class CartFlow {

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private Address address;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private Order order;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderItem orderItem;
	
	@Autowired
	private OrderItemDAO orderItemDAO;

	@Autowired
	private Cart cart;
	
	@Autowired
	private CartDAO cartDAO;
	
	@Autowired
	private CartItemDAO cartItemDAO;
	
	@Autowired
	private CartItem cartItem;
	
	@Autowired
	private OrderAddress orderAddress;
	
	@Autowired
	private OrderAddressDAO orderAddressDAO;
	
	@Autowired
	private OrderBean orderBean;
	

	
	public OrderBean initFlow() {
		user = userDAO.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		orderBean.setCart(user.getCart());
		orderBean.setCartItems(user.getCart().getCartItems());
		orderBean.setAddresses(user.getAddress());
		return orderBean;
	}
	
	public String chooseAddress(OrderBean orderBean, int addressChoosen){
		address = addressDAO.get(addressChoosen);
		orderBean.setAddress(address);
		return "success";
	}
	
	public String choosePayment(OrderBean orderBean){
		
		user = userDAO.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		cart = user.getCart();
		Set<CartItem> cartItems = cart.getCartItems();
		Set<OrderItem> orderItems = new HashSet<>();
		order.setOrderItems(orderItems);
		order.setUser(user);
		order.setNumberOfOrderItems(orderBean.getCart().getNumberOfCartItems());
		order.setGrandTotal(orderBean.getCart().getGrandTotal());
		order.setPaymentMode(orderBean.getPaymentMode());
		orderDAO.addOrder(order);
		orderAddress.setFirstName(orderBean.getAddress().getFirstName());
		orderAddress.setLastName(orderBean.getAddress().getLastName());
		orderAddress.setLineOne(orderBean.getAddress().getLineOne());
		orderAddress.setLineTwo(orderBean.getAddress().getLineTwo());
		orderAddress.setCity(orderBean.getAddress().getCity());
		orderAddress.setState(orderBean.getAddress().getState());
		orderAddress.setCountry(orderBean.getAddress().getCountry());
		orderAddress.setLandmark(orderBean.getAddress().getLandmark());
		orderAddress.setMobileNumber(orderBean.getAddress().getMobileNumber());
		orderAddress.setPincode(orderBean.getAddress().getPincode());
		orderAddress.setOrder(order);
		orderAddressDAO.addAddress(orderAddress);
		for (CartItem cartItem : cartItems) {
			orderItem.setItemPrice(cartItem.getItemPrice());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setOrder(order);
			orderItem.setTotalPrice(cartItem.getTotalPrice());
			orderItem.setOrder(order);
			orderItems.add(orderItem);
			orderItemDAO.addOrderItem(orderItem);
			cartItemDAO.deleteCartItem(cartItem);
		}
		cartDAO.updateCartAgain(cart);
		cartDAO.updateCart(cart);		
		return "success";
	}
	
}
