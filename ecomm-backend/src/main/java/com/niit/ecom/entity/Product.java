package com.niit.ecom.entity;

public class Product {
	/*
	 *  Private fields
	 * */	
	private int id;
	private int price;
	private String name;
	public int getId() {
		return id;
	}
	
	public Product() {
		this(0,0,null);
	}



	public Product(int id, int price, String name) {
		super();
		this.id = id;
		this.price = price;
		this.name = name;
	}



	/*
	 * Accessors/Getter and Mutators/Setter
	 * */
	
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	/*
	 * Overriding toString method for debugging
	 * */
	
	@Override
	public String toString() {
		return "ProductDAOImpl [id=" + id + ", price=" + price + ", name=" + name + "]";
	}
	
	
}
