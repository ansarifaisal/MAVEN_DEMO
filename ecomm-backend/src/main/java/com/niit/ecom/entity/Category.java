package com.niit.ecom.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;



@Entity(name = "CATEGORIES")
@Component
public class Category implements Serializable {

	private static final long serialVersionUID = 7091012861829841749L;

	/*
	 * Private Fields for Category
	 */
	@Id
	@Column(name = "CATEGORY_ID")
	private int id;
	@Column(name = "CATEGORY_NAME")
	private String name;
	@Column(name = "CATEGORY_DESCRIPTION")
	private String description;

	/*
	 	Getters And Setters / Accessors And Mutators
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	

}
