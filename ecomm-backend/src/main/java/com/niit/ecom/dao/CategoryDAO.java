package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.Category;

public interface CategoryDAO {
	List<Category> list();
	Category get(int id);
	boolean addCategory(Category category);
	boolean updateCategory(Category category);
	boolean deleteCategory(Category category);
}
