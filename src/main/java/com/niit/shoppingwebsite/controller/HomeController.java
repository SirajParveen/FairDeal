package com.niit.shoppingwebsite.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDAO;
import com.niit.shoppingcart.domain.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private User user;
	
	@Autowired
	private HttpSession session;
	
	//Navigating to Home Page Statically
	@RequestMapping("/")
	public ModelAndView showHomePage()
	{
		//Specifying which page you have to navigate
		ModelAndView modelAndView = new ModelAndView("/Home");
		
		//Specifying what data you have to carry to home page
		modelAndView.addObject("msg", "Welcome To Shopping Cart");
		
		return modelAndView;
	}
	
	@RequestMapping("/Login")
	public ModelAndView showLoginPage()
	{
		//Specifying which page you have to navigate
		ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("isUserClickedLogin", "true");
		
		return modelAndView;
	}
	
	@RequestMapping("/Registration")
	public ModelAndView showRegistrationPage()
	{
		//Specifying which page you have to navigate
		ModelAndView modelAndView = new ModelAndView("/Home");
		modelAndView.addObject("isUserClickedRegistration", "true");
		
		return modelAndView;
	}
	
	@PostMapping("/Validate")
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
			modelAndView.addObject("ErrorMessage", "Invalid Credentials");
		}
		return modelAndView;
	}
	
	@RequestMapping("/Logout")
	public ModelAndView Logout()
	{
		
		ModelAndView modelAndView = new ModelAndView("/Home");
		//session.invalidate();
		session.removeAttribute("LoginMessage");
		return modelAndView;
	}
	
	@RequestMapping("/Home")
	public ModelAndView HomeMethod()
	{
		ModelAndView modelAndView = new ModelAndView("/Home");
		return modelAndView;
	}
}