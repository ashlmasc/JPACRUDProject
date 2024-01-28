<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Add New Part</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Add New Part</h2>
    <form action="addPart.do" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="partName">Part Name</label>
            <input type="text" class="form-control" id="partName" name="partName" placeholder="Enter part name" required>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" placeholder="Enter category" required>
        </div>
        <div class="form-group">
            <label for="condition">Condition</label>
            <select class="form-control" id="condition" name="condition" required>
                <option>New</option>
                <option>Used</option>
                <option>Refurbished</option>
            </select>
        </div>
        <div class="form-group">
            <label for="purchasePrice">Purchase Price</label>
            <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" placeholder="Enter purchase price" required>
        </div>
        <div class="form-group">
            <label for="supplierName">Supplier Name</label>
            <input type="text" class="form-control" id="supplierName" name="supplierName" placeholder="Enter supplier name">
        </div>
        <div class="form-group">
            <label for="datePurchased">Date Purchased</label>
            <input type="date" class="form-control" id="datePurchased" name="datePurchased">
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option>To be Installed</option>
                <option>Installed</option>
                <option>Waiting for parts</option>
            </select>
        </div>
        <div class="form-group">
            <label for="installationNotes">Installation Notes</label>
            <textarea class="form-control" id="installationNotes" name="installationNotes" rows="3" placeholder="Enter any installation notes"></textarea>
        </div>
        <div class="form-group">
            <label for="warrantyInfo">Warranty Information</label>
            <input type="text" class="form-control" id="warrantyInfo" name="warrantyInfo" placeholder="Enter warranty information">
        </div>
        <div class="form-group">
            <label for="vehicleSection">Vehicle Section</label>
            <select class="form-control" id="vehicleSection" name="vehicleSection" required data-toggle="tooltip" title="Select the section of the vehicle where the part will be used">
                <option value="">Select Section</option>
                <option>Engine</option>
                <option>Transmission</option>
                <option>Interior</option>
                <option>Body</option>
                <option>Electrical</option>
                <option>Suspension</option>
                <!-- Add more sections as needed -->
            </select>
        </div>
        <div class="form-group">
            <label for="photo">Photo</label>
            <input type="file" class="form-control-file" id="photo" name="photo" data-toggle="tooltip" title="Upload a photo of the part">
        </div>
        
        <!-- Cancel/Add Button -->
        <a href="home.do" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the homepage">Cancel</a>
  
        
        <button type="submit" class="btn btn-primary" data-toggle="tooltip" title="Click to add the part to the inventory">Add Part</button>
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