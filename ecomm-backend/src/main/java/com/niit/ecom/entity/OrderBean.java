package com.niit.ecom.entity;

import java.io.Serializable;
import java.util.Set;

import org.springframework.stereotype.Component;

@Component
public class OrderBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * Private Fields
	 */

	private Set<Address> addresses;
	private Address address;

	private OrderAddress orderAddress;
	private Cart cart;
	private Set<CartItem> cartItems;
	private Order order;
	private Set<OrderItem> orderItems;

	/*
	 * Getter And Setters / Accessors And Mutators
	 */

	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	public OrderAddress getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(OrderAddress orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Set<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	/*
	 * Overriding toString Method For Debugging
	 */

	@Override
	public String toString() {
		return "OrderBean [addresses=" + addresses + ", address=" + address + ", orderAddress=" + orderAddress
				+ ", cart=" + cart + ", cartItems=" + cartItems + ", order=" + order + ", orderItems=" + orderItems
				+ "]";
	}
}
