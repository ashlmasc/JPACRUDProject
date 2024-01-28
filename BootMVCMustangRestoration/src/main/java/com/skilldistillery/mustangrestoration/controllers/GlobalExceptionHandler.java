package com.skilldistillery.mustangrestoration.controllers;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class) // Catch all other exceptions
	public String handleGeneralException(Exception ex, Model model) {
		model.addAttribute("errorMessage", "An unexpected error has occurred: " + ex.getMessage());
		return "part/error"; // Generic error view
	}

	@ExceptionHandler(IllegalArgumentException.class)
    public String handleIllegalArgumentException(IllegalArgumentException ex, Model model) {
		
		// Log statement for debugging
	    System.out.println("Handling IllegalArgumentException: " + ex.getMessage());
		
        model.addAttribute("errorMessage", ex.getMessage());
        return "part/error"; // Use your existing error page
    }

		// add other exception handlers as needed
}
