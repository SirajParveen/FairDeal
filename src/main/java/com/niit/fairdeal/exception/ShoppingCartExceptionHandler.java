package com.niit.fairdeal.exception;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.hql.internal.ast.QuerySyntaxException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.CannotCreateTransactionException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ShoppingCartExceptionHandler {
	
private static final Logger log = LoggerFactory.getLogger(ShoppingCartExceptionHandler.class);

	@ExceptionHandler(SQLException.class)
	public ModelAndView handleSQLException(Exception e)
	{
		log.debug("Starting of the method handleSQLException ");    
		
		ModelAndView mv = new ModelAndView("error");
		// ModelAndView mv = new ModelAndView("error");
	    mv.addObject("message", "It seems one of the table OR few fields does not exist in DB. "
	      		+ "  See the logger for more information");
	    mv.addObject("errorMessage", e.getMessage());
	    
	    log.debug("Ending of the method handleSQLException ");  
		return mv;
	}

@ExceptionHandler(CannotCreateTransactionException.class)
public ModelAndView dbServerNotStarted( Exception e)
{
	log.debug("Starting of the method dbServerNotStarted "); 
	
	  ModelAndView mv = new ModelAndView("error");
			// ModelAndView mv = new ModelAndView("error");
      mv.addObject("message", "It seems Database server not started");
      mv.addObject("errorMessage", e.getMessage());
	
    log.debug("Ending of the method dbServerNotStarted ");    
	return mv;
}
	
	@ExceptionHandler(QuerySyntaxException.class)
	public ModelAndView handleQuerySyntaxException(Exception e)
	{
		  log.debug("Starting of the method handleQuerySyntaxException ");  
		  
		  ModelAndView mv = new ModelAndView("error");
			// ModelAndView mv = new ModelAndView("error");
		   mv.addObject("message", "It seems one of the query is not proper See the logger for more information");
		      mv.addObject("errorMessage", e.getMessage());
			
		log.debug("Ending of the method handleQuerySyntaxException ");  
		return mv;
	}
	@ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView noHandlerException(HttpServletRequest request, Exception e)   
	{
		  log.debug("Starting of the method noHandlerException ");  
		  
		  ModelAndView mv = new ModelAndView("error");
			// ModelAndView mv = new ModelAndView("error");
            mv.addObject("message", "No handler found.  Invalid URL See the logger for more information");
            
            mv.addObject("errorMessage", e.getMessage());  
            
            log.debug("Ending of the method noHandlerException ");  
            return mv;
    }
		
	//@ResponseStatus(value=HttpStatus.NOT_FOUND, reason="IOException occured")
	@ExceptionHandler(IOException.class)
	public ModelAndView handleIOException(Exception e)
	{
		  log.debug("Starting of the method handleIOException ");  
	      
		  ModelAndView mv = new ModelAndView("error");
			// ModelAndView mv = new ModelAndView("error");
          mv.addObject("message", "Not able to connect to server.  please contact administration");
  	      mv.addObject("errorMessage", e.getMessage());
		
  	    log.debug("Ending of the method handleIOException ");  
          return mv;
	}
}
