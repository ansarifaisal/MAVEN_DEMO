package com.niit.ecom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.dao.ProductDAO;

@Controller
@RequestMapping(value = { "/seller" })
public class SellerController {
	

	@RequestMapping(value = { "/addseller" })
	public ModelAndView getAddSupplierPage() {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Add Supplier");
		modelAndView.addObject("ifUserClickedAddSeller", true);
		return modelAndView;
	}

}
