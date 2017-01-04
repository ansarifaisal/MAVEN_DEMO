package com.niit.testcases;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.entity.Category;

public class CategoryDAOTestCases {

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	Category category;

	@Autowired
	AnnotationConfigApplicationContext context;

	public CategoryDAOTestCases() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
		category = (Category) context.getBean("category");
	}

	
	/*
	 * Test to delete the category
	 */

	/*@Test
	public void deleteCategoryTest() {
		category = categoryDAO.get(2);
		Assert.assertEquals(true, categoryDAO.deleteCategory(category));
	}*/

	/*
	 * Test to update category
	 */
	/*
	 * @Test public void updateCategoryTest(){ category = categoryDAO.get(2);
	 * category.setDescription("This is smart watch category");
	 * Assert.assertEquals(true, categoryDAO.updateCategory(category)); }
	 */

	/*
	 * Test to add category
	 */

	/*
	 * @Test public void addCategoryTest() { category.setId(2);
	 * category.setName("Wearable");
	 * category.setDescription("This is the wearable category");
	 * Assert.assertEquals(true, categoryDAO.addCategory(category)); }
	 */

}
