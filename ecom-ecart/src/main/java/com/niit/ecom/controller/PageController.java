package com.niit.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.ProductDAO;

@Controller
public class PageController {

	@Autowired
	private ProductDAO productDAO;
	
	/*
	 * to access index page
	 */
	@RequestMapping(value = { "/", "home", "index", "default" })
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Home");
		modelAndView.addObject("ifUserClickedHome", true);
		return modelAndView;
	}

	/*
	 * to access About page
	 */
	@RequestMapping(value = { "/about" })
	public ModelAndView about() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "About Us");
		modelAndView.addObject("ifUserClickedAbout", true);
		return modelAndView;
	}

	/*
	 * to access contact page
	 */
	@RequestMapping(value = { "/contact" })
	public ModelAndView contact() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Contact Us");
		modelAndView.addObject("ifUserClickedContact", true);
		return modelAndView;
	}

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

	/*
	 * to access single product
	 */
	@RequestMapping(value = { "/product/{id}" })
	public ModelAndView product(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Product");
		modelAndView.addObject("id", id);
		modelAndView.addObject("ifUserClickedProduct", true);
		return modelAndView;
	}

	/*
	 * to access all product
	 */
	@RequestMapping(value = { "/product/all" })
	public ModelAndView productList() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "All Products");
		modelAndView.addObject("ifUserClickedProductList", true);
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}

	/*
	 * This page is for test
	 */
	@RequestMapping(value = { "test" })
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("test");
		return mv;
	}
}
