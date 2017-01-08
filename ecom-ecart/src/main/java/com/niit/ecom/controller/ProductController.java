package com.niit.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@Controller
@RequestMapping(value = { "/admin" })
public class ProductController {

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	Product product;

	/*
	 * Method to get the add product page
	 */
	@RequestMapping(value = { "/addproduct" })
	public ModelAndView getAddProductPage() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("product", new Product());
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		modelAndView.addObject("title", "Add Product");
		modelAndView.addObject("ifUserClickedAddProduct", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/saveProduct" }, method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute Product product) {
		if (product.getId() == 0) {
			ModelAndView modelAndView = new ModelAndView("page");
			modelAndView.addObject("title", "Save Product");
			productDAO.addProduct(product);
			return "redirect:/admin/addproduct";
		} else {
			ModelAndView modelAndView = new ModelAndView("page");
			modelAndView.addObject("title", "Update Product");
			System.out.println(product);
			productDAO.updateProduct(product);
			return "redirect:/admin/addproduct";
		}
	}

	@RequestMapping(value = { "/delete/product/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Delete Product");
		modelAndView.addObject("ifUserClickedProductDelete", true);
		
		product = productDAO.get(id);
		productDAO.deleteProduct(product);
		return "redirect:/admin/addproduct";
	}

	@RequestMapping(value = { "/update/product/{id}" }, method = RequestMethod.GET)
	public ModelAndView updateProduct(@ModelAttribute Product product) {
		ModelAndView modelAndView = new ModelAndView("page");
		product = productDAO.get(product.getId());
		modelAndView.addObject("product", product);
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		modelAndView.addObject("title", "Update Product");
		modelAndView.addObject("ifUserClickedUpdateProduct", true);
		return modelAndView;
	}
}
