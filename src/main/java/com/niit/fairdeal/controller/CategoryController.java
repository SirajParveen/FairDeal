package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	// CRUD Operations
	
	@RequestMapping(value = "/Manage_Category", method = RequestMethod.GET)
	public String listCategory(Model model) {
		
		log.debug(" Starting of the method listCategory");
		
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getAllCategories());
		model.addAttribute("isAdminClickedCategory", "true");
		
		log.debug(" Ending of the method listCategory");
		return "/Home";
	}
	
	
	@RequestMapping(value = "/Manage_Category_Create", method = RequestMethod.POST)
	public String createCategory(@ModelAttribute("category") Category category, Model model)
	{
		log.debug(" Starting of the method createCategory");
		log.info("id:" + category.getID());
		
		if (categoryDAO.createCategory(category) == true) {
			
			model.addAttribute("Message", "Successfully created the category");
		} 
		else 
		{
			model.addAttribute("Message", "Category Not Created");
		}
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getAllCategories());
		model.addAttribute("isAdminClickedCategory", "true");
		
		log.debug(" Ending of the method createCategory");
		return "forward:/Manage_Category";
	}
	
	@RequestMapping("/Manage_Category_Delete/{id}")
	public String deleteCategory(@PathVariable("id") String id, Model model) throws Exception
	{
		log.debug("Starting of the method deleteCategory");
		
		boolean flag = categoryDAO.deleteCategory(category);

		String msg = "Successfully deleted the category";
		
		if (flag != true) 
		{
			msg = "Not able to delete the category";
		}
		model.addAttribute("Message", msg);
		
		log.debug("Ending of the method deleteCategory");
		return "forward:/Manage_Category";
	}
	
	@RequestMapping("/Manage_Category_Edit/{id}")
	public String editCategory(@PathVariable("id") String id, Model model) {
		
		log.debug("Starting of the method editCategory");

		/*categoryDAO.updateCategory(category);*/
		category = categoryDAO.getCategoryByID(id);
		
		/*model.addAttribute("category", category);*/
		
		log.debug("Ending of the method editCategory");
		return "forward:/Manage_Category";
	}
}
