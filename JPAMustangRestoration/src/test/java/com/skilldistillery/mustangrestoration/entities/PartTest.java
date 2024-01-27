package com.skilldistillery.mustangrestoration.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.mustangrestoration.entities.Part;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PartTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Part part;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	    emf = Persistence.createEntityManagerFactory("MustangRestoration");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	    emf.close();
	}
	
	@BeforeEach
	void setUp() throws Exception {
	    em = emf.createEntityManager();
	    part = em.find(Part.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		part = null;
	    em.close();
	}
	
	@Test
	void test() {
		assertNotNull(part);
		assertEquals("Alternator", part.getPartName());
		assertEquals("Engine", part.getCategory());
		assertEquals("New", part.getCondition());
		//need date purchase test
		assertEquals(150.00, part.getPurchasePrice());
		assertEquals("Auto Parts Co.", part.getSupplierName());
		//need date installed
		assertEquals(null, part.getInstallationNotes());
		assertEquals("To be Installed", part.getStatus());
		assertEquals("2 years", part.getWarrantyInfo());
		assertEquals("http://example.com/alternator.jpg", part.getPhotoURL());
		assertEquals("Engine Bay", part.getVehicleSection());
	}
}
