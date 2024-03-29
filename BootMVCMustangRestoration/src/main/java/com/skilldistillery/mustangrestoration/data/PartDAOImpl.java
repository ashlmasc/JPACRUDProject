package com.skilldistillery.mustangrestoration.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.mustangrestoration.entities.Part;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class PartDAOImpl implements PartDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Part findById(int partId) {
		Part part = em.find(Part.class, partId);
		return part;
	}

	@Override
	public List<Part> findAll() {
		return em.createQuery("SELECT part FROM Part part", Part.class).getResultList();
	}

	@Override
	public Part addPart(Part part) {
		em.persist(part); // Persist the part entity to the database
	    return part; // The persisted part will now have a generated ID
	}

	@Override
	public Part updatePart(int id, Part updatedPart) {
	    Part existingPart = em.find(Part.class, id);
	    if (existingPart != null && updatedPart != null) {
            existingPart.setPartName(updatedPart.getPartName());
            existingPart.setCategory(updatedPart.getCategory());
            existingPart.setCondition(updatedPart.getCondition());
            existingPart.setPurchasePrice(updatedPart.getPurchasePrice());
            existingPart.setSupplierName(updatedPart.getSupplierName());
            existingPart.setDatePurchased(updatedPart.getDatePurchased());
            existingPart.setStatus(updatedPart.getStatus());
            existingPart.setInstallationNotes(updatedPart.getInstallationNotes());
            existingPart.setWarrantyInfo(updatedPart.getWarrantyInfo());
            existingPart.setVehicleSection(updatedPart.getVehicleSection());
            
         // Explicitly merge the updated entity
            em.merge(existingPart);
        }
        return existingPart;
    }

	@Override
	public boolean deletePart(int id) {
		Part part = em.find(Part.class, id); // Find the part by ID
	    if (part != null) {
	        em.remove(part); // Remove the part entity
	        return true;
	    }
	    return false;
	}
}
