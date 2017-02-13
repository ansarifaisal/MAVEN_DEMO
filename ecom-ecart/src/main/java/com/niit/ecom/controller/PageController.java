package com.niit.ecom.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Category;
import com.niit.ecom.entity.User;

@Controller
public class PageController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;

	/*
	 * to access index page
	 */
	@RequestMapping(value = { "/", "home", "index", "default" })
	public ModelAndView index(@RequestParam(name = "status", required = false) String status, Principal principal) {
		ModelAndView modelAndView = new ModelAndView("page");
		List<Category> categories = categoryDAO.list();
		modelAndView.addObject("title", "Home");
		modelAndView.addObject("ifUserClickedHome", true);
		modelAndView.addObject("products", productDAO.list());
		modelAndView.addObject("categoriesList", categories);
		httpSession.setAttribute("categories", categories);
		if (principal != null) {
			user = userDAO.getByUserName(principal.getName());
			httpSession.setAttribute("firstName", user.getFirstName());
			httpSession.setAttribute("lastName", user.getLastName());
			List<CartItem> cartItems = cartItemDAO.list(user.getCart().getCartId());
			if (cartItems != null) {
				httpSession.setAttribute("noOfCartItem", cartItems.size());
			}
		}
		if (status != null) {
			if (status.equals("success")) {
				modelAndView.addObject("msg", "You Have Successfully Logged In");
			}
		}
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
	 * to access single product
	 */
	@RequestMapping(value = { "/product/{id}" })
	public ModelAndView product(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Product");
		modelAndView.addObject("product", productDAO.get(id));
		modelAndView.addObject("ifUserClickedProduct", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/product/show/all" })
	public ModelAndView productList() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "All Products");
		modelAndView.addObject("ifUserClickedListProducts", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/product/category/show/{id}" })
	public ModelAndView productByCategory(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Category");
		modelAndView.addObject("categoryId", id);
		modelAndView.addObject("ifUserClickedViewCategory", true);
		return modelAndView;
	}

	/*
	 * to access Login Page
	 */
	@RequestMapping(value = { "/login" })
	public ModelAndView login(@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Login");
		modelAndView.addObject("ifUserClickedLogin", true);
		if (status != null) {
			if (status.equals("error")) {
				modelAndView.addObject("msg", "Oops! Invalid Credentials");
			}
		}
		return modelAndView;
	}

	/*
	 * Search For Product
	 */

	@RequestMapping(value = { "/product/searchProduct" }, method = RequestMethod.GET)
	public ModelAndView searchProduct(@RequestParam(value = "keywords", required = false) String keywords) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Search Product");
		modelAndView.addObject("keywords", keywords);
		modelAndView.addObject("ifUserClickedProductSearch", true);

		return modelAndView;
	}

	/*
	 * Confirm Registration Page
	 */

	@RequestMapping(value = { "/confirmRegistration" })
	public ModelAndView confrimRegistration() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Confirm Registration");
		modelAndView.addObject("ifUserClickedConfirmRegistration", true);
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
