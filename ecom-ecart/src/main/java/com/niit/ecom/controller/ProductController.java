package com.niit.ecom.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.CategoryDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.entity.Product;

@Controller
@RequestMapping(value = { "/admin" })
public class ProductController {

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;

	@Autowired
	private HttpServletRequest request;

	/*
	 * flag variable for message
	 */

	boolean flag = false;

	/*
	 * Method to get the add product page
	 */

	@RequestMapping(value = { "/addproduct" })
	public ModelAndView getAddProductPage(@RequestParam(value = "op", required = false) String operation,
			@RequestParam(value = "status", required = false) String status,
			@RequestParam(value = "id", required = false) String id) {
		ModelAndView modelAndView = new ModelAndView("page");
		modelAndView.addObject("product", new Product());
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		if (operation != null) {
			if ((operation.equals("update")) && status.equals("success")) {
				modelAndView.addObject("msg", "Success! Product Updated Successfully");
			} else if ((operation.equals("update")) && status.equals("fail")) {
				modelAndView.addObject("msg", "Failed To Update Product");
			} else if ((operation.equals("add")) && status.equals("success")) {
				modelAndView.addObject("msg", "Success! Product Added Successfully");
			} else if ((operation.equals("add")) && status.equals("fail")) {
				modelAndView.addObject("msg", "Failed To Add Product");
			} else if ((operation.equals("delete")) && status.equals("success") && id != "0") {
				modelAndView.addObject("msg", "Success! Product Delted Successfully");
			} else if ((operation.equals("delete")) && status.equals("fail") && id != "0") {
				modelAndView.addObject("msg", "Failed To Delete Product");
			}

		}
		modelAndView.addObject("title", "Add Product");
		modelAndView.addObject("ifUserClickedAddProduct", true);
		return modelAndView;
	}

	@RequestMapping(value = { "/saveProduct" }, method = RequestMethod.POST)
	public String saveProduct(@ModelAttribute Product product, HttpServletRequest request) {

		

		if (product.getId() == 0) {	
			flag = productDAO.addProduct(product);
			System.out.println(product);
			if (flag == true) {
				if(!product.getImage().getOriginalFilename().equals("")){
					product.setImageUrl(uploadImage(product));
				}
				return "redirect:/admin/addproduct?op=add&status=success";
			} else {
				return "redirect:/admin/addproduct?op=add&status=fail";
			}
		} else {
			flag = productDAO.updateProduct(product);
			if (flag == true) {
				if(!product.getImage().getOriginalFilename().equals("")){
					product.setImageUrl(uploadImage(product));
				}
				return "redirect:/admin/addproduct?op=update&status=success";
			} else {
				return "redirect:/admin/addproduct?op=update&status=fail";
			}
		}
	}

	@RequestMapping(value = { "/delete/product/{id}" }, method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id) {
		product = productDAO.get(id);
		flag = productDAO.deleteProduct(product);
		if (flag == true) {
			return "redirect:/admin/addproduct?op=delete&status=success&id=" + id;
		} else {
			return "redirect:/admin/addproduct?op=delete&status=fail&id=" + id;
		}
	}

	@RequestMapping(value = { "/update/product/{id}" }, method = RequestMethod.GET)
	public ModelAndView updateProduct(@ModelAttribute Product product) {
		ModelAndView modelAndView = new ModelAndView("page");
		product = productDAO.get(product.getId());
		modelAndView.addObject("product", product);
		modelAndView.addObject("title", "Update Product");
		modelAndView.addObject("categories", categoryDAO.list());
		modelAndView.addObject("products", productDAO.list());
		modelAndView.addObject("ifUserClickedUpdateProduct", true);
		return modelAndView;
	}

	protected String uploadImage(Product product) {
		MultipartFile imageFile = product.getImage();
		String folderToUpload = "/resources/images/product";
		
		String fileName = imageFile.getOriginalFilename();
		String realPath = request.getServletContext().getRealPath(folderToUpload);
		if (!new File(realPath).exists()) {
			new File(realPath).mkdirs();
		}

		String filePath = realPath + File.separator + product.getId() + ".png";
		File destination = new File(filePath);
		try {
			imageFile.transferTo(destination);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return fileName;
	}
}
