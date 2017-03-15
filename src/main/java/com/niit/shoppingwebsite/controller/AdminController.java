package com.niit.shoppingwebsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.domain.Category;
import com.niit.shoppingcart.domain.Product;
import com.niit.shoppingcart.domain.Supplier;

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
	
	@RequestMapping("/Manage_Category")
	public ModelAndView manageCategories()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedCategory", "true");
		
		List<Category> categoryList = categoryDAO.getAllCategories();
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.addObject("category", category);
		
		return modelAndView;
	}
	
	@RequestMapping("/Manage_Product")
	public ModelAndView manageProducts()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedProduct", "true");
		
		List<Product> productList = productDAO.getAllProducts();
		modelAndView.addObject("productList",productList);
		modelAndView.addObject("product",product);
		
		return modelAndView;
	}
	
	@RequestMapping("/Manage_Supplier")
	public ModelAndView manageSuppliers()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedSupplier", "true");
		
		List<Supplier> supplierList = supplierDAO.getAllSuppliers();
		modelAndView.addObject("supplierList",supplierList);
		modelAndView.addObject("supplier",supplier);
		
		return modelAndView;
	}
}
