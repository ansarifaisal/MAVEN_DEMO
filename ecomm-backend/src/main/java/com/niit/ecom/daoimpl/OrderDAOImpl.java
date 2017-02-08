package com.niit.ecom.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.OrderDAO;
import com.niit.ecom.entity.Order;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	Order order;

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	SessionFactory sessionFactory;

	@Override
	@Transactional
	public Order get(int orderId) {
		return (Order) sessionFactory.getCurrentSession().get(Order.class, orderId);
	}

	@Override
	@Transactional
	public boolean addOrder(Order order) {
		boolean status = false;
		try {
			sessionFactory.getCurrentSession().save(order);
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	@Transactional
	public List<Order> list(int userId) {
		String hql = "FROM ORDERS WHERE USER_ID = :userId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("userId", userId);
		return query.list();
	}
}
