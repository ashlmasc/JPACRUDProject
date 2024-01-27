package com.skilldistillery.mustangrestoration.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mustangrestoration.data.PartDAO;
import com.skilldistillery.mustangrestoration.entities.Part;

@Controller
public class PartController {

	@Autowired
	private PartDAO partDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String index() {
		// return "WEB-INF/home.jsp"; // with no ViewResolver
		return "home"; // if using a ViewResolver.
	}

	@GetMapping(path = "getPart.do", params = "partId")
	public String getPartById(@RequestParam("partId") int id, Model model) {
		String viewName = "part/show";
		Part part = partDAO.findById(id);

		model.addAttribute("part", part);
		return viewName;
	}

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String index(Model model) {
		List<Part> parts = partDAO.findAll();
		model.addAttribute("parts", parts);
		return "home";
	}
}
