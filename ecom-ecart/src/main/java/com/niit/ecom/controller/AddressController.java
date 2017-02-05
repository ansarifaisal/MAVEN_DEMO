package com.niit.ecom.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class AddressController {

	@Autowired
	Address address;

	@Autowired
	AddressDAO addressDAO;

	@Autowired
	User user;

	@Autowired
	UserDAO userDAO;

	/*
	 * To Access Address Page
	 */

	@RequestMapping(value = { "/addresses" })
	public ModelAndView addresses(Principal principal, @RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status,
			@RequestParam(value = "id", required = false) String id) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		modelAndView.addObject("user", user);
		modelAndView.addObject("addresses", addressDAO.list(user.getId()));
		modelAndView.addObject("address", new Address());
		if (operation != null) {
			if ((operation.equals("update")) & status.equals("success")) {
				modelAndView.addObject("successMsg", "Success! Address Updated Successfully");
			} else if ((operation.equals("update")) & status.equals("fail")) {
				modelAndView.addObject("failureMsg", "Failed To Update Address");
			}
			if ((operation.equals("save")) & status.equals("success")) {
				modelAndView.addObject("successMsg", "Success! Address Added Successfully");
			} else if ((operation.equals("save")) & status.equals("fail")) {
				modelAndView.addObject("failureMsg", "Failed To Add Address");
			}
			if ((operation.equals("delete")) && status.equals("success") && id != "0") {
				modelAndView.addObject("successMsg", "Success! Address Deleted Successfully");
			} else if ((operation.equals("delete")) && status.equals("fail") && id != "0") {
				modelAndView.addObject("failureMsg", "Failed To Delete Address");
			}
		}
		modelAndView.addObject("title", "Addresses");
		modelAndView.addObject("ifUserClickedAddresses", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/address/save" }, method = RequestMethod.POST)
	public String saveAddress(@ModelAttribute Address address, Principal principal) {
		user = userDAO.getByUserName(principal.getName());
		if (address.getId() == 0) {
			address.setUser(user);
			boolean flag = addressDAO.addAddress(address);
			if (flag == true) {
				return "redirect:/user/addresses?op=save&status=success";
			} else {
				return "redirect:/user/addresses?op=save&status=fail";
			}
		} else {
			address.setUser(user);
			boolean flag = addressDAO.updateAddress(address);
			if (flag == true) {
				return "redirect:/user/addresses?op=update&status=success";
			} else {
				return "redirect:/user/addresses?op=update&status=fail";
			}
		}
	}

	@RequestMapping(value = { "/address/edit/{id}" }, method = RequestMethod.GET)
	public ModelAndView editAddress(@PathVariable(name = "id", required = false) int id, Principal principal) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		address = addressDAO.get(id);
		modelAndView.addObject("address", address);
		modelAndView.addObject("addresses", addressDAO.list(address.getUser().getId()));
		modelAndView.addObject("user", user);
		modelAndView.addObject("title", "Update Address");
		modelAndView.addObject("ifUserClickedEditAddress", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/address/delete/{id}" }, method = RequestMethod.GET)
	public String deleteAddress(@PathVariable(name = "id", required = false) int id) {
		address = addressDAO.get(id);
		boolean flag = addressDAO.deleteAddress(address);
		if (flag == true) {
			return "redirect:/user/addresses?op=delete&status=success&id=" + address.getId();
		} else {
			return "redirect:/user/addresses?op=delete&status=fail&id=" + address.getId();
		}

	}

	@RequestMapping(value = { "/address/default/{id}" })
	public String setDefaultAddress(@PathVariable(name = "id", required = false) int id, Principal principal) {
		user = userDAO.getByUserName(principal.getName());
		address = addressDAO.get(id);
		List<Address> addresses = addressDAO.list(user.getId());
		for (Address defaultAddress : addresses) {
			if (defaultAddress.isDefaultAddress() == true) {
				Address existingDefault = addressDAO.get(defaultAddress.getId());
				existingDefault.setDefaultAddress(false);
				addressDAO.updateAddress(existingDefault);
			}
		}
		address.setDefaultAddress(true);
		addressDAO.updateAddress(address);
		return "redirect:/user/addresses";
	}

}
