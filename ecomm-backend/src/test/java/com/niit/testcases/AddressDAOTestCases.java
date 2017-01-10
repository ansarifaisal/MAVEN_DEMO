package com.niit.testcases;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.entity.Address;

import junit.framework.Assert;

public class AddressDAOTestCases {
	
	@Autowired
	AddressDAO addressDAO;
	
	@Autowired
	Address address;
	
	@Autowired
	AnnotationConfigApplicationContext context;
	
	public AddressDAOTestCases() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.ecom");
		context.refresh();
		address = (Address) context.getBean("address");
		addressDAO = (AddressDAO) context.getBean("addressDAO");
		}
	
	
	/*@Test
	public void deleteAddressTest(){
		address = addressDAO.get(2);
		Assert.assertEquals(true, addressDAO.deleteAddress(address));
	}*/
	
	/*@Test
	public void updateAddressTest(){
		address = addressDAO.get(1);
		address.setCity("Dehli");
		Assert.assertEquals(true, addressDAO.updateAddress(address));
	}
	*/
	/*@Test
	public void addAddressTest(){
		address.setId(2);
		address.setFirstName("Ansari");
		address.setLastName("Faisal");
		address.setUserId(1);
		address.setLineOne("Plot No. 6, Line N, Room No. 2");
		address.setLineTwo("Baiganwadi Govandi");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setLandmark("Near Govandi Nursing Home");
		address.setPincode(400043);
		address.setCountry("India");
		address.setMobileNumber("9920312317");
		Assert.assertEquals(true, addressDAO.addAddress(address));
	
	}*/
	
}
