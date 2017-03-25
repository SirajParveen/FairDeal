package com.niit.fairdeal.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.CartDAO;
import com.niit.fairdeal.dao.CategoryDAO;
import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.dao.SupplierDAO;
import com.niit.fairdeal.domain.Cart;
import com.niit.fairdeal.domain.Category;
import com.niit.fairdeal.domain.Product;
import com.niit.fairdeal.domain.Supplier;

@Controller
public class SpringSecurityController {
	
	public static Logger log = LoggerFactory.getLogger(SpringSecurityController.class);
	
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private Cart cart;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private Category category;

	@Autowired
	private SupplierDAO supplierDAO;

	@Autowired
	private Supplier supplier;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;

	@Autowired
	private HttpSession session;

		//authentication-failure-forward-url="/loginError"
		@RequestMapping(value = "/loginError", method = RequestMethod.GET)
		public String loginError(Model model) {
			
			log.debug("Starting of the method loginError");
			model.addAttribute("errorMessage", "Invalid Credentials !!! Please try again.");
			model.addAttribute("invalidCredentials", "true");
			log.debug("Ending of the method loginError");
			return "Home";
		}
		
		//<security:access-denied-handler error-page="/accessDenied" />
		@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
		public String accessDenied(Model model) {
			
			log.debug("Starting of the method accessDenied");
			model.addAttribute("errorMessage", "You are not authorized to access this page");
			log.debug("Ending of the method accessDenied");
			return "Home";
		}
		

		/*@RequestMapping(value = "login_session_attribute")
		public String login_session_attributes(HttpSession session,Model model) {
			
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
			    	
			    	 return "redirect:/";
			     }
			     else 
			     {
			    	 session.setAttribute("isAdmin", "true");
			    	model.addAttribute("product",  new Product());
			    	 model.addAttribute("isAdminClickedProduct", "true");
			    	 model.addAttribute("supplierList",supplierDAO.getAllSuppliers());
			    	 model.addAttribute("categoryList",categoryDAO.getAllCategories());
				 return "/Admin/AdminHome";
			     }
		}
			return "/Home";
		
		}*/
		
		
		
		@RequestMapping(value = "login_session_attribute", method = RequestMethod.GET)
		public ModelAndView login_session_attribute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			log.debug("starting of the method validate");
			ModelAndView mv = new ModelAndView("/Home");
			
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String username = auth.getName();
			session.setAttribute("loggedInUser", username);

			if (request.isUserInRole("ROLE_ADMIN")) {

				session.setAttribute("isAdmin", true);

			} else {

				session.setAttribute("isAdmin", false);
				
				mv.addObject("Cart", cart);
				
				List<Cart> cartList = cartDAO.getAllCarts(username);
				mv.addObject("cartList", cartList);
				mv.addObject("cartSize", cartList.size());
				mv.addObject("totalAmount", cartDAO.getTotalAmount(username));

				

			}
			log.debug("Ending of the method validate");
			return mv;
		}
		
		
		
		
	/*	@SuppressWarnings("unchecked")
		@RequestMapping(value = "/login")
		public String checkData(HttpSession session,Model model,User user1) {
			log.info("login operation start");
			System.err.println("Validate method");
			String username = SecurityContextHolder.getContext().getAuthentication().getName();
			System.out.println("User Name: "+username);
			user1 = userDAO.getUserByID(user1.getId());
			System.out.println(user1);
			
			session.setAttribute("userId", user1.getId());
			session.setAttribute("name", user1.getName());
			session.setAttribute("LoggedIn", "true");
			System.out.println(session.getAttribute("userId"));

			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
			.getAuthentication().getAuthorities();
			String role="ROLE_USER";
			for (GrantedAuthority authority : authorities) 
			{
			  
			     if (authority.getAuthority().equals(role)) 
			     {
			    	 session.setAttribute("UserLoggedIn", "true");
			    	 session.setAttribute("cartsize",cartDAO.cartsize((int)session.getAttribute("userId"))"");
			     }
			     else 
			     {
			    	 session.setAttribute("isAdmin", "true");
			    	 model.addAttribute("product",  new Product());
			    	 model.addAttribute("isAdminClickedProduct", "true");
			    	 model.addAttribute("isAdminClickedCategory", "true");
			    	 model.addAttribute("isAdminClickedSupplier", "true");
			    	 model.addAttribute("supplerList",supplierDAO.getAllSuppliers());
			    	 model.addAttribute("categoryList",categoryDAO.getAllCategories());
			    	 return "Admin/AdminHome";
				 }
			}
			return "Home";
		}
		
		
		
		
		*/
		@RequestMapping("/secure_logout")
		public ModelAndView secureLogout()
		{
			log.debug("Starting of the method secureLogout");
			//what you attach to session at the time of login need to remove
			session.invalidate();
			ModelAndView modelAndView = new ModelAndView("/");
			
			//After logout user should be able to browse category and product
			//as we invalidate() session, need to load these data again
			
			session.setAttribute("category", category);
			session.setAttribute("product", product);
			session.setAttribute("supplier", supplier);
			
			session.setAttribute("categoryList", categoryDAO.getAllCategories());
			session.setAttribute("productList", productDAO.getAllProducts());
			session.setAttribute("supplierList", supplierDAO.getAllSuppliers());
			
			log.debug("Ending of the method secureLogout");
			return modelAndView;
			
			//or simply remove only one attribute from session
			//session.removeAttribute("loggedInUser");//you no need to load category,supplier, product
		}		
}
