package com.skilldistillery.mustangrestoration.controllers;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	//old method that does work
//	@GetMapping(path = "getPart.do", params = "partId")
//	public String getPartById(@RequestParam("partId") int id, Model model) {
//		String viewName = "part/show";
//		Part part = partDAO.findById(id);
//
//		model.addAttribute("part", part);
//		return viewName;
//	}
	
	//new method with error handling
	@GetMapping(path = "getPart.do", params = "partId")
	public String getPartById(@RequestParam("partId") int id, Model model) {
	    String viewName = "part/show";
	    Part part = partDAO.findById(id);

	    if (part == null) {
	        // Log statement for debugging
	        System.out.println("No part found with ID: " + id);
	        throw new IllegalArgumentException("Part with ID " + id + " not found.");
	    }

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

	//old addPart without adding photo
//	@PostMapping("addPart.do")
//	public String createPart(Part part, Model model) {
//		part = partDAO.addPart(part);
//		model.addAttribute("part", part);
//		return "part/show"; // Redirect to the part details page
//	}
	
	//new addPart with adding photo
	@PostMapping("addPart.do")
	public String createPart(@ModelAttribute Part part, @RequestParam("photo") MultipartFile photo, Model model) {
	    if (!photo.isEmpty()) {
	        // Call savePhoto method to save the photo and get the path
	        String photoPath = savePhoto(photo); 
	        part.setPhotoURL(photoPath); 
	    }
	    part = partDAO.addPart(part);
	    model.addAttribute("part", part);
	    return "part/show"; // Redirect to the part details page
	}
	
	// Method to save photo to the file system and return the path
	private String savePhoto(MultipartFile photo) {
	    // Define the directory where to save the photo
	    String directoryPath = "/path/to/photos/";
	    // Create a unique filename for the photo, could use the original name or generate a new one
	    String photoName = photo.getOriginalFilename(); 
	    String photoPath = directoryPath + photoName;

	    // Save the photo
	    try {
	        File file = new File(photoPath);
	        photo.transferTo(file);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    return photoPath; // Return the saved photo path
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
    
    @GetMapping("viewAllParts.do")
    public String viewAllParts(Model model) {
        List<Part> parts = partDAO.findAll(); 
        model.addAttribute("parts", parts);
        return "part/partsList"; // JSP page that displays the list
    }
}
