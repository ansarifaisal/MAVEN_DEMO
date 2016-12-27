package com.niit.ecom.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
	
@Entity
@Table(name="product_temp")
public class Product implements Serializable {
	
	private static final long serialVersionUID = 3325393496966672911L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	/*
	 *  Private fields
	 * */	
	
	private int id;
	private int price;
	private String name;
	private String image;
	
	/*
	 * Default constructor to provide default values
	 * */
	public Product() {
		this(0,0,null, null);
	}


	/*
	 * Parameterized Constructor to provide the values provided by the user
	 * */
	public Product(int id, int price, String name, String image) {
		super();
		this.id = id;
		this.price = price;
		this.name = name;
		this.image = image;
	}


	/*
	 * Accessors/Getter and Mutators/Setter
	 * */
	
	public int getId() {
		return id;
	}
	
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

	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	/*
	 * Overriding toString method for debugging
	 * */

	@Override
	public String toString() {
		return "ProductDAOImpl [id=" + id + ", price=" + price + ", name=" + name + "]";
	}
	
	
}
