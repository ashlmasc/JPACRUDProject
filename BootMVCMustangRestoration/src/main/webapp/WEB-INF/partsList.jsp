<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Parts List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">

    <h1>Parts List</h1>

    <table class="table table-bordered table-hover mt-3">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Condition</th>
                <th>Status</th>
                <th>Purchase Price</th>
                <th>Supplier Name</th>
                <th>Date Purchased</th>
                <th>Installation Notes</th>
                <th>Warranty Information</th>
                <th>Vehicle Section</th>
                              
            </tr>
        </thead>
        <tbody>
       <c:forEach items="${allParts}" var="part">
    <tr>
    	<td>
            <a href="updatePart.do?partId=${part.id}" class="btn btn-primary btn-sm" title="Click to update this part">${part.id}</a>
        </td>
        <td>${part.partName}</td>
        <td>${part.category}</td>
        <td>${part.condition}</td>
        <td>${part.status}</td>
        <td>
        <fmt:formatNumber value="${part.purchasePrice}" type="currency" currencySymbol="$"/>
        </td>
        <td>${part.supplierName}</td>
		<td>${part.datePurchased}</td>			
		<td>${part.installationNotes}</td>			
		<td>${part.warrantyInfo}</td>			
		<td>${part.vehicleSection}</td>	
		<td>
            <form action="deletePart.do" method="post" onsubmit="return confirm('Are you sure you want to delete this part?');">
                <input type="hidden" name="partId" value="${part.id}" />
                <button type="submit" class="btn btn-danger btn-sm" title="Click to delete this part">Delete</button>
            </form>
        </td>
				
 	 </tr> 
		</c:forEach>

        </tbody>
    </table>
    
   

    <!-- Button for CSV Download -->
<!--     <a href="downloadPartsCsv" class="btn btn-primary">Download as CSV</a> -->
     <a href="home.do" class="btn btn-secondary mt-2">Go Home</a>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>