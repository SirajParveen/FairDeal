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

import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Supplier;

@Controller
public class SupplierController {
	
	private static Logger log = LoggerFactory.getLogger(SupplierController.class);

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;

	@RequestMapping(value = "/Manage_Supplier_Create", method = RequestMethod.POST)
	public String createSupplier(@ModelAttribute("supplier") Supplier supplier, Model model) {

		log.debug(" Starting of the method createSupplier");
		log.info("id: " +supplier.getId());
		
		if (supplierDAO.createSupplier(supplier) == true) {
			
			model.addAttribute("Message", "Successfully Created Supplier");
		} 
		else 
		{
			model.addAttribute("Message", "Supplier Not Created");
		}
		model.addAttribute("supplier", supplier);
		model.addAttribute("supplierList", supplierDAO.getAllSuppliers());
		model.addAttribute("isAdminClickedSupplier", "true");
		
		log.debug(" Ending of the method createSupplier");
		return "redirect:/Manage_Supplier";
	}

	@GetMapping("/Manage_Supplier_Delete/{id}")
	public String deleteSupplier(@PathVariable("id") int id)
	{
		log.debug("Starting of the method deleteSupplier");
		
		supplier.setId(id);
		supplierDAO.deleteSupplier(supplier);
		
		log.debug("Ending of the method deleteSupplier");
		return "redirect:/Manage_Supplier";
	}

	@RequestMapping(value= "/Manage_Supplier_Edit/{id}", method = RequestMethod.GET)
	public String editSupplier(@PathVariable("id") int id,RedirectAttributes attributes) 
	{
		log.debug("Starting of the method editSupplier");	
		
		attributes.addFlashAttribute("supplier", this.supplierDAO.getSupplierByID(id));
		
		log.debug("Ending of the method editSupplier");
		return "redirect:/Manage_Supplier";
	}
	
	@RequestMapping(value= "/Manage_Supplier_Update")
	public String updateSupplier(@ModelAttribute("supplier") Supplier supplier) 
	{
		log.debug("Starting of the method updateSupplier");
		
		supplierDAO.updateSupplier(supplier);
		
		log.debug("Ending of the method updateSupplier");
		return "redirect:/Manage_Supplier";
	}
}
