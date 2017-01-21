package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.User;

public interface UserDAO {
	List<User> list();
	User getUser(int id);
	User getByUserName(String userName);
	boolean addUser(User user);
	boolean deleteUser(User user);
	boolean updateUser(User user);
	boolean isValidate(String userName, String password);
}
