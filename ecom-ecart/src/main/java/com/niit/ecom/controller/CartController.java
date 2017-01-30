package com.niit.ecom.controller;

import java.security.Principal;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Product;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class CartController {

	@Autowired
	Product product;

	@Autowired
	User user;

	@Autowired
	UserDAO userDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	CartItem cartItem;

	@Autowired
	CartItemDAO cartItemDAO;
	
	@Autowired
	Address address;
	
	@Autowired
	AddressDAO addressDAO;

	/*
	 * to access cart page
	 */
	@RequestMapping(value = { "/cart" })
	public ModelAndView cart(Principal principal) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		modelAndView.addObject("cartItem", new CartItem());
		modelAndView.addObject("cartItems", cartItemDAO.list(user.getCart().getCartId()));
		modelAndView.addObject("cart", cartDAO.get(user.getId()));
		modelAndView.addObject("title", "Cart");
		modelAndView.addObject("ifUserClickedCart", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/add/{id}" })
	public String addCart(@PathVariable(name = "id") int id, Principal principal) {
		String url = null;
		user = userDAO.getByUserName(principal.getName());
		product = productDAO.get(id);
		Set<CartItem> cartItems = new HashSet<>();
		if (cart == null) {
			// creating cart if it is not available
			cart = new Cart();
		} else {
			// getting cart if it is available
			cart = cartDAO.get(user.getId());
		}

		// get whether the product is an existing product
		boolean flag = cartItemDAO.existingCartItem(product.getId(), cart.getCartId());

		// if the product is in stock then add product into the cart
		if (product.getQuantity() != 0) {
			// add the product if it is not available in the cart
			if (flag != true) {
				cartItem.setProduct(cartItem.getProduct());
				cartItem.setQuantity(1);
				product.setQuantity(product.getQuantity() - 1);
				cartItem.setItemPrice(product.getPrice());
				cartItem.setTotalPrice(cartItem.getTotalPrice());
				cartItems.add(cartItem);
				cart.setCartItems(cartItems);
				cart.setUser(user);
				cartItem.setCart(cart);
				productDAO.updateProduct(product);
				cartItemDAO.addCartItem(cartItem);
				cartDAO.updateCartAgain(cart);
				cartDAO.updateCart(cart);
				url = "redirect:/user/cart?op=add&status=success";
			} else {
				// if the product is already in the cart then update the
				// quantity
				CartItem existingCartItem = cartItemDAO.getByProductId(product.getId(), cart.getCartId());
				cartItem.setQuantity(existingCartItem.getQuantity() + 1);
				cartItem.setTotalPrice(cartItem.getTotalPrice());
				cartItemDAO.updateCartItem(cartItem);
				product.setQuantity(product.getQuantity() - 1);
				productDAO.updateProduct(product);
				cartDAO.updateCartAgain(cart);
				cartDAO.updateCart(cart);
				url = "redirect:/user/cart?op=add&status=success";
			}
		} else {
			url = "redirect:/user/cart?op=add&status=failure";
		}
		return url;
	}

	@RequestMapping(value = { "/cart/delete/{id}" })
	public String deleteCart(@PathVariable(name = "id", required = false) int id, Principal principal) {
		String url = "";
		user = userDAO.getByUserName(principal.getName());
		if (id != 0) {
			cart = cartDAO.get(user.getId());
			cartItem = cartItemDAO.get(id);
			product = productDAO.get(cartItem.getProduct().getId());
			product.setQuantity(product.getQuantity() + cartItem.getQuantity());
			cartItemDAO.deleteCartItem(cartItem);
			cartDAO.updateCartAgain(cart);
			productDAO.updateProduct(product);
			cartDAO.updateCart(cart);
			url = "redirect:/user/cart?op=delete&status=success";
		} else {
			url = "redirect:/user/cart?op=delete&status=fail";
		}
		return url;
	}

	@RequestMapping(value = { "/cart/update" }, method = RequestMethod.POST)
	public String updateQuantity(@ModelAttribute CartItem cartItem, HttpServletRequest request) {
		int quantity = cartItem.getQuantity();
		cartItem = cartItemDAO.get(cartItem.getId());
		product = productDAO.get(cartItem.getProduct().getId());
		cartItem.setQuantity(quantity);
		cartItem.setTotalPrice(cartItem.getTotalPrice());
		cartItemDAO.updateCartItem(cartItem);
		product.setQuantity(product.getQuantity() - quantity);
		productDAO.updateProduct(product);
		cart = cartDAO.get(user.getId());
		cartDAO.updateCartAgain(cart);
		cartDAO.updateCart(cart);
		return "redirect:/user/cart";
	}
	
	@RequestMapping(value = {"/cart/addressList"})
	public ModelAndView addressList(Principal principal){
		user = userDAO.getByUserName(principal.getName());
		int userId = user.getId();
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Addesses");
		modelAndView.addObject("ifUserClickedAddressList", true);
		modelAndView.addObject("addresses",addressDAO.list(userId));
		return modelAndView;
	}
	
	
}
