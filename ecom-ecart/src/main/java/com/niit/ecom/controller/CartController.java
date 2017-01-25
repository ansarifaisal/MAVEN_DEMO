package com.niit.ecom.controller;

import java.security.Principal;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.dao.UserDAO;
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
	
	/*
	 * to access cart page
	 */
	@RequestMapping(value = { "/cart" })
	public ModelAndView cart() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Cart");
		modelAndView.addObject("ifUserClickedCart", true);
		return modelAndView;
	}
	
	@RequestMapping(value = {"/cart/add/{id}"})
	public String addCart(@PathVariable (name = "id") int id, Principal principal){
		user = userDAO.getByUserName(principal.getName());
		product = productDAO.get(id);
		Set<CartItem> cartItems = null;
		if(cart == null){
			cart = new Cart();
		}else{
			cart = cartDAO.get(user.getId());
		}
		if(product.getQuantity() != 0){
			cartItem.setProduct(product.getId());
			cartItem.setQuantity(1);
			cartItem.setItemPrice(product.getPrice());
			cartItem.setTotalPrice(cartItem.getTotalPrice());
			cartItems = new HashSet<>();
			cartItems.add(cartItem);
			cart.setCartItems(cartItems);
			cart.setNumberOfCartItems(cartItemDAO.list(cart.getCartId()).size()+1);
			System.out.println(cartItems.size());
			cart.setUser(user);
			cart.setGrandTotal(cart.getGrandTotal());
			cartItem.setCart(cart);
			cartItemDAO.addCartItem(cartItem);
			
		}
		return "redirect:/user/cart";
	}
	
	
	
}
