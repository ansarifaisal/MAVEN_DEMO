package com.niit.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	@RequestMapping(value = {"/", "home", "index", "default"})
	public ModelAndView index(){
		ModelAndView mv = new ModelAndView("page");
		return mv;
	}
@RequestMapping(value = {"test"})
	
	public ModelAndView test(){
		ModelAndView mv = new ModelAndView("test");
		return mv;
	}
	
}
