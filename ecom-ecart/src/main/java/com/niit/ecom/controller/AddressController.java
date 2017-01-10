package com.niit.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = {"/user"})
public class AddressController {

	/*
	 * To Access Address Page
	 * */
	
	@RequestMapping(value = {"/addresses"})
	public ModelAndView addresses(){
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Addresses");
		modelAndView.addObject("ifUserClickedAddresses", true);
		return modelAndView;
	}
	
}
