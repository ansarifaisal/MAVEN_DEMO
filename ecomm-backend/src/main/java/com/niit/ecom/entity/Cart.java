package com.niit.ecom.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import org.springframework.stereotype.Component;

@Entity(name = "CART")
@Component
public class Cart implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9040549300465623839L;

	/*
	 * Declaring Private Fields
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CART_ID")
	private int cartId;

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	@PrimaryKeyJoinColumn(name = "CART_ITEM_ID")
	private Set<CartItem> cartItems;

	@Column(name = "GRAND_TOTAL")
	private int grandTotal;

	@Column(name = "NO_OF_CART_ITEMS")
	private int numberOfCartItems;

	@OneToOne
	@JoinColumn(name = "USER_ID")
	private User user;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public Set<CartItem> getCartItems() {
		return getAcctualCartItem(cartItems);
	}

	public void setCartItems(Set<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public int getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(int grandTotal) {
		this.grandTotal = grandTotal;
	}

	public int getNumberOfCartItems() {
		return numberOfCartItems;
	}

	public void setNumberOfCartItems(int numberOfCartItems) {
		this.numberOfCartItems = numberOfCartItems;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*
	 * Filtering CartItems
	 */
	public Set<CartItem> getAcctualCartItem(Set<CartItem> cartItems) {
		Set<CartItem> acctualCartItems = cartItems;
		Set<CartItem> items = new HashSet<>();
		for (CartItem item : acctualCartItems) {
			if (item.isWishList() == false) {
				items.add(item);
			}
		}
		return items;
	}
}
