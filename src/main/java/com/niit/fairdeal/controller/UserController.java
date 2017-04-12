package com.niit.fairdeal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.niit.fairdeal.dao.UserDAO;
import com.niit.fairdeal.domain.User;

@Controller
public class UserController {
	
	public static Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = "/Registration", method = RequestMethod.POST)
	public String registerUser(@ModelAttribute User user, Model model) 
	{
		log.debug("Starting of the method registerUser");
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		userDAO.createUser(user);
		model.addAttribute("SuccessRegister", "Successfully Registered. Thank You !!!");
		log.debug("Ending of the method registerUser");
		return "HomePage";
	}
}
