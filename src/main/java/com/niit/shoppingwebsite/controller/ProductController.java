package com.niit.shoppingwebsite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.domain.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private Product product;

	@PostMapping("/Product_Create")
	public String createProduct(@ModelAttribute("product") Product product, Model model)
	{
		/*product.setID(id);
		product.setName(name);
		product.setPrice(price);
		product.setDescription(description);
		product.setCategory_ID(category_id);
		product.setSupplier_ID(supplier_id);
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedProduct", "true");*/
		
		if(productDAO.createProduct(product))
		{
			model.addAttribute("Message", "Successfully Created Product");
		}
		else
		{
			model.addAttribute("Message", "Product Not Created");
		}

		model.addAttribute("productList",productDAO.getAllProducts());
		model.addAttribute("product",product);
		return "forward:/Manage_Product";
	}
	
	@RequestMapping("/Product_Delete/{id}")
	public ModelAndView deleteProduct(@PathVariable("id") String id)
	{
		product.setID(id);
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedProduct", "true");
		
		if(productDAO.deleteProduct(product))
		{
			modelAndView.addObject("Message", "Successfuly Deleted Product");
		}
		else
		{
			modelAndView.addObject("Message", "Product Not Deleted");
		}
		List<Product> productList = productDAO.getAllProducts();
		modelAndView.addObject("productList",productList);
		modelAndView.addObject("product",product);
		return modelAndView;
	}
	
	@GetMapping("/Product_Edit/{id}")
	public ModelAndView editProduct(@PathVariable("id") String id)
	{
		product.setID(id);
		
		ModelAndView modelAndView = new ModelAndView("/Admin/AdminHome");
		
		modelAndView.addObject("isUserClickedProduct", "true");
		
		if(productDAO.updateProduct(product))
		{
			modelAndView.addObject("Message", "Successfuly Edited Product");
		}
		else
		{
			modelAndView.addObject("Message", "Product Not Edited");
		}
		return modelAndView;
	}
}
