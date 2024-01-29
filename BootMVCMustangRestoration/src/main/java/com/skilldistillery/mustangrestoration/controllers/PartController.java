package com.skilldistillery.mustangrestoration.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.mustangrestoration.data.PartDAO;
import com.skilldistillery.mustangrestoration.entities.Part;

@Controller
public class PartController {

	@Autowired
	private PartDAO partDAO;

	@GetMapping({ "/", "home.do" })
	public String index() {
		return "home";
	}

	// new method with error handling
	@GetMapping("getPart.do")
	public String getPart(@RequestParam("partId") int id, Model model) {
	    Part part = partDAO.findById(id);
	    if (part == null) {
	        model.addAttribute("errorMessage", "No part found with ID: " + id);
	        return "error";
	    } else {
	        model.addAttribute("part", part);
	        return "show"; 
	    }
	}

	// Create a new part
	@GetMapping("addPart.do")
	public String addPartForm() {
		return "addPart"; // Path to the JSP form for adding a new part
	}

	// addPart without adding photo
	@PostMapping("addPart.do")
	public String createPart(Part part, Model model) {
	    try {
	        part = partDAO.addPart(part);
	        model.addAttribute("part", part);
	        return "show"; // Redirect to the part details page
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Error creating part: " + e.getMessage());
	        return "error"; // Assuming you have an error view to handle errors
	    }
	}

	// new addPart with adding photo...not ready yet
//	@PostMapping("addPart.do")
//	public String createPart(@ModelAttribute Part part, @RequestParam("photo") MultipartFile photo, Model model) {
//	    try {
//	        if (!photo.isEmpty()) {
//	            String photoPath = savePhoto(photo); // Ensure this can throw IOException
//	            part.setPhotoURL(photoPath);
//	        }
//	        part = partDAO.addPart(part);
//	        model.addAttribute("part", part);
//	        return "show";
//	    } catch (IOException e) {
//	        model.addAttribute("errorMessage", "Error saving photo: " + e.getMessage());
//	        return "error"; // Assuming you have a part/error.jsp to handle errors
//	    } catch (Exception e) {
//	        model.addAttribute("errorMessage", "An unexpected error has occurred: " + e.getMessage());
//	        return "error";
//	    }
//	}

	// Method to save photo to the file system and return the path
//	private String savePhoto(MultipartFile photo) throws IOException {
//	    String directoryPath = "/path/to/photos/"; // Ensure this path exists and is writable
//	    String uniquePrefix = UUID.randomUUID().toString();
//	    String photoName = uniquePrefix + "_" + photo.getOriginalFilename();
//	    String photoPath = directoryPath + photoName;
//
//	    File file = new File(photoPath);
//	    if (!file.getParentFile().exists()) {
//	        file.getParentFile().mkdirs(); // Create the directory path if it doesn't exist
//	    }
//	    photo.transferTo(file); // This is where IOException might be thrown
//	    return photoPath;
//	}

	@PostMapping("deletePart.do")
	public String deletePart(@RequestParam("partId") int id, Model model) {
		boolean isDeleted = partDAO.deletePart(id);
		if (!isDeleted) {
			model.addAttribute("message", "Part could not be deleted.");
		} else {
			model.addAttribute("message", "Part successfully deleted.");
		}
		return "deletePart";
	}

	// Update an existing part
	@GetMapping("updatePart.do")
	public String updatePartForm(@RequestParam("partId") int id, Model model) {
		try {
			Part part = partDAO.findById(id);
			if (part == null) {
				throw new IllegalArgumentException("Part with ID " + id + " not found.");
			}
			model.addAttribute("part", part);
			return "updatePart"; // Path to the JSP form for updating a part
		} catch (IllegalArgumentException e) {
			model.addAttribute("errorMessage", e.getMessage());
			return "error";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "An unexpected error has occurred while attempting to update the part.");
			return "error"; // General error page
		}
	}

	@PostMapping("updatePart.do")
	public String updatePart(@RequestParam("partId") int id, Part part, Model model) {
	    part = partDAO.updatePart(id, part);
	    model.addAttribute("part", part); // Add the updated part to the model
	    return "updateConfirmation"; // Redirect to the confirmation page
	}

	@GetMapping("viewAllParts.do")
	public String viewAllParts(Model model) {
		List<Part> parts = partDAO.findAll();
		model.addAttribute("allParts", parts);
		return "tableFormatPage"; // JSP page that displays the list
	}
	
	@GetMapping("viewAllPartsList.do")
    public String listParts(Model model) {
        List<Part> parts = partDAO.findAll();
        model.addAttribute("allParts", parts);
        // Return the view name for the list format page
        return "listFormatPage";
    }
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e, Model model) {
	    model.addAttribute("errorMessage", e.getMessage());
	    return "error"; // Consistent error view
	}
}
