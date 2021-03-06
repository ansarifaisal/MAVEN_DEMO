package com.niit.ecom.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@Transactional
	public Product get(int id) {
		return (Product) sessionFactory.getCurrentSession().get(Product.class, id);
	}

	@Override
	@Transactional
	public List<Product> list() {
		String hql = "FROM PRODUCTS";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	@Transactional
	public boolean addProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean updateProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	@Transactional
	public boolean deleteProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().delete(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public Product getByCategory(int categoryId) {
		return (Product) sessionFactory.getCurrentSession().get(Product.class, categoryId);
	}

	@Override
	@Transactional
	public List<Product> listByCategory(int categoryId) {
		String hql = "FROM PRODUCTS WHERE CATEGORY_ID = :categoryId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("categoryId", categoryId);
		return query.list();
	}

	@Override
	@Transactional
	public List<Product> searchProduct(String keywords) {
		String hql = "FROM PRODUCTS WHERE PRODUCT_NAME LIKE :keywords";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("keywords", "%" + keywords + "%");
		return query.list();
	}

}
