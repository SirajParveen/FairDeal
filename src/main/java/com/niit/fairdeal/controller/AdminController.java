package com.niit.fairdeal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Category;
import com.niit.fairdeal.domain.Product;
import com.niit.fairdeal.domain.Supplier;

@Controller
public class AdminController {

	@Autowired
	Category category;

	@Autowired
	CategoryDAO categoryDAO;

	@Autowired
	Supplier supplier;

	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	Product product;

	@Autowired
	ProductDAO productDAO;

	// define 3 methods

	// http://localhost:8080/ShoppingCart/Manage_Category
	// <a href="/Manage_Category"></a>
	// id, name, description
	@RequestMapping("/Manage_Category")
	public ModelAndView manageCategories() {
		ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("category", category);
		modelAndView.addObject("isAdminClickedCategory", "true");
		modelAndView.addObject("categoryList", categoryDAO.getAllCategories());

		return modelAndView;
	}

	// id, name, price, description, category_id, supplier_id
	@RequestMapping("/Manage_Product")
	public ModelAndView manageProducts() {
		ModelAndView modelAndView = new ModelAndView("/Home");

		modelAndView.addObject("isAdminClickedProduct", "true");

		modelAndView.addObject("product", product);
		modelAndView.addObject("productList", productDAO.getAllProducts());

		modelAndView.addObject("category", category);
		modelAndView.addObject("categoryList", categoryDAO.getAllCategories());

		modelAndView.addObject("supplier", supplier);
		modelAndView.addObject("supplierList", supplierDAO.getAllSuppliers());

		return modelAndView;
	}

	// id, name, address
	@RequestMapping("/Manage_Supplier")
	public ModelAndView manageSuppliers() {
		ModelAndView modelAndView = new ModelAndView("/Home");

		modelAndView.addObject("isAdminClickedSupplier", "true");

		modelAndView.addObject("supplierList", supplierDAO.getAllSuppliers());
		modelAndView.addObject("supplier", supplier);

		return modelAndView;
	}
}
