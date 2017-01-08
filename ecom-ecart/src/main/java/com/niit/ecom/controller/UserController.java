package com.niit.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class UserController {

	/*
	 * to access personal Information page
	 */
	@RequestMapping(value = {"/personalinformation"})
	public ModelAndView personalInformation(){
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Personal Information");
		modelAndView.addObject("ifUserClickedPersonalInformation",true);
		return modelAndView;
	}
	
	/*
	 * To Access change Password Page
	 * */
	
	@RequestMapping(value = {"/changepassword"})
	public ModelAndView changePassword(){
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("user", new User());
		modelAndView.addObject("title", "Change Password");
		modelAndView.addObject("ifUserClickedChangePassword",true);
		return modelAndView;
	}
	
	/*
	 * To Access Update Email And Mobile Page
	 * */
	
	@RequestMapping(value =  {"/updateemailmobile"})
	public ModelAndView updateEmailMobile(){
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("title", "Update Email And Mobile");
		modelAndView.addObject("ifUserClickedUpdateEmailMobile", true);
		return modelAndView;
	}
	
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
	
	@RequestMapping(value="user.do")
	public String doAction(@ModelAttribute User user, BindingResult result, @RequestParam String action){
		return "user";
	}
	
}
