package com.niit.fairdeal.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.CartDAO;
import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.dao.UserDAO;
import com.niit.fairdeal.domain.Product;
import com.niit.fairdeal.domain.User;

@Controller
public class SpringSecurityController {
	
	public static Logger log = LoggerFactory.getLogger(SpringSecurityController.class);
	
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private UserDAO userDAO;

	@Autowired
	private HttpSession session;
		
		//authentication-failure-forward-url="/loginError"
		@RequestMapping(value = "/loginError", method = RequestMethod.GET)
		public String loginError(Model model) 
		{
			log.debug("Starting of the method loginError");
			model.addAttribute("errorMessage", "Invalid Credentials !!! Please Try Again");
			log.debug("Ending of the method loginError");
			return "HomePage";
		}
		
		//<security:access-denied-handler error-page="/accessDenied" />
		@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
		public String accessDenied(Model model) {
			
			log.debug("Starting of the method accessDenied");
			model.addAttribute("errorMessage", "You are not authorized to access this page");
			log.debug("Ending of the method accessDenied");
			return "HomePage";
		}
		
		@RequestMapping(value = "/login_session_attribute")
		public String login_session_attribute(HttpSession session,Model model) {
			
			log.debug("Starting of the method login_session_attribute");
			
			String username = SecurityContextHolder.getContext().getAuthentication().getName();
			User user = userDAO.getUserByName(username);
			session.setAttribute("userid", user.getId());
			session.setAttribute("name", user.getName());
			session.setAttribute("LoggedIn", "true");

			@SuppressWarnings("unchecked")
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
			.getAuthentication().getAuthorities();
			
			String role="ROLE_USER";
			
			for (GrantedAuthority authority : authorities) 
			{
			  
			     if (authority.getAuthority().equals(role)) 
			     {
			    	 session.setAttribute("UserLoggedIn", "true");
			    	 session.setAttribute("cartsize",cartDAO.cartsize((Integer)session.getAttribute("userid")));
			    	 return "redirect:/HomePage";
			     }
			     else 
			     {
			    	 session.setAttribute("isAdmin", "true");
			    	model.addAttribute("product",  new Product());
			    	 model.addAttribute("isUserClickedProduct", "true");
			    	 model.addAttribute("supplierList",supplierDAO.getAllSuppliers());
			    	 model.addAttribute("categoryList",categoryDAO.getAllCategories());
				 return "/Admin/AdminHome";
			     }
		}
			log.debug("Ending of the method login_session_attribute");
			return "/HomePage";
		}
		
		@RequestMapping("/perform_logout")
		public ModelAndView performLogout()
		{
			log.debug("Starting of the method secureLogout");
			
			//what you attach to session at the time of login need to remove
			session.invalidate();
		
			ModelAndView modelAndView = new ModelAndView("/HomePage");
			
			log.debug("Ending of the method secureLogout");
			return modelAndView;
			//or simply remove only one attribute from session
			//session.removeAttribute("loggedInUser");//you no need to load category,supplier, product
		}		
}