package com.niit.ecom.controller;

import java.security.Principal;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.OrderDAO;
import com.niit.ecom.dao.OrderItemDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Order;
import com.niit.ecom.entity.OrderAddress;
import com.niit.ecom.entity.OrderItem;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class OrderController {

	@Autowired
	private Cart cart;

	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private CartItem cartItem;

	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	private Order order;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderItem orderItem;

	@Autowired
	private OrderItemDAO orderItemDAO;

	@Autowired
	private Address address;

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private OrderAddress orderAddress;

	@RequestMapping(value = { "/cart/order" })
	public ModelAndView orders(@RequestParam(name = "add", required = false) int addrId, Principal principal) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		modelAndView.addObject("address", addressDAO.get(addrId));
		modelAndView.addObject("cartItems", user.getCart().getCartItems());
		modelAndView.addObject("cart", user.getCart());
		modelAndView.addObject("title", "OrderSummary");
		modelAndView.addObject("ifUserClickedOrderSummary", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/order/paymentMode" })
	public ModelAndView paymentMode(@ModelAttribute Order order) {
		ModelAndView modelAndView = new ModelAndView("page");
		// modelAndView.addObject("order", new Order());
		modelAndView.addObject("title", "Payment Mode");
		modelAndView.addObject("ifUserClickedPaymentMode", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/order/addOrder" })
	public String addOrder(Principal principal, @ModelAttribute Order order) {
		user = userDAO.getByUserName(principal.getName());
		cart = user.getCart();
		//address = addressDAO.get(id);
		Set<CartItem> cartItems = user.getCart().getCartItems();
		Set<OrderItem> orderItems = new HashSet<>();
		order.setOrderItems(orderItems);
		order.setUser(user);
		order.setNumberOfOrderItems(cart.getNumberOfCartItems());
		order.setGrandTotal(cart.getGrandTotal());
		order.setPaymentMode(order.getPaymentMode());
		orderAddress.setFirstName(address.getFirstName());
		orderAddress.setLastName(address.getLastName());
		orderAddress.setLineOne(address.getLineOne());
		orderAddress.setLineTwo(address.getLineTwo());
		orderAddress.setCity(address.getCity());
		orderAddress.setState(address.getState());
		orderAddress.setCountry(address.getCountry());
		orderAddress.setLandmark(address.getLandmark());
		orderAddress.setMobileNumber(address.getMobileNumber());
		orderAddress.setPincode(address.getPincode());
		order.setOrderAddress(orderAddress);
		orderDAO.addOrder(order);
		for (CartItem cartItem : cartItems) {
			orderItem.setItemPrice(cartItem.getItemPrice());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setOrder(order);
			orderItem.setTotalPrice(cartItem.getTotalPrice());
			orderItem.setOrder(order);
			orderItems.add(orderItem);
			orderItemDAO.addOrderItem(orderItem);
			cartItemDAO.deleteCartItem(cartItem);
		}
		cartDAO.updateCartAgain(cart);
		cartDAO.updateCart(cart);
		return "redirect:/user/cart/order/invoice/" + order.getId();
	}

	@RequestMapping(value = { "/cart/order/confirmOrder" })
	public ModelAndView confirmOrder() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Confirm Order");
		modelAndView.addObject("ifUserClickedConfirmOrder", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/order/invoice/{id}" })
	public ModelAndView invoice(Principal principal, @PathVariable(name = "id", required = false) int id) {
		user = userDAO.getByUserName(principal.getName());
		order = orderDAO.get(id);
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Invoice");
		modelAndView.addObject("orderItems", orderItemDAO.list(id));
		modelAndView.addObject("order", order);
		modelAndView.addObject("address", addressDAO.get(user.getId()));
		modelAndView.addObject("ifUserClickedInvoice", true);
		return modelAndView;
	}

}