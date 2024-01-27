package com.skilldistillery.mustangrestoration.data;

import java.util.List;

import com.skilldistillery.mustangrestoration.entities.Part;

public interface PartDAO {
	Part findById(int partId);
	
	List<Part> findAll();
}
