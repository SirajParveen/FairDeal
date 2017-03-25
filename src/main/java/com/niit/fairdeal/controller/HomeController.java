package com.niit.fairdeal.controller;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Category;
import com.niit.fairdeal.domain.Product;
import com.niit.fairdeal.domain.Supplier;
import com.niit.fairdeal.domain.User;

@Controller
public class HomeController {
	
	Logger log = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private Supplier supplier;
	
	@Autowired
	private HttpSession session;
	
	
	@Autowired
	private User user;
	
	//http://localhost:8080/FairDeal/
	@RequestMapping("/")
	public ModelAndView showHomePage()
	{	
		log.debug("Starting of the method showHomePage");
		
		ModelAndView modelAndView = new ModelAndView("/Home");
		
		session.setAttribute("category", category);
		session.setAttribute("product", product);
		session.setAttribute("supplier", supplier);
		
		session.setAttribute("user",new User());
		session.setAttribute("categoryList", categoryDAO.getAllCategories());
		session.setAttribute("productList", productDAO.getAllProducts());
		session.setAttribute("supplierList", supplierDAO.getAllSuppliers());
		
		log.debug("Ending of the method showHomePage");
		return modelAndView;
	}
	
	@RequestMapping("/login")
	public ModelAndView showLoginPage()
	{
		
		System.err.println("Login method");
		log.debug("Starting of the method showLoginPage");
		
		//Specifying which page you have to navigate
		ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("user", user);
		modelAndView.addObject("isUserClickedLogin", "true");
		
		log.debug("Ending of the method showLoginPage");
		
		return modelAndView;
	}
	
	@RequestMapping("/Registration")
	public ModelAndView showRegistrationPage()
	{
		log.debug("Starting of the method showRegistrationPage");
		
		//Specifying which page you have to navigate
		ModelAndView modelAndView = new ModelAndView("/Home");
		
		modelAndView.addObject("user", user);
		modelAndView.addObject("isUserClickedRegistration", "true");
		
		log.debug("Ending of the method showRegistrationPage");
		return modelAndView;
	}

	
	/*@PostMapping("/Validate")
	public ModelAndView validateCredentials(@RequestParam("User ID") String id, 
			@RequestParam("Password") String psw)
	{	
		ModelAndView modelAndView= new ModelAndView("/Home");
		
		modelAndView.addObject("isUserLoggedIn", "false");
				
		if(userDAO.validateUser(id, psw) == true)
		{
			//modelAndView.addObject("isUserLoggedIn", "true");
			
			user = userDAO.getUserByID(id);
			
			if(user.getRole().equals("Admin"))
			{
				modelAndView.addObject("isAdmin", "true");
			}
			else
			{
				modelAndView.addObject("isAdmin", "false");
			}
			session.setAttribute("LoginMessage", "Welcome "+user.getName());
		}
		else
		{
			modelAndView.addObject("ErrorMessage", "Please enter a valid USER ID and PASSWORD");
		}
		return modelAndView;
	}*/
	
	/*@RequestMapping("/Logout")
	public ModelAndView Logout()
	{
		
		ModelAndView modelAndView = new ModelAndView("/Home");
		//session.invalidate();
		session.removeAttribute("LoginMessage");
		return modelAndView;
	}*/
	
	@RequestMapping("/Home")
	public String redirectToHome(@ModelAttribute("selectedProduct") final Product selectedProduct, final Model model)
	{
		log.debug("Starting of the method reDirectToHome");
		
		/*ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("isUserClickedHome", "true");*/
		
		model.addAttribute("selectedProduct", selectedProduct);
		model.addAttribute("user", user);
		
		log.debug("Ending of the method reDirectToHome");
		return "/Home";
	}
	
	@RequestMapping("/Cart")
	public ModelAndView showCartPage()
	{
		log.debug("Starting of the method showCartPage");
		
		ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("isUserClickedCart", "true");
		
		log.debug("Ending of the method showCartPage");
		return modelAndView;
	}
}