<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Part</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional: Include Bootstrap Tooltip CSS here if needed -->
</head>
<body>
<div class="container mt-5">
    <h2>Add New Part</h2>
    <form action="addPart.do" method="post">
        <!-- Other form fields -->
        
         <div class="form-group">
            <label for="partName">Part Name</label>
            <input type="text" class="form-control" id="partName" name="partName" required>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" required>
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
            <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" required>
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option>To be Installed</option>
                <option>Installed</option>
                <option>Waiting for parts</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add Part</button>
    </form>
</div>

        <!-- Status should be a dropdown -->
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="">Select Status</option>
                <option>To be Installed</option>
                <option>Installed</option>
                <option>Waiting for parts</option>
                <option>To Buy</option>
            </select>
        </div>

        <!-- Include a tooltip for the warranty info field -->
        <div class="form-group">
            <label for="warrantyInfo">Warranty Information</label>
            <input type="text" class="form-control" id="warrantyInfo" name="warrantyInfo" placeholder="Enter warranty information" data-toggle="tooltip" title="Enter the warranty period and any special conditions">
        </div>

        <!-- The submit button -->
        <button type="submit" class="btn btn-success" data-toggle="tooltip" title="Click to add a new part">Add Part</button>
    </form>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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