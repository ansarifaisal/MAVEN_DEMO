package com.niit.ecom.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.User;

@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {

	@Autowired
	User user;

	@Autowired
	UserDAO userDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartItemDAO cartItemDAO;

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public Cart get(int cartId) {
		return (Cart) sessionFactory.getCurrentSession().get(Cart.class, cartId);
	}


	@Override
	@Transactional
	public void updateCartAgain(Cart cart) {
		int grandTotal = 0;
		List<CartItem> listOfCartItems = cartItemDAO.list(cart.getCartId());
		cart.setNumberOfCartItems(listOfCartItems.size());
		for (CartItem cartItem : listOfCartItems) {
			grandTotal = grandTotal + cartItem.getTotalPrice();
		}
		cart.setGrandTotal(grandTotal);
	}
	
	@Override
	@Transactional
	public boolean updateCart(Cart cart) {
		try {
			sessionFactory.getCurrentSession().update(cart);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
}
