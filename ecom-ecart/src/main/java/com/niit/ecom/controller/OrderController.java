package com.niit.ecom.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.OrderDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Order;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class OrderController {

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Order order;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private AddressDAO addressDAO;

	@RequestMapping(value = { "/cart/order" })
	public ModelAndView orders(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		List<Order> orders = orderDAO.list(user.getId());

		modelAndView.addObject("orders", orders);
		modelAndView.addObject("title", "OrderSummary");
		modelAndView.addObject("ifUserClickedOrderSummary", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/order/invoice/{id}" })
	public ModelAndView invoice(Principal principal, @PathVariable(name = "id", required = false) int id) {
		user = userDAO.getByUserName(principal.getName());
		order = orderDAO.get(id);
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Invoice");
		modelAndView.addObject("order", order);
		modelAndView.addObject("address", addressDAO.get(user.getId()));
		modelAndView.addObject("ifUserClickedInvoice", true);
		return modelAndView;
	}

}