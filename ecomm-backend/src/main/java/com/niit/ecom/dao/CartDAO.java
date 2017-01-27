package com.niit.ecom.dao;

import com.niit.ecom.entity.Cart;

public interface CartDAO {

	Cart get(int userId);
	void updateCartAgain(Cart cart);
	boolean updateCart(Cart cart);
}
