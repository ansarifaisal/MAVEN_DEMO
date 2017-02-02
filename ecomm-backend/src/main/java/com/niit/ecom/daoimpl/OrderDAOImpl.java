package com.niit.ecom.daoimpl;

import org.hibernate.SessionFactory;
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
}