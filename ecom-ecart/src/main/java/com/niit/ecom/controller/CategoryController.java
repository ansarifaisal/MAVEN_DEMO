package com.niit.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.entity.Category;

@Controller
@RequestMapping(value = { "/admin" })
public class CategoryController {

	/*
	 * Injecting Beans
	 */

	@Autowired
	Category category;

	@Autowired
	CategoryDAO categoryDAO;

	/*
	 * Get add product Page
	 */

	@RequestMapping(value = { "/addcategory" })
	public ModelAndView getAddCategoryPage() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("category", new Category());
		modelAndView.addObject("title", "Add Category");
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("ifUserClickedAddCategory", true);
		return modelAndView;
	}

	/*
	 * Method to update the category
	 */

	@RequestMapping(value = { "/update/category/{id}" }, method = RequestMethod.GET)
	public ModelAndView updateCategory(@ModelAttribute Category category) {
		ModelAndView modelAndView = new ModelAndView("page");
		category = categoryDAO.get(category.getId());
		modelAndView.addObject("category", category);
		modelAndView.addObject("title", "Update Category");
		modelAndView.addObject("ifUserClickedUpdateCategory", true);
		return modelAndView;
	}

	/*
	 * Method to save the category into the database if exists otherwise update
	 * the category
	 */
	@RequestMapping(value = { "/saveCategory" }, method = RequestMethod.POST)
	public String saveCategory(@ModelAttribute Category category) {
		ModelAndView modelAndView = new ModelAndView("page");
		if (category.getId() == 0) {
			categoryDAO.addCategory(category);
			modelAndView.addObject("title", "Add Category");
			modelAndView.addObject("ifUserClickedAddCategory", true);
		} else {
			categoryDAO.updateCategory(category);
		}
		return "redirect:/admin/addcategory";
	}
	
	/*
	 * Method to delete category from the database
	 * */
	@RequestMapping(value = { "/delete/category/{id}" }, method = RequestMethod.GET)
	public String deleteCategory(@PathVariable int id) {
		category = categoryDAO.get(id);
		categoryDAO.deleteCategory(category);
		return "redirect:/admin/addcategory";
	}
}
