package com.niit.ecom.dao;

import com.niit.ecom.entity.Order;

public interface OrderDAO {

	Order get(int orderId);
	boolean addOrder(Order order);
}
