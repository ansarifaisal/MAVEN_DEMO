package com.niit.ecom.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Product;


@Repository("cartItemDAO")
public class CartItemDAOImpl implements CartItemDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private CartItem cartItem;
	
	@Autowired
	private Product product;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CartItemDAO cartDAO;

	@Override
	@Transactional
	public List<CartItem> list(int cartId) {
		String hql = "FROM CART_ITEMS WHERE cart_id = :id";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("id", cartId);
		return query.list();
	}

	@Override
	@Transactional
	public boolean addCartItem(CartItem cartItem) {
		try {
			sessionFactory.getCurrentSession().save(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deleteCartItem(CartItem cartItem) {
		try {
			sessionFactory.getCurrentSession().delete(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean updateCartItem(CartItem cartItem) {
		try {
			sessionFactory.getCurrentSession().update(cartItem);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public CartItem get(int id) {
		return (CartItem) sessionFactory.getCurrentSession().get(CartItem.class, id);
	}

	@Override
	@Transactional
	public double updateCart(int id) {
		cartItem = cartDAO.get(id);
		product = productDAO.get(cartItem.getId());
		int quantity = product.getQuantity();
		return 0;
	}

}
