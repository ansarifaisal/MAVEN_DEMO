package com.niit.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
