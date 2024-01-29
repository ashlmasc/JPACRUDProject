<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Part Details</title>

<!-- Bootstrap CSS for styling -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div class="container mt-3">
    <c:choose>
        <c:when test="${not empty part}">
            <h2>${part.partName}</h2>
            <p><strong>Category:</strong> ${part.category}</p>
            <p><strong>Condition:</strong> ${part.condition}</p>
            <p><strong>Date Purchased:</strong> ${part.datePurchased}</p>
            <p><strong>Purchase Price:</strong> $${part.purchasePrice}</p>
            <p><strong>Supplier Name:</strong> ${part.supplierName}</p>
            <p><strong>Date Installed:</strong> ${part.dateInstalled}</p>
            <p><strong>Installation Notes:</strong> ${part.installationNotes}</p>
            <p><strong>Status:</strong> ${part.status}</p>
            <p><strong>Warranty Information:</strong> ${part.warrantyInfo}</p>
            <p><strong>Vehicle Section:</strong> ${part.vehicleSection}</p>

            <!-- Displaying the photo if available -->
<%--             <c:if test="${not empty part.photoUrl}"> --%>
<%--                 <img src="${part.photoUrl}" alt="Part Photo" class="img-fluid" style="max-width: 300px; max-height: 300px;"> --%>
<%--             </c:if> --%>
            
            <!-- Update, Delete, and Home Buttons -->
            <a href="updatePart.do?partId=${part.id}" class="btn btn-primary mt-2">Update Part</a>
            <a href="home.do" class="btn btn-secondary mt-2">Go Home</a>
     		<form action="deletePart.do" method="post" onsubmit="return confirm('Are you sure you want to delete this part?');">
    			<input type="hidden" name="partId" value="${part.id}">
    			<input type="submit" value="Delete Part" class="btn btn-danger mt-2">
			</form>
     
    </c:when>
    <c:otherwise>
        Part not found.
    </c:otherwise>
</c:choose>
  		
	</div>
	
	<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
</body>
</html>