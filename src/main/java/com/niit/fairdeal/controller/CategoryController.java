package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.domain.Category;

@Controller
public class CategoryController 
{	
	private static Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@RequestMapping(value = "/Manage_Category_Create", method = RequestMethod.POST)
	public String createCategory(@ModelAttribute("category") Category category, Model model)
	{
		log.debug(" Starting of the method createCategory");
		log.info("id: " +category.getId());
		
		if(categoryDAO.createCategory(category) == true) 
		{	
			model.addAttribute("Message", "Successfully Created the Category");
		} 
		else 
		{
			model.addAttribute("Message", "Category Not Created");
		}
		model.addAttribute("category", category);
		model.addAttribute("categoryList", categoryDAO.getAllCategories());
		model.addAttribute("isAdminClickedCategory", "true");
		
		log.debug(" Ending of the method createCategory");
		return "redirect:/Manage_Category";
	}	
	
	@GetMapping("/Manage_Category_Delete/{id}")
	public String deleteCategory(@PathVariable("id") int id)
	{
		log.debug("Starting of the method deleteCategory");
		
		category.setId(id);
		categoryDAO.deleteCategory(category);
	
		log.debug("Ending of the method deleteCategory");
		return "redirect:/Manage_Category";
	}
	
	@RequestMapping(value= "/Manage_Category_Edit/{id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("id") int id, RedirectAttributes attributes) 
	{
		log.debug("Starting of the method editCategory");
		
		attributes.addFlashAttribute("category", this.categoryDAO.getCategoryByID(id));
		
		log.debug("Ending of the method editCategory");
		return "redirect:/Manage_Category";
	}	
	
	@RequestMapping(value= "/Manage_Category_Update")
	public String updateCategory(@ModelAttribute("category") Category category) 
	{
		log.debug("Starting of the method updateCategory");
		
		categoryDAO.updateCategory(category);
		
		log.debug("Ending of the method updateCategory");
		return "redirect:/Manage_Category";
	}	
}
