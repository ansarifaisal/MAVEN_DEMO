package com.niit.ecom.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class UserController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	/*
	 * to access personal Information page
	 */
	@RequestMapping(value = { "/personalinformation" })
	public ModelAndView personalInformation(Principal principal,
			@RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("user", userDAO.getByUserName(principal.getName()));
		if (operation != null) {
			if (operation.equals("update") & status.equals("success")) {
				modelAndView.addObject("successMsg", "Success! Details Updated Successfully");
			}
			if (operation.equals("update") & status.equals("fail")) {
				modelAndView.addObject("failureMsg", "Failed To Update The Details");
			}
		}
		modelAndView.addObject("title", "Personal Information");
		modelAndView.addObject("ifUserClickedPersonalInformation", true);
		return modelAndView;
	}

	/*
	 * To Access change Password Page
	 */

	@RequestMapping(value = { "/changepassword" })
	public ModelAndView changePassword(Principal principal,
			@RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("user", userDAO.getByUserName(principal.getName()));
		if (operation != null) {
			if (operation.equals("update") & status.equals("wrong")) {
				modelAndView.addObject("wrongMsg", "Old Password Doesn't Match");
			}
			if (operation.equals("update") & status.equals("success")) {
				modelAndView.addObject("successMsg", "Success! Password Updated Successfully");
			}
			if (operation.equals("update") & status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Failed To Update The Password");
			}
		}
		modelAndView.addObject("title", "Change Password");
		modelAndView.addObject("ifUserClickedChangePassword", true);
		return modelAndView;
	}

	/*
	 * To Access Update Email And Mobile Page
	 */

	@RequestMapping(value = { "/updateemailmobile" })
	public ModelAndView updateEmailMobile(Principal principal,
			@RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("user", userDAO.getByUserName(principal.getName()));
		if (operation != null) {
			if (operation.equals("update") & status.equals("success")) {
				modelAndView.addObject("successMsg", "Success! Password Updated Email/Mobile");
			}
			if (operation.equals("update") & status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Failed To Update The Email/Mobile");
			}
		}

		modelAndView.addObject("title", "Update Email And Mobile");
		modelAndView.addObject("ifUserClickedUpdateEmailMobile", true);
		return modelAndView;
	}

	/*
	 * To Update the personal information
	 */

	@RequestMapping(value = { "/update/personalinformation" }, method = RequestMethod.POST)
	public String updatePersonalInformation(@ModelAttribute User user,
			@RequestParam(name = "firstName", required = false) String firstName,
			@RequestParam(name = "lastName", required = false) String lastName,
			@RequestParam(name = "gender", required = false) String gender) {
		user = userDAO.getUser(user.getId());
		if (firstName != null) {
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setGender(gender);
		}

		boolean flag = userDAO.updateUser(user);

		if (flag == true) {
			// success url
			return "redirect:/user/personalinformation?op=update&status=success";
		} else {
			// failure url
			return "redirect:/user/personalinformation?op=update&status=fail";
		}

	}

	/*
	 * To Update Password
	 */
	@RequestMapping(value = { "/update/password" }, method = RequestMethod.POST)
	public String updatePassword(@ModelAttribute User user, Principal principal,
			@RequestParam(name = "oldPassword", required = false) String oldPassword,
			@RequestParam(name = "password", required = false) String newPassword,
			@RequestParam(name = "confirmPassword", required = false) String confirmPassword) {
		user = userDAO.getUser(user.getId());
		System.out.println(user);
		user.setOldPassword(oldPassword);
		if (user.getOldPassword().equals(user.getPassword())) {
			user.setPassword(newPassword);
			user.setConfirmPassword(confirmPassword);
		} else {
			return "redirect:/user/changepassword?op=update&status=wrong";
		}
		if (user.getPassword().equals(user.getConfirmPassword())) {
			userDAO.updateUser(user);
			return "redirect:/user/changepassword?op=update&status=success";
		} else {
			return "redirect:/user/changepassword?op=update&status=fail";
		}
	}
	/*
	 * To Update Email And Mobile Number
	 */

	@RequestMapping(value = { "/update/address" }, method = RequestMethod.POST)
	public String updateEmailMobile(@ModelAttribute User user,
			@RequestParam(name = "email", required = false) String email,
			@RequestParam(name = "mobileNumber", required = false) String mobileNumber) {
		user = userDAO.getUser(user.getId());

		if (email != null) {
			user.setEmail(email);
			user.setMobileNumber(mobileNumber);
		}
		boolean flag = userDAO.updateUser(user);
		if (flag == true) {
			return "redirect:/user/updateemailmobile?op=update&status=success";
		} else {
			return "redirect:/user/updateemailmobile?op=update&status=fail";
		}

	}

}