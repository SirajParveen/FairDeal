package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.domain.Product;

@Controller
public class ProductController {
	
	private static Logger log = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;
	
	@RequestMapping(value = "/Manage_Product", method = RequestMethod.GET)
	public String listProduct(Model model) {
		
		log.debug(" Starting of the method listProduct");
		
		model.addAttribute("product", product);
		model.addAttribute("productList", productDAO.getAllProducts());
		model.addAttribute("isAdminClickedProduct", "true");
		
		log.debug(" Ending of the method listProduct");
		return "forward:/Manage_Product";
	}

	@PostMapping("/Manage_Product_Create")
	public String createProduct(@ModelAttribute("product") Product product, Model model)
	{	
		log.debug(" Starting of the method createProduct");
		log.info("id:" + product.getID());
		
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
		return "forward:/Manage_Product";
	}
	
	@RequestMapping("/Manage_Product_Delete/{id}")
	public String deleteProduct(@PathVariable("id") String id, Model model) throws Exception
	{
		log.debug("Starting of the method deleteProduct");
		
		boolean flag = productDAO.deleteProduct(product);

		String msg = "Successfully deleted the product";
		
		if (flag != true) 
		{
			msg = "Not able to delete the product";
		}
		model.addAttribute("Message", msg);
		
		log.debug("Ending of the method deleteProduct");
		return "forward:/Manage_Product";
	}
	
	@GetMapping("/Manage_Product_Edit/{id}")
	public String editProduct(@PathVariable("id") String id, Model model)
	{
		log.debug("Starting of the method editProduct");

		productDAO.updateProduct(product);
		product = productDAO.getProductByID(id);
		
		model.addAttribute("product", product);
		
		log.debug("Ending of the method editProduct");
		return "forward:/Manage_Product";
	}
}
