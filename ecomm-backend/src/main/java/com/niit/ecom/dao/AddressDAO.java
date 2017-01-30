package com.niit.ecom.dao;

import java.util.List;

import com.niit.ecom.entity.Address;

public interface AddressDAO {

	List<Address> list(int userId);
	
	boolean addAddress(Address address);
	
	boolean updateAddress(Address address);
	
	boolean deleteAddress(Address address);
	
	Address get(int id);
}
