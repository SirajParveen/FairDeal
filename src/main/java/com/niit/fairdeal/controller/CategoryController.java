package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	
	@RequestMapping("/Manage_Category")
	public ModelAndView manageCategories(@ModelAttribute("category")Category category,BindingResult result,Model model) {
		
		log.debug("Starting of the method manageCategories");
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
	   //modelAndView.addObject("category", category);
		modelAndView.addObject("isAdminClickedCategory", "true");
		modelAndView.addObject("categoryList", categoryDAO.getAllCategories());

		log.debug("Ending of the method manageCategories");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/Manage_Category_Create", method = RequestMethod.POST)
	public String createCategory(@ModelAttribute("category") Category category, Model model)
	{
		log.debug(" Starting of the method createCategory");
		log.info("id:" + category.getId());
		
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
	
	@GetMapping("/Manage_Category_Delete/{id}")
	public String deleteCategory(@PathVariable("id")String id)
	{
		category.setId(id);
		categoryDAO.deleteCategory(category);
	
		return "redirect:/Manage_Category";
		
	}
	
	
	@RequestMapping(value="/Manage_Category_Edit/{id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable("id") String id, RedirectAttributes attributes) 
	{
		
		attributes.addFlashAttribute("category", this.categoryDAO.getCategoryByID(id));
		
		return "redirect:/Manage_Category";
	}	
	
	
}
