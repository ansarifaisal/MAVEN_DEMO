package com.niit.ecom.webflow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.User;

@Component
public class RegisterFlow {

	@Autowired
	private User user;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Cart cart;

	public User initFlow() {
		return user;
	}

	public String addUser(User user, MessageContext messageContext) {
		String status = "success";
		User userExists = userDAO.getByUserName(user.getEmail());
		if (userExists != null) {

			// Giving error message if user already exists
			messageContext.addMessage(new MessageBuilder().error().source("email")
					.defaultText("User Already Exists, Please Login").build());
			status = "failure";
		} else {

			// else performing the registration task
			if (user.getEmail().isEmpty()) {
				messageContext.addMessage(
						new MessageBuilder().error().source("email").defaultText("Please, Provide E-mail").build());
				status = "failure";
			} else {
				user.setEmail(user.getEmail());
				status = "success";
			}
			if (user.getPassword().isEmpty()) {
				messageContext.addMessage(new MessageBuilder().error().source("password")
						.defaultText("Please, Provide Password").build());
				return "failure";
			} else {
				user.setPassword(user.getPassword());
				status = "success";
			}
			if (user.getFirstName().isEmpty()) {
				messageContext.addMessage(new MessageBuilder().error().source("firstName")
						.defaultText("Please, Provide First Name").build());
				return "failure";
			} else {
				user.setFirstName(user.getFirstName());
				status = "success";
			}
			if (user.getLastName().isEmpty()) {
				messageContext.addMessage(new MessageBuilder().error().source("lastName")
						.defaultText("Please, Provide Last Name").build());
				return "failure";
			} else {
				user.setLastName(user.getLastName());
				status = "success";
			}

			if (user.getMobileNumber().isEmpty()) {
				messageContext.addMessage(new MessageBuilder().error().source("mobileNumber")
						.defaultText("Please, Provide Mobile Number").build());
				return "failure";
			} else {
				user.setMobileNumber(user.getMobileNumber());
				status = "success";
			}
			if (user.getConfirmPassword().isEmpty()) {
				messageContext.addMessage(new MessageBuilder().error().source("confirmPassword")
						.defaultText("Please, Confirm The Password").build());
				return "failure";
			} else {
				user.setConfirmPassword(user.getConfirmPassword());
				status = "success";
			}
			if (user.getGender().isEmpty()) {
				messageContext.addMessage(
						new MessageBuilder().error().source("gender").defaultText("Please, Provide Gender").build());
				return "failure";
			} else {
				user.setGender(user.getGender());
				status = "success";
			}
			user.setRole(user.getRole());
			user.setEnabled(user.isEnabled());
			cart.setUser(user);
			user.setCart(cart);
			// Adding user into the database
			userDAO.addUser(user);

		}
		return status;
	}
}