package com.niit.ecom.controller;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecom.dao.AddressDAO;
import com.niit.ecom.dao.CartDAO;
import com.niit.ecom.dao.CartItemDAO;
import com.niit.ecom.dao.ProductDAO;
import com.niit.ecom.dao.UserDAO;
import com.niit.ecom.entity.Address;
import com.niit.ecom.entity.Cart;
import com.niit.ecom.entity.CartItem;
import com.niit.ecom.entity.Product;
import com.niit.ecom.entity.User;

@Controller
@RequestMapping(value = { "/user" })
public class CartController {

	@Autowired
	Product product;

	@Autowired
	User user;

	@Autowired
	UserDAO userDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	Cart cart;

	@Autowired
	CartDAO cartDAO;

	@Autowired
	CartItem cartItem;

	@Autowired
	CartItemDAO cartItemDAO;

	@Autowired
	Address address;

	@Autowired
	AddressDAO addressDAO;

	@Autowired
	HttpSession httpSession;

	/*
	 * to access cart page
	 */
	@RequestMapping(value = { "/cart" })
	public ModelAndView cart(Principal principal, @RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		List<CartItem> cartItems = cartItemDAO.list(user.getCart().getCartId());
		modelAndView.addObject("cartItem", new CartItem());
		modelAndView.addObject("cartItems", cartItems);
		httpSession.setAttribute("noOfCartItem", cartItems.size());
		modelAndView.addObject("cart", user.getCart());
		modelAndView.addObject("title", "Cart");
		modelAndView.addObject("ifUserClickedCart", true);
		if (operation != null) {
			if (operation.equals("add") && status.equals("success")) {
				httpSession.setAttribute("noOfCartItem", cartItems.size());
				modelAndView.addObject("successMsg", "Product Added Successfully!");
			} else if (operation.equals("add") && status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Fail To Add Product");
			} else if (operation.equals("delete") && status.equals("success")) {
				modelAndView.addObject("successMsg", "Product Deleted Successfully!");
			} else if (operation.equals("delete") && status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Fail To Deleted Product");
			} else if (operation.equals("update") && status.equals("success")) {
				modelAndView.addObject("successMsg", "Product Updated Successfully!");
			} else if (operation.equals("update") && status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Fail To Updated Product");
			} else if (operation.equals("move") && status.equals("success")) {
				modelAndView.addObject("successMsg", "Product Moved Successfully!");
			} else if (operation.equals("move") && status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Fail To Moved Product");
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = { "/cart/add/{id}" })
	public String addCart(@PathVariable(name = "id") int id, Principal principal) {
		String url = null;
		user = userDAO.getByUserName(principal.getName());
		product = productDAO.get(id);
		Set<CartItem> cartItems = new HashSet<>();

		// getting cart if it is available
		cart = user.getCart();

		// get whether the product is an existing product
		boolean flag = cartItemDAO.existingCartItem(product.getId(), cart.getCartId());

		// if the product is in stock then add product into the cart
		if (product.getQuantity() > 0) {
			// add the product if it is not available in the cart
			if (flag != true) {
				cartItem.setProduct(product);
				cartItem.setQuantity(1);
				product.setQuantity(product.getQuantity() - 1);
				cartItem.setItemPrice(product.getPrice());
				cartItem.setTotalPrice(cartItem.getTotalPrice());
				cartItem.setWishList(false);
				cartItems.add(cartItem);
				cart.setCartItems(cartItems);
				cart.setUser(user);
				cartItem.setCart(cart);
				productDAO.updateProduct(product);
				cartItemDAO.addCartItem(cartItem);
				cartDAO.updateCartAgain(cart);
				cartDAO.updateCart(cart);
				url = "redirect:/user/cart?op=add&status=success";
			} else {
				// if the product is already in the cart then update the
				// quantity
				cartItem = cartItemDAO.getByProductId(product.getId(), cart.getCartId());
				cartItem.setQuantity(cartItem.getQuantity() + 1);
				cartItem.setTotalPrice(cartItem.getTotalPrice());
				cartItem.setWishList(false);
				cartItemDAO.updateCartItem(cartItem);
				product.setQuantity(product.getQuantity() - 1);
				productDAO.updateProduct(product);
				cartDAO.updateCartAgain(cart);
				cartDAO.updateCart(cart);
				url = "redirect:/user/cart?op=add&status=success";
			}
		} else {
			url = "redirect:/user/cart?op=add&status=failure";
		}
		return url;
	}

	@RequestMapping(value = { "/cart/delete/{id}" })
	public String deleteCart(@PathVariable(name = "id", required = false) int id, Principal principal) {
		String url = "";
		user = userDAO.getByUserName(principal.getName());
		cartItem = cartItemDAO.get(id);
		product = productDAO.get(cartItem.getProduct().getId());
		if (id != 0) {
			cart = cartDAO.get(user.getCart().getCartId());
			product.setQuantity(product.getQuantity() + cartItem.getQuantity());
			cartItemDAO.deleteCartItem(cartItem);
			cartDAO.updateCartAgain(cart);
			productDAO.updateProduct(product);
			cartDAO.updateCart(cart);
			url = "redirect:/user/cart?op=delete&status=success";
		} else {
			url = "redirect:/user/cart?op=delete&status=failure";
		}

		return url;
	}

	@RequestMapping(value = { "/cart/update" }, method = RequestMethod.POST)
	public String updateQuantity(@ModelAttribute CartItem cartItem, HttpServletRequest request) {
		int quantity = cartItem.getQuantity();
		cartItem = cartItemDAO.get(cartItem.getId());
		int existingQuantity = cartItem.getQuantity();
		int changeQuantity = existingQuantity - quantity;
		product = productDAO.get(cartItem.getProduct().getId());
		if (product.getQuantity() > quantity) {
			cartItem.setQuantity(quantity);
			cartItem.setTotalPrice(cartItem.getTotalPrice());
			cartItemDAO.updateCartItem(cartItem);
			product.setQuantity(product.getQuantity() + changeQuantity);
			productDAO.updateProduct(product);
			cart = user.getCart();
			cartDAO.updateCartAgain(cart);
			cartDAO.updateCart(cart);
			return "redirect:/user/cart?op=update&status=success";
		} else {
			return "redirect:/user/cart?op=update&status=failure";
		}
	}

	@RequestMapping(value = "/wishlist/show")
	public ModelAndView wishList(Principal principal, @RequestParam(name = "op", required = false) String operation,
			@RequestParam(name = "status", required = false) String status) {
		ModelAndView modelAndView = new ModelAndView("page");
		user = userDAO.getByUserName(principal.getName());
		cart = user.getCart();
		modelAndView.addObject("title", "WishList");
		modelAndView.addObject("items", cartItemDAO.wishList(cart.getCartId()));
		modelAndView.addObject("ifUserClickedWishList", true);
		if (operation != null) {
			if (operation.equals("add") && status.equals("success")) {
				modelAndView.addObject("successMsg", "Product Added In WhishList Successfully!");
			} else if (operation.equals("add") && status.equals("failure")) {
				modelAndView.addObject("failureMsg", "Fail To Add Product In WhishList");
			} else if (operation.equals("move") && status.equals("success")) {
				modelAndView.addObject("successMsg", "Product Moved Successfully!");
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = { "/wishlist/add/{id}" })
	public String addWishList(@PathVariable(name = "id", required = false) int id, Principal principal) {
		String url;
		user = userDAO.getByUserName(principal.getName());
		product = productDAO.get(id);
		cart = user.getCart();
		if (product.getId() >= 0) {
			cartItem.setProduct(product);
			cartItem.setQuantity(0);
			cartItem.setCart(user.getCart());
			cartItem.setTotalPrice(cartItem.getTotalPrice());
			cartItem.setWishList(true);
			cartItemDAO.addCartItem(cartItem);
			url = "redirect:/user/wishlist/show?op=add&status=success";
		} else {
			url = "redirect:/user/wishlist/show?op=add&status=failure";
		}
		return url;
	}

	@RequestMapping(value = { "/wishlist/move/{id}" })
	public String moveWhishlist(@PathVariable(name = "id", required = false) int id, Principal principal) {
		user = userDAO.getByUserName(principal.getName());
		cart = user.getCart();
		cartItem = cartItemDAO.get(id);
		product = cartItem.getProduct();

		product.setQuantity(product.getQuantity() + cartItem.getQuantity());
		productDAO.updateProduct(product);
		cartItem.setQuantity(0);
		cartItem.setTotalPrice(0);
		cartItem.setWishList(true);
		cartItemDAO.updateCartItem(cartItem);
		cartDAO.updateCartAgain(cart);
		cartDAO.updateCart(cart);

		return "redirect:/user/wishlist/show?op=move&status=success";

	}

	@RequestMapping(value = { "/cart/move/{id}" })
	public String moveCart(@PathVariable(name = "id", required = false) int id, Principal principal) {
		String url = null;
		user = userDAO.getByUserName(principal.getName());
		cart = user.getCart();
		cartItem = cartItemDAO.get(id);
		product = cartItem.getProduct();
		if (product.getQuantity() > 0) {
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(cartItem.getItemPrice());
			cartItem.setWishList(false);
			cartItemDAO.updateCartItem(cartItem);
			product.setQuantity(product.getQuantity() - 1);
			productDAO.updateProduct(product);
			cartDAO.updateCartAgain(cart);
			cartDAO.updateCart(cart);
			url = "redirect:/user/cart?op=move&status=success";
		} else {
			url = "redirect:/user/cart?op=move&status=failure";
		}
		return url;
	}

}
