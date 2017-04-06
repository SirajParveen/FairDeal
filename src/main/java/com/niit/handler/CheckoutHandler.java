package com.niit.handler;

import org.springframework.stereotype.Service;

import com.niit.model.Cart;

@Service
public class CheckoutHandler 
{
	
public String cardPayment(Cart cart)	
	{	
		return "true";	
	}

	 public String paymentMethod(Cart cart)
	 {
		System.out.println("method");
		String method=cart.getMethod();
		System.out.println(method);
		if(method.equals("cod"))
		{	
			return "cod";
		}
		else 
		{
			return "card";
		}
	 }
}