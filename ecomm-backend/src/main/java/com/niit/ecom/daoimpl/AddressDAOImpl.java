package com.niit.ecom.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.entity.Address;

@Repository("addressDAO")
public class AddressDAOImpl implements AddressDAO{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	@Transactional
	public List<Address> list() {
		String hql = "From Addresses";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	@Transactional
	public boolean addAddress(Address address) {
		try {
			sessionFactory.getCurrentSession().save(address);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	@Transactional
	public boolean updateAddress(Address address) {
		try {
			sessionFactory.getCurrentSession().update(address);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deleteAddress(Address address) {
		try {
			sessionFactory.getCurrentSession().delete(address);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	@Transactional
	public Address get(int id) {
		return (Address) sessionFactory.getCurrentSession().get(Address.class, id);
	}

}
