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

import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Supplier;

@Controller
public class SupplierController {
	
	private static Logger log = LoggerFactory.getLogger(SupplierController.class);

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;
	
	@RequestMapping("/Manage_Supplier")
	public ModelAndView manageSuppliers(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model) {
		
		log.debug("Starting of the method manageSuppliers");
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isAdminClickedSupplier", "true");

		modelAndView.addObject("supplierList", supplierDAO.getAllSuppliers());
		//modelAndView.addObject("supplier", supplier);

		log.debug("Ending of the method manageSuppliers");
		return modelAndView;
	}


	@RequestMapping(value = "/Manage_Supplier_Create", method = RequestMethod.POST)
	public String createSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {

		log.debug(" Starting of the method createSupplier");
		log.info("id:" + supplier.getId());
		
		if (supplierDAO.createSupplier(supplier) == true) {
			
			model.addAttribute("Message", "Successfully created supplier");
		} 
		else 
		{
			model.addAttribute("Message", "Supplier Not Created");
		}
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.getAllSuppliers());
		model.addAttribute("isAdminClickedSupplier", "true");
		
		log.debug(" Ending of the method createSupplier");
		return "forward:/Manage_Supplier";
	}

	@RequestMapping("/Manage_Supplier_Delete/{id}")
	public String deleteSupplier(@PathVariable("id") String id, Model model) throws Exception{

		log.debug("Starting of the method deleteSupplier");
		
		boolean flag = supplierDAO.deleteSupplier(supplier);

		String msg = "Successfully deleted the supplier";
		
		if (flag != true) 
		{
			msg = "Not able to delete the supplier";
		}
		model.addAttribute("Message", msg);
		
		log.debug("Ending of the method deleteSupplier");
		return "forward:/Manage_Supplier";
	}

	@RequestMapping(value="/Manage_Supplier_Edit/{id}", method = RequestMethod.GET)
	public String editSupplier(@PathVariable("id") String id,RedirectAttributes attributes) {
				
           attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierByID(id));
		
	
		return "redirect:/Manage_Supplier";
	}
}
