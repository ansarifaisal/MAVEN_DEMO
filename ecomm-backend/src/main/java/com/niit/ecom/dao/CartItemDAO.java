package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.CartItem;

public interface CartItemDAO {
	List<CartItem> list(int id);
	boolean addCartItem(CartItem cartItem);
	boolean deleteCartItem(CartItem cartItem);
	boolean updateCartItem(CartItem cartItem);
	CartItem get(int id);
	CartItem getByProductId(int productId, int cartId);
	boolean existingCartItem(int productId, int cartId);
}
