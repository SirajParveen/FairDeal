package com.niit.fairdeal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;

	@PostMapping("/Supplier_Create")
	public ModelAndView createSupplier(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("address") String address) {

		supplier.setID(id);
		supplier.setName(name);
		supplier.setAddress(address);

		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isUserClickedSupplier", "true");

		if (supplierDAO.createSupplier(supplier)) {
			modelAndView.addObject("Message", "Successfully Created Supplier");
		} 
		else {
			modelAndView.addObject("Message", "Supplier Not Created");
		}
		List<Supplier> supplierList = supplierDAO.getAllSuppliers();
		modelAndView.addObject("supplierList",supplierList);
		modelAndView.addObject("supplier",supplier);
		return modelAndView;
	}

	@RequestMapping("/Supplier_Delete/{id}")
	public ModelAndView deleteSupplier(@PathVariable("id") String id) {
		supplier.setID(id);

		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isUserClickedSupplier", "true");

		if (supplierDAO.deleteSupplier(supplier)) {
			modelAndView.addObject("Message", "Successfuly Deleted Supplier");
		} 
		else {
			modelAndView.addObject("Message", "Supplier Not Deleted");
		}
		List<Supplier> supplierList = supplierDAO.getAllSuppliers();
		modelAndView.addObject("supplierList",supplierList);
		modelAndView.addObject("supplier",supplier);
		return modelAndView;
	}

	@GetMapping("/Supplier_Edit/{id}")
	public ModelAndView editSupplier(@PathVariable("id") String id) {
		
		supplier.setID(id);

		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");

		modelAndView.addObject("isUserClickedSupplier", "true");

		if (supplierDAO.updateSupplier(supplier)) {
			modelAndView.addObject("Message", "Successfuly Edited Supplier");
		} else {
			modelAndView.addObject("Message", "Supplier Not Edited");
		}
		return modelAndView;
	}
}
