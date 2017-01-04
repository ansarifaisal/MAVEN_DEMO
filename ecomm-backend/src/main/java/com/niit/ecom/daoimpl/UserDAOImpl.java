package com.niit.ecom.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.User;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<User> list() {
		String hql = "FROM USERS";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	@Transactional
	public User getUser(int id) {		
		return (User) sessionFactory.getCurrentSession().get(User.class, id);
	}

	@Override
	@Transactional
	public boolean deleteUser(User user) {
		try{
			sessionFactory.getCurrentSession().delete(user);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean updateUser(User user) {
		try{
			sessionFactory.getCurrentSession().update(user);
			return true;
		}catch(Exception e ){
			System.out.println(e.getMessage());
			return false;
		}
	}

	@Override
	@Transactional
	public boolean addUser(User user) {
		try{
			sessionFactory.getCurrentSession().save(user);	
			return true;
		}catch(Exception e ){
			System.out.println(e.getMessage());
			return false;
		}
		
		
	}

}
