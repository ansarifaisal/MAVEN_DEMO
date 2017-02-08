package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.Order;

public interface OrderDAO {

	Order get(int orderId);
	boolean addOrder(Order order);
	List<Order> list(int userId);
}
