package com.niit.fairdeal.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
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
	
	private Path path;
	
	@RequestMapping(value="/Manage_Product_Create")
	public String createProduct(@ModelAttribute("product") Product product,HttpServletRequest request,Model m)
	{
		log.debug("Starting of the method createProduct");
		productDAO.createProduct(product);
		MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\resources\\images\\"+product.getId()+".jpg");
        if (file != null && !file.isEmpty()) {
            try {
            	System.out.println("Image Saving Start");
            	file.transferTo(new File(path.toString()));
            	System.out.println("Image Saved");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error");
                throw new RuntimeException("Item Image Saving Failed...!!!", e);
            }
        }
        log.debug("Ending of the method createProduct");
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
	
	@RequestMapping(value= "/Manage_Product_Edit/{id}")
	public String editProduct(@PathVariable("id") int id, RedirectAttributes attributes)
	{
		log.debug("Starting of the method editProduct");

		attributes.addFlashAttribute("product", this.productDAO.getproduct(id));
		
		log.debug("Ending of the method editProduct");
		return "redirect:/Manage_Product";
	}
	
	@RequestMapping(value= "/Manage_Product_Update")
	public String updateProduct(@ModelAttribute("product") Product product, HttpServletRequest request,Model m) 
	{
		log.debug("Starting of the method updateProduct");
		
		productDAO.updateProduct(product);
		MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        path = Paths.get(rootDirectory + "\\resources\\images\\"+product.getId()+".jpg");
        if (file != null && !file.isEmpty()) {
            try {
            	System.out.println("Image Saving Start");
            	file.transferTo(new File(path.toString()));
            	System.out.println("Image Saved");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error");
                throw new RuntimeException("Item Image Saving Failed...!!!", e);
            }
        }
		log.debug("Ending of the method updateProduct");
		return "redirect:/Manage_Product";
	}	
}
