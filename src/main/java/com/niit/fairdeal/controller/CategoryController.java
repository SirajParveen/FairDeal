package com.niit.fairdeal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.domain.Category;

@Controller
public class CategoryController {
	
	// Category.jsp - addCategory, deleteCategory, showCategoryList, updateCategory
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	// CRUD Operations
	
	@RequestMapping(value = "/Manage_Category", method = RequestMethod.GET)
	public String listCategory(Model model) {
		
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getAllCategories());
		model.addAttribute("isAdminClickedCategory", "true");
		return "/Home";
	}
	
	
	@RequestMapping(value = "/Manage_Category_Create", method = RequestMethod.POST)
	public String createCategory(@ModelAttribute("category") Category category, Model model)
	{
		if (categoryDAO.updateCategory(category) == true) {
			
			model.addAttribute("Message", "Successfully created/updated the caetgory");
		} 
		else 
		{
			model.addAttribute("Message", "not able created/updated the caetgory");
		}
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getAllCategories());
		model.addAttribute("isAdminClickedCategory", "true");
		
		return "/Home";
	}
	
	@RequestMapping("/Manage_Category_Delete/{id}")
	public String deleteCategory(@PathVariable("id") String id, Model model) throws Exception
	{
		boolean flag = categoryDAO.deleteCategory(category);

		String msg = "Successfully deleted the category";
		
		if (flag != true) 
		{
			msg = "Not able to delete the category";
		}
		model.addAttribute("Message", msg);
		
		return "forward:/Manage_Category";
	}
	
	@RequestMapping("/Manage_Category_Edit/{id}")
	public String editCategory(@PathVariable("id") String id, Model model) {

		categoryDAO.updateCategory(category);
		category = categoryDAO.getCategoryByID(id);
		
		model.addAttribute("category", category);
		return "forward:/Manage_Category";
	}
}
