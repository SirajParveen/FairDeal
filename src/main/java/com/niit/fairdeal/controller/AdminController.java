package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	private static Logger log = LoggerFactory.getLogger(AdminController.class);
	
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
	
	// id, name, description
	@RequestMapping("/Manage_Category")
	public ModelAndView manageCategories(@ModelAttribute("category") Category category, BindingResult result, Model model) 
	{
		log.debug("Starting of the method manageCategories");
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
	
		modelAndView.addObject("Category", category);
		modelAndView.addObject("isAdminClickedCategory", "true");
		modelAndView.addObject("categoryList", categoryDAO.getAllCategories());

		log.debug("Ending of the method manageCategories");
		return modelAndView;
	}
	
	// id, name, price, description, category_id, supplier_id
	@RequestMapping("/Manage_Product")
	public ModelAndView manageProducts(@ModelAttribute("product") Product product, BindingResult result, Model model) {
		
		log.debug("Starting of the method manageProducts");
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isAdminClickedProduct", "true");

		modelAndView.addObject("product", product);
		modelAndView.addObject("productList", productDAO.getAllProducts());

		modelAndView.addObject("category", category);
		modelAndView.addObject("categoryList", categoryDAO.getAllCategories());

		modelAndView.addObject("supplier", supplier);
		modelAndView.addObject("supplierList", supplierDAO.getAllSuppliers());
		
		modelAndView.addObject("getAllProducts", product.getCategory());

		log.debug("Ending of the method manageProducts");
		return modelAndView;
	}
	
	// id, name, address
	@RequestMapping("/Manage_Supplier")
	public ModelAndView manageSuppliers(@ModelAttribute("supplier") Supplier supplier, BindingResult result, Model model) {
		
		log.debug("Starting of the method manageSuppliers");
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isAdminClickedSupplier", "true");
		modelAndView.addObject("supplierList", supplierDAO.getAllSuppliers());

		log.debug("Ending of the method manageSuppliers");
		return modelAndView;
	}
}
