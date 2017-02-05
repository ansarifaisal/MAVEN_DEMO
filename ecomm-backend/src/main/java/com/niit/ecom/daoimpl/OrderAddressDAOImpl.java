package com.niit.ecom.daoimpl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.ecom.dao.OrderAddressDAO;
import com.niit.ecom.entity.OrderAddress;

@Repository("orderAddressDAO")
public class OrderAddressDAOImpl implements OrderAddressDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	
	@Override
	public boolean addAddress(OrderAddress orderAddress) {
	try {
		sessionFactory.getCurrentSession().save(orderAddress);
		return true;
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
	
	}

	
	
}
