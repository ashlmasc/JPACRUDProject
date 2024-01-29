<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Part Details</title>

<!-- Bootstrap CSS for styling -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <div class="container mt-5">
        <c:choose>
            <c:when test="${not empty part}">
                <h1 class="display-4 text-center mb-4">${part.partName} Details</h1>
                
                
<!--                 <div class="text-center mb-4"> -->
<%--                     <c:if test="${not empty part.photoURL}"> --%>
<%--                         <img src="${part.photoURL}" alt="Part Photo" class="img-fluid" style="max-width: 300px; max-height: 300px;"> --%>
<%--                     </c:if> --%>
<!--                 </div> -->

                <div class="mb-3"><strong>Category:</strong> ${part.category}</div>
                <div class="mb-3"><strong>Condition:</strong> ${part.condition}</div>
                <div class="mb-3"><strong>Date Purchased:</strong> ${part.datePurchased}</div>
                <div class="mb-3"><strong>Purchase Price:</strong> $${part.purchasePrice}</div>
                <div class="mb-3"><strong>Supplier Name:</strong> ${part.supplierName}</div>
                <div class="mb-3"><strong>Date Installed:</strong> ${part.dateInstalled}</div>
                <div class="mb-3"><strong>Installation Notes:</strong> ${part.installationNotes}</div>
                <div class="mb-3"><strong>Status:</strong> ${part.status}</div>
                <div class="mb-3"><strong>Warranty Information:</strong> ${part.warrantyInfo}</div>
                <div class="mb-3"><strong>Vehicle Section:</strong> ${part.vehicleSection}</div>

                <!-- Update, Delete, and Home Buttons -->
                <div class="text-center mt-4">
                    <a href="updatePart.do?partId=${part.id}" class="btn btn-primary">Update Part</a>
                    <a href="home.do" class="btn btn-secondary">Go Home</a>
                    <form action="deletePart.do" method="post" onsubmit="return confirm('Are you sure you want to delete this part?');" style="display: inline-block;">
                        <input type="hidden" name="partId" value="${part.id}">
                        <input type="submit" value="Delete Part" class="btn btn-danger">
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-danger" role="alert">
                    Part not found.
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>