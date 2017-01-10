package com.niit.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	 * flag variable for message
	 */

	boolean flag = false;

	/*
	 * Method to get the add product page
	 */

	@RequestMapping(value = { "/addproduct" })
	public ModelAndView getAddProductPage(@RequestParam(value = "op", required = false) String operation,
			@RequestParam(value = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("product", new Product());
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		if (operation != null) {
			if ((operation.equals("update")) && status.equals("success")) {
				modelAndView.addObject("msg", "Product Updated Successfully");
			} else if ((operation.equals("update")) && status.equals("fail")) {
				modelAndView.addObject("msg", "Failed to update Product");
			}
			if ((operation.equals("add")) && status.equals("success")) {
				modelAndView.addObject("msg", "Product Added Successfully");
			} else if ((operation.equals("add")) && status.equals("fail")) {
				modelAndView.addObject("msg", "Failed to add Product");
			}
		}
		modelAndView.addObject("title", "Add Product");
		modelAndView.addObject("ifUserClickedAddProduct", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/saveProduct" }, method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute Product product) {
		if (product.getId() == 0) {
			flag = productDAO.addProduct(product);
			if (flag == true) {
				return "redirect:/admin/addproduct?op=add&status=success";
			} else {
				return "redirect:/admin/addproduct?op=add&status=fail";
			}
		} else {
			flag = productDAO.updateProduct(product);
			if (flag == true) {
				return "redirect:/admin/addproduct?op=update&status=success";
			} else {
				return "redirect:/admin/addproduct?op=update&status=fail";
			}
		}
	}

	@RequestMapping(value = { "/delete/product/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id) {
		product = productDAO.get(id);
		productDAO.deleteProduct(product);
		return "redirect:/admin/addproduct";
	}

	@RequestMapping(value = { "/update/product/{id}" }, method = RequestMethod.GET)
	public ModelAndView updateProduct(@ModelAttribute Product product) {
		ModelAndView modelAndView = new ModelAndView("page");
		product = productDAO.get(product.getId());
		modelAndView.addObject("product", product);
		modelAndView.addObject("title", "Update Product");
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		modelAndView.addObject("ifUserClickedUpdateProduct", true);
		return modelAndView;
	}
}
