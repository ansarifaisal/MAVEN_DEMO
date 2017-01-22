package com.niit.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = { "/user" })
public class CartController {

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
	public String addCart(){
		return "";
	}
	
	
	
}
