package com.skilldistillery.mustangrestoration.entities;

import java.time.LocalDate;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "part")
public class Part {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "part_name")
	private String partName;

	private String category;

	@Column(name = "`condition`")
	private String condition;

	@Column(name = "date_purchased")
	private LocalDate datePurchased;
	
	@Column(name = "purchase_price")
	private Double purchasePrice;
	
	@Column(name = "supplier_name")
	private String supplierName;
	
	@Column(name = "date_installed")
	private LocalDate dateInstalled;
	
	@Column(name = "installation_notes")
	private String installationNotes;
	
	private String status;
	
	@Column(name = "warranty_info")
	private String warrantyInfo;
	
	@Column(name = "photo_url")
	private String photoURL;
	
	@Column(name = "vehicle_section")
	private String vehicleSection;
	
	public Part() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPartName() {
		return partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public LocalDate getDatePurchased() {
		return datePurchased;
	}

	public void setDatePurchased(LocalDate datePurchased) {
		this.datePurchased = datePurchased;
	}

	public Double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(Double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public LocalDate getDateInstalled() {
		return dateInstalled;
	}

	public void setDateInstalled(LocalDate dateInstalled) {
		this.dateInstalled = dateInstalled;
	}

	public String getInstallationNotes() {
		return installationNotes;
	}

	public void setInstallationNotes(String installationNotes) {
		this.installationNotes = installationNotes;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getWarrantyInfo() {
		return warrantyInfo;
	}

	public void setWarrantyInfo(String warrantyInfo) {
		this.warrantyInfo = warrantyInfo;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	public String getVehicleSection() {
		return vehicleSection;
	}

	public void setVehicleSection(String vehicleSection) {
		this.vehicleSection = vehicleSection;
	}

	@Override
	public int hashCode() {
		return Objects.hash(category, condition, dateInstalled, datePurchased, id, installationNotes, partName,
				photoURL, purchasePrice, status, supplierName, vehicleSection, warrantyInfo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Part other = (Part) obj;
		return Objects.equals(category, other.category) && Objects.equals(condition, other.condition)
				&& Objects.equals(dateInstalled, other.dateInstalled)
				&& Objects.equals(datePurchased, other.datePurchased) && id == other.id
				&& Objects.equals(installationNotes, other.installationNotes)
				&& Objects.equals(partName, other.partName) && Objects.equals(photoURL, other.photoURL)
				&& Double.doubleToLongBits(purchasePrice) == Double.doubleToLongBits(other.purchasePrice)
				&& Objects.equals(status, other.status) && Objects.equals(supplierName, other.supplierName)
				&& Objects.equals(vehicleSection, other.vehicleSection)
				&& Objects.equals(warrantyInfo, other.warrantyInfo);
	}

	@Override
	public String toString() {
		return "Part [id=" + id + ", partName=" + partName + ", category=" + category + ", condition=" + condition
				+ ", datePurchased=" + datePurchased + ", purchasePrice=" + purchasePrice + ", supplierName="
				+ supplierName + ", dateInstalled=" + dateInstalled + ", installationNotes=" + installationNotes
				+ ", status=" + status + ", warrantyInfo=" + warrantyInfo + ", photoURL=" + photoURL
				+ ", vehicleSection=" + vehicleSection + "]";
	}
}
