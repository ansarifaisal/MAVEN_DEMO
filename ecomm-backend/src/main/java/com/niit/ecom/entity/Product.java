package com.niit.ecom.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity(name = "PRODUCTS")
@Component
public class Product implements Serializable {

	private static final long serialVersionUID = 5692323758045144458L;

	/*
	 * Private Fields For Products
	 */
	@Id
	@Column(name = "PRODUCT_ID")
	private int id;
	@Column(name = "PRODUCT_NAME")
	private String productName;
	@Column(name = "PRODUCT_DESCRIPTION")
	private String description;
	@Column(name = "PRODUCT_PRICE")
	private double price;
	@Column(name = "PRODUCT_QUANTITY")
	private int quantity;
	@Column(name = "CATEGORY_ID")
	private int categoryId;

	/*
	 * Getters And Setters / Accessors And Mutators
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/*
	 * Overriding toString method for debugging
	 */
	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", description=" + description + ", price="
				+ price + ", quantity=" + quantity + ", categoryId=" + categoryId + "]";
	}

}
