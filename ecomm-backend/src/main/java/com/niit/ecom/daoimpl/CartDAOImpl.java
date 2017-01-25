package com.niit.ecom.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Cart;
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
	SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public Cart get(int userId) {
		user = userDAO.getUser(userId);
		int cartId = user.getCart().getCartId();
		return (Cart) sessionFactory.getCurrentSession().get(Cart.class, cartId);
	}

}
