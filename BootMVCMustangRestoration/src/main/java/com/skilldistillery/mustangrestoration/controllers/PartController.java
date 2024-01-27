package com.skilldistillery.mustangrestoration.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	// Create a new part
	@GetMapping("addPart.do")
	public String addPartForm() {
		return "part/addPart"; // Path to the JSP form for adding a new part
	}

	@PostMapping("addPart.do")
	public String createPart(Part part, Model model) {
		part = partDAO.addPart(part);
		model.addAttribute("part", part);
		return "part/show"; // Redirect to the part details page
	}

	// Delete an existing part
	@GetMapping("deletePart.do")
	public String deletePart(@RequestParam("partId") int id, Model model) {
		boolean deleted = partDAO.deletePart(id);
		if (deleted) {
			return "redirect:/"; // Redirect to the home page if deletion was successful
		} else {
			model.addAttribute("error", "Part deletion failed");
			return "error"; // Redirect to an error page or a confirmation page
		}
	}
	
	// Update an existing part
    @GetMapping("updatePart.do")
    public String updatePartForm(@RequestParam("partId") int id, Model model) {
        Part part = partDAO.findById(id);
        model.addAttribute("part", part);
        return "part/updatePart"; // Path to the JSP form for updating a part
    }

    @PostMapping("updatePart.do")
    public String updatePart(@RequestParam("partId") int id, Part part, Model model) {
        part = partDAO.updatePart(id, part);
        model.addAttribute("part", part);
        return "part/show"; // Redirect to the part details page
    }
}
