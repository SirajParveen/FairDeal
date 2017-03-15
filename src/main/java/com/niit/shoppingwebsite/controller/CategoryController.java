package com.niit.shoppingwebsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		ModelAndView modelAndView = new ModelAndView("forward:/Manage_Category");
		
		modelAndView.addObject("isUserClickedCategory", "true");
		
		if(categoryDAO.createCategory(category))
		{
			modelAndView.addObject("Message", "Successfully Created Category");
		}
		else
		{
			modelAndView.addObject("Message", "Category Not Created");
		}
		List<Category> categoryList = categoryDAO.getAllCategories();
		modelAndView.addObject("categoryList",categoryList);
		modelAndView.addObject("category",category);
		return modelAndView;
	}
	
	@RequestMapping("/Category_Delete/{id}")
	public ModelAndView deleteCategory(@PathVariable("id") String id)
	{
		category.setID(id);
		
		ModelAndView modelAndView = new ModelAndView("forward:/Manage_Category");
		
		modelAndView.addObject("isUserClickedCategory", "true");
		
		if(categoryDAO.deleteCategory(category))
		{
			modelAndView.addObject("Message", "Successfuly Deleted Category");
		}
		else
		{
			modelAndView.addObject("Message", "Category Not Deleted");
		}
		List<Category> categoryList = categoryDAO.getAllCategories();
		modelAndView.addObject("categoryList",categoryList);
		modelAndView.addObject("category",category);
		return modelAndView;
	}
	
	@RequestMapping("/Category_Edit/{id}")
	public ModelAndView editCategory(@PathVariable("id") String id, Model model)
	{	
		category.setID(id);
		
		ModelAndView modelAndView = new ModelAndView("forward:/Manage_Category");
		
		modelAndView.addObject("isUserClickedCategory", "true");
		
		if(categoryDAO.updateCategory(category))
		{
			modelAndView.addObject("Message", "Successfuly Edited Category");
		}
		else
		{
			modelAndView.addObject("Message", "Category Not Edited");
		}
		List<Category> categoryList = categoryDAO.getAllCategories();
		modelAndView.addObject("categoryList",categoryList);
		modelAndView.addObject("category",category);
		return modelAndView;
	}
}
