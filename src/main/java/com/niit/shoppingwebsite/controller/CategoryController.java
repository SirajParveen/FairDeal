package com.niit.shoppingwebsite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.domain.Category;

@Controller
public class CategoryController {
	
	// Category.jsp - addCategory, deleteCategory, showCategoryList, updateCategory
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	// CRUD Operations
	
	@PostMapping("/Category_Create")
	public ModelAndView createCategory(@RequestParam("id")String id, @RequestParam("name")String name, @RequestParam("description")String description)
	{
		category.setID(id);
		category.setName(name);
		category.setDescription(description);
		
		ModelAndView modelAndView = new ModelAndView("Redirect:/Manage_Category");
		
		if(categoryDAO.createCategory(category))
		{
			modelAndView.addObject("Message", "Successfully Created Category");
		}
		else
		{
			modelAndView.addObject("Message", "Category Not Created");
		}
		return modelAndView;
	}
	
	@GetMapping("/Category_Delete{id}")
	public ModelAndView deleteCategory(@PathVariable("id") String id)
	{
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		if(categoryDAO.deleteCategory(category))
		{
			modelAndView.addObject("Message", "Successfuly Deleted Category");
		}
		else
		{
			modelAndView.addObject("Message", "Category Not Deleted");
		}
		return modelAndView;
	}
}
