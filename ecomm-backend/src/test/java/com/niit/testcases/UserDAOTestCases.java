package com.niit.testcases;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.User;

import junit.framework.Assert;

public class UserDAOTestCases {

	/*
	 * @Autowired is use to automatically inject the bean.
	 */
	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	@Autowired
	AnnotationConfigApplicationContext context;

	public UserDAOTestCases() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");
		user = (User) context.getBean("user");
	}
	
/*	@Test
	public void deleteUserTest(){
		user = userDAO.getUser(2);
		Assert.assertEquals(true, userDAO.deleteUser(user));
	}*/

	/*
	 * Test to get user by its id
	 */
	
	/*@Test
	public void getUserTest(){
		user = userDAO.getUser(4);
		Assert.assertEquals("This is Valid", user.getId(),userDAO.getUser(1).getId());
	}	*/
	
	@Test
	public void getAllUserTest(){
		user = userDAO.getByUserName("ansarifaisal480@gmail.com");
		Assert.assertEquals(1, user.getId());
	}
	
	/*@Test
	public void updateUserTest(){
		user = userDAO.getUser(1);
		user.setRole("ADMIN");
		Assert.assertEquals(true, userDAO.updateUser(user));
	}*/
	
	/*@Test
	public void addUserTest() {
		user.setId(2);
		user.setEmail("test@test.com");
		user.setFirstName("test");
		user.setLastName("test");
		user.setGender("Male");
		user.setPassword("test");
		user.setMobileNumber("9999944455");
		user.setRole("Customer");
		user.setEnabled(false);
		Assert.assertEquals(true, userDAO.addUser(user));
	}*/
}