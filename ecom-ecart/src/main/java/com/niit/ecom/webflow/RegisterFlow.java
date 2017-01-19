package com.niit.ecom.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.niit.ecom.entity.User;

@Component
public class RegisterFlow {

	@Autowired
	private User user;

	public User initFlow() {
		return user;
	}

	public String addUser(User user) {
		user.setEmail(user.getEmail());
		user.setPassword(user.getPassword());
		user.setFirstName(user.getFirstName());
		user.setLastName(user.getLastName());
		user.setMobileNumber(user.getMobileNumber());
		user.setConfirmPassword(user.getConfirmPassword());
		user.setGender(user.getGender());
		user.setRole(user.getRole());
		user.setEnabled(user.isEnabled());
		return "success";
	}
}