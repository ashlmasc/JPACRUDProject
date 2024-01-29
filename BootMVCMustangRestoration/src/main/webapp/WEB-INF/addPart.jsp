<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Part</title>
    <!-- Bootstrap CSS for consistency with other pages -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2 class="display-4 text-center mb-4">Add New Part</h2>
    <form action="addPart.do" method="post" enctype="multipart/form-data">
        <!-- Part Name -->
        <div class="form-group">
            <label for="partName">Part Name</label>
            <input type="text" class="form-control" id="partName" name="partName" placeholder="Enter part name" required>
        </div>

        <!-- Category -->
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" placeholder="Enter category" required>
        </div>

        <!-- Condition -->
        <div class="form-group">
            <label for="condition">Condition</label>
            <select class="form-control" id="condition" name="condition" required>
                <option>New</option>
                <option>Used</option>
                <option>Refurbished</option>
            </select>
        </div>
        
        <!-- Date Purchased -->
        <div class="form-group">
            <label for="datePurchased">Date Purchased</label>
            <input type="date" class="form-control" id="datePurchased" name="datePurchased">
        </div>

        <!-- Purchase Price -->
        <div class="form-group">
            <label for="purchasePrice">Purchase Price</label>
            <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" placeholder="Enter purchase price" required>
        </div>

        <!-- Supplier Name -->
        <div class="form-group">
            <label for="supplierName">Supplier Name</label>
            <input type="text" class="form-control" id="supplierName" name="supplierName" placeholder="Enter supplier name">
        </div>

        <!-- Date Installed -->
        <div class="form-group">
            <label for="dateInstalled">Date Installed</label>
            <input type="date" class="form-control" id="dateInstalled" name="dateInstalled">
        </div>

        <!-- Installation Notes -->
        <div class="form-group">
            <label for="installationNotes">Installation Notes</label>
            <textarea class="form-control" id="installationNotes" name="installationNotes" rows="3" placeholder="Enter any installation notes"></textarea>
        </div>

        <!-- Status -->
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option>To be Installed</option>
                <option>Installed</option>
                <option>Waiting for parts</option>
            </select>
        </div>

        <!-- Warranty Information -->
        <div class="form-group">
            <label for="warrantyInfo">Warranty Information</label>
            <input type="text" class="form-control" id="warrantyInfo" name="warrantyInfo" placeholder="Enter warranty information">
        </div>

        <!-- Vehicle Section -->
        <div class="form-group">
            <label for="vehicleSection">Vehicle Section</label>
            <select class="form-control" id="vehicleSection" name="vehicleSection" required>
        <option value="">Select Section</option>
        <option value="Engine">Engine</option>
        <option value="Transmission">Transmission</option>
        <option value="Interior">Interior</option>
        <option value="Body">Body</option>
        <option value="Exterior">Exterior</option>
        <option value="Electrical">Electrical</option>
        <option value="Suspension">Suspension</option>
        <option value="Brakes">Brakes</option>
        <option value="Wheels/Tires">Wheels/Tires</option>
        <option value="Exhaust">Exhaust</option>
        <option value="Cooling System">Cooling System</option>
        <option value="Fuel System">Fuel System</option>
        <option value="Drivetrain">Drivetrain</option>
        <option value="Steering System">Steering System</option>
        <option value="Heating/Ventilation/Air Conditioning (HVAC)">Heating/Ventilation/Air Conditioning (HVAC)</option>
        <option value="Lighting">Lighting</option>
        <option value="Audio/Video Systems">Audio/Video Systems</option>
        <option value="Safety Systems">Safety Systems</option>
    </select>
        </div>

        <!-- Photo -->
<!--         <div class="form-group"> -->
<!--             <label for="photo">Photo</label> -->
<!--             <input type="file" class="form-control-file" id="photo" name="photo"> -->
<!--         </div> -->
        
        <!-- Cancel/Add Button -->
        <div class="text-center">
        <a href="home.do" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the homepage">Cancel</a>
  
         <button type="submit" class="btn btn-primary" data-toggle="tooltip" title="Click to add the part to the inventory">Add Part</button>
   		</div>
    </form>
</div>

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