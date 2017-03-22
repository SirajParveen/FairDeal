package com.niit.fairdeal.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.fairdeal.dao.CartDAO;
import com.niit.fairdeal.dao.ProductDAO;
import com.niit.fairdeal.domain.Cart;
import com.niit.fairdeal.domain.Product;

@Controller
public class CartController 
{
	Logger log = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartDAO cartDAO;

	@Autowired
	private Cart cart;

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession session;

	@RequestMapping(value = "/Cart", method = RequestMethod.GET)
	public String Cart(Model model) 
	{
		log.debug("Starting of the method Cart");
		
		model.addAttribute("Cart", new Cart());
		
		// get the logged-in user id
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");

		/*if (loggedInUserid == null) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
			@SuppressWarnings("unchecked")
			Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) auth.getAuthorities();
			authorities.contains("User");
			
		}*/
		
		if(loggedInUserid != null)
		{
		int cartSize = cartDAO.getAllCarts(loggedInUserid).size();

		if (cartSize == 0) {
			model.addAttribute("errorMessage", "You do not have any products in your Cart");
		}
		else 
		{
			model.addAttribute("cartList", cartDAO.getAllCarts(loggedInUserid));
			model.addAttribute("totalAmount", cartDAO.getTotalAmount(loggedInUserid));
			model.addAttribute("displayCart", "true");
			model.addAttribute("cart", cart);
		}
		}
		log.debug("Ending of the method Cart");
		return "/Home";
	}

	// For add and update Cart both
	@RequestMapping(value = "/Cart/add/{id}", method = RequestMethod.GET)
	public ModelAndView addToCart(@PathVariable("id") String id) 
	{
		log.debug("Starting of the method addToCart");
		
		// get the product based on product id
		Product product = productDAO.getProductByID(id);
		cart.setPrice(product.getPrice().length());
		cart.setProductName(product.getName());
		
		String loggedInUserid = (String) session.getAttribute("loggedInUserID");
		
		if (loggedInUserid == null) 
		{
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			loggedInUserid = auth.getName();
		}
		cart.setUserID(loggedInUserid);
	
		//It is not required if you given default value while creating the table
		// Status is New. Once it is dispatched, we can changed to 'D'
		cart.setStatus('N');
		
		//To get sequence number, you can do programmatically in DAOImpl
		//myCart.setId(ThreadLocalRandom.current().nextLong(100, 1000000 + 1));
							
		cartDAO.saveCart(cart);
		
		// return "redirect:/views/home.jsp";
		
		ModelAndView modelAndView = new ModelAndView("redirect:/Home");
		
		modelAndView.addObject("successMessage", " Successfuly added the product to Cart");
		
		log.debug("Ending of the method addToCart");
		
		return modelAndView;
	}
}
