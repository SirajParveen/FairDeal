package com.niit.shoppingwebsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.domain.Category;

@Controller
public class CategoryController {
	
	// Category.jsp - addCategory, deleteCategory, showCategoryList, updateCategory
	
	@Autowired
	private CategoryDAO categoryDAO;
	
//	@Autowired
//	private Category category;
	
	public ModelAndView getAllCategories()
	{
		ModelAndView modelAndView = new ModelAndView("/AdminHome");
		List<Category> categoryList =  categoryDAO.getAllCategories();
		
		modelAndView.addObject("categoryList", categoryList);
		modelAndView.addObject("isUserClickedCategory", true);
		return modelAndView;
	}

}
