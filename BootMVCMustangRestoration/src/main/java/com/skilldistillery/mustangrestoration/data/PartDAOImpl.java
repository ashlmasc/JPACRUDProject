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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Part updatePart(int id, Part part) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deletePart(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
