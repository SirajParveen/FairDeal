package com.niit.shoppingwebsite.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	// define 3 methods 
	
	@RequestMapping("/Manage_Category")
	public ModelAndView manageCategories()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedCategory", "true");
		
		//get the categories from DB
		
		return modelAndView;
	}
	
	@RequestMapping("/Manage_Product")
	public ModelAndView manageProducts()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedProduct", "true");
		
		return modelAndView;
	}
	
	@RequestMapping("/Manage_Supplier")
	public ModelAndView manageSuppliers()
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedSupplier", "true");
		
		return modelAndView;
	}

}
