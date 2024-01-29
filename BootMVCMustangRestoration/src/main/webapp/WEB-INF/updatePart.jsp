<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Part</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Update Part</h2>
    <form action="updatePart.do" method="post" enctype="multipart/form-data">
        <!-- Hidden field for part ID -->
        <input type="hidden" name="partId" value="${part.id}">
        
        <div class="form-group">
            <label for="partName">Part Name</label>
            <input type="text" class="form-control" id="partName" name="partName" value="${part.partName}" required>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="${part.category}" required>
        </div>
        <div class="form-group">
            <label for="condition">Condition</label>
            <select class="form-control" id="condition" name="condition" required>
                <option ${part.condition == 'New' ? 'selected' : ''}>New</option>
                <option ${part.condition == 'Used' ? 'selected' : ''}>Used</option>
                <option ${part.condition == 'Refurbished' ? 'selected' : ''}>Refurbished</option>
            </select>
        </div>
        <div class="form-group">
            <label for="purchasePrice">Purchase Price</label>
            <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" value="${part.purchasePrice}" required>
        </div>
        <div class="form-group">
            <label for="supplierName">Supplier Name</label>
            <input type="text" class="form-control" id="supplierName" name="supplierName" value="${part.supplierName}">
        </div>
        <div class="form-group">
            <label for="datePurchased">Date Purchased</label>
            <input type="date" class="form-control" id="datePurchased" name="datePurchased" value="${part.datePurchased}">
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option ${part.status == 'To be Installed' ? 'selected' : ''}>To be Installed</option>
                <option ${part.status == 'Installed' ? 'selected' : ''}>Installed</option>
                <option ${part.status == 'Waiting for parts' ? 'selected' : ''}>Waiting for parts</option>
            </select>
        </div>
        <div class="form-group">
            <label for="installationNotes">Installation Notes</label>
            <textarea class="form-control" id="installationNotes" name="installationNotes" rows="3">${part.installationNotes}</textarea>
        </div>
        <div class="form-group">
            <label for="warrantyInfo">Warranty Information</label>
            <input type="text" class="form-control" id="warrantyInfo" name="warrantyInfo" value="${part.warrantyInfo}">
        </div>
	      <div class="form-group">
		    <label for="vehicleSection">Vehicle Section</label>
		    <select class="form-control" id="vehicleSection" name="vehicleSection" required>
		        <option value="">Select Section</option>
		        <option value="Engine" ${part.vehicleSection == 'Engine' ? 'selected' : ''}>Engine</option>
		        <option value="Transmission" ${part.vehicleSection == 'Transmission' ? 'selected' : ''}>Transmission</option>
		        <option value="Interior" ${part.vehicleSection == 'Interior' ? 'selected' : ''}>Interior</option>
		        <option value="Body" ${part.vehicleSection == 'Body' ? 'selected' : ''}>Body</option>
		        <option value="Exterior" ${part.vehicleSection == 'Exterior' ? 'selected' : ''}>Exterior</option>
		        <option value="Electrical" ${part.vehicleSection == 'Electrical' ? 'selected' : ''}>Electrical</option>
		        <option value="Suspension" ${part.vehicleSection == 'Suspension' ? 'selected' : ''}>Suspension</option>
		        <option value="Brakes" ${part.vehicleSection == 'Brakes' ? 'selected' : ''}>Brakes</option>
		        <option value="Wheels/Tires" ${part.vehicleSection == 'Wheels/Tires' ? 'selected' : ''}>Wheels/Tires</option>
		        <option value="Exhaust" ${part.vehicleSection == 'Exhaust' ? 'selected' : ''}>Exhaust</option>
		        <option value="Cooling System" ${part.vehicleSection == 'Cooling System' ? 'selected' : ''}>Cooling System</option>
		        <option value="Fuel System" ${part.vehicleSection == 'Fuel System' ? 'selected' : ''}>Fuel System</option>
		        <option value="Drivetrain" ${part.vehicleSection == 'Drivetrain' ? 'selected' : ''}>Drivetrain</option>
		        <option value="Steering System" ${part.vehicleSection == 'Steering System' ? 'selected' : ''}>Steering System</option>
		        <option value="Heating/Ventilation/Air Conditioning (HVAC)" ${part.vehicleSection == 'Heating/Ventilation/Air Conditioning (HVAC)' ? 'selected' : ''}>Heating/Ventilation/Air Conditioning (HVAC)</option>
		        <option value="Lighting" ${part.vehicleSection == 'Lighting' ? 'selected' : ''}>Lighting</option>
		        <option value="Audio/Video Systems" ${part.vehicleSection == 'Audio/Video Systems' ? 'selected' : ''}>Audio/Video Systems</option>
		        <option value="Safety Systems" ${part.vehicleSection == 'Safety Systems' ? 'selected' : ''}>Safety Systems</option>
		    </select>
		</div>
<!--         <div class="form-group"> -->
<!--             <label for="photo">Photo (leave blank to keep current photo)</label> -->
<!--             <input type="file" class="form-control-file" id="photo" name="photo"> -->
<!--         </div> -->
        
         <!-- Cancel/Update Button -->
        <a href="home.do" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the homepage">Cancel</a>
  
        
        <button type="submit" class="btn btn-primary" data-toggle="tooltip" title="Click to add the part to the inventory">Confirm Update</button>

<!-- Bootstrap JS, Popper.js, and jQuery for tooltips -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip(); // Initialize tooltips
    });
</script>

</body>
</html>