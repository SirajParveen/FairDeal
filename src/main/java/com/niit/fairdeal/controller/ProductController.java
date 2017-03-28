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

import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.domain.Product;

@Controller
public class ProductController {
	
	private static Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;

	@RequestMapping(value = "/Manage_Product_Create", method = RequestMethod.POST)
	public String createProduct(@ModelAttribute("product") Product product, Model model)
	{	
		log.debug(" Starting of the method createProduct");
		log.info("id: " +product.getId());
		
		if(productDAO.createProduct(product) == true)
		{
			model.addAttribute("Message", "Successfully Created the Product");
		}
		else
		{
			model.addAttribute("Message", "Product Not Created");
		}
		model.addAttribute("product",product);
		model.addAttribute("productList",productDAO.getAllProducts());
		model.addAttribute("isAdminClickedProduct", "true");
		
		log.debug(" Ending of the method createProduct");
		return "redirect:/Manage_Product";
	}
	
	@GetMapping("/Manage_Product_Delete/{id}")
	public String deleteProduct(@PathVariable("id") int id)
	{
		log.debug("Starting of the method deleteProduct");
		
		product.setId(id);
		productDAO.deleteProduct(product);
	
		log.debug("Ending of the method deleteProduct");
		return "redirect:/Manage_Product";
	}
	
	@RequestMapping(value= "/Manage_Product_Edit/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable("id") int id, RedirectAttributes attributes)
	{
		log.debug("Starting of the method editProduct");

		attributes.addFlashAttribute("product", this.productDAO.getProductByID(id));
		
		log.debug("Ending of the method editProduct");
		return "redirect:/Manage_Product";
	}
	
	@RequestMapping(value= "/Manage_Product_Update")
	public String updateProduct(@ModelAttribute("product") Product product) 
	{
		log.debug("Starting of the method updateProduct");
		
		productDAO.updateProduct(product);
		
		log.debug("Ending of the method updateProduct");
		return "redirect:/Manage_Product";
	}	
}
