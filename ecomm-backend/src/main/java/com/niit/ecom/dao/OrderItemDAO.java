package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.OrderItem;

public interface OrderItemDAO {
	
	List<OrderItem> list(int id);

	boolean addOrderItem(OrderItem orderItem);

	boolean deleteOrderItem(OrderItem orderItem);

	OrderItem get(int id);
}
