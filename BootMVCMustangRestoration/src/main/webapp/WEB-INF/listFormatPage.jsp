<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Format - Parts</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Favicon -->
    <link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon">
</head>
<body>

<div class="container my-5">
    <h1 class="display-4 text-center mb-4">Parts List - List Format</h1>

    <!-- Parts List -->
    <div class="row">
        <div class="col-md-12">
            <ul class="list-group">
                <c:forEach items="${allParts}" var="part">
                    <li class="list-group-item">
<%--                         <div><strong>ID:</strong> ${part.id}</div> --%>
                        <div><strong>Name:</strong> ${part.partName}</div>
                        <div><strong>Category:</strong> ${part.category}</div>
                        <div><strong>Condition:</strong> ${part.condition}</div>
                        <div><strong>Date Purchased:</strong> ${part.datePurchased}</div>
                        <div><strong>Purchase Price:</strong><fmt:formatNumber value="${part.purchasePrice}" type="currency" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2"/></div>
                        <div><strong>Supplier:</strong> ${part.supplierName}</div>
                        <div><strong>Date Installed:</strong> ${part.dateInstalled}</div>
                        <div><strong>Installation Notes:</strong> ${part.installationNotes}</div>
                        <div><strong>Status:</strong> ${part.status}</div>
                        <div><strong>Warranty Info:</strong> ${part.warrantyInfo}</div>
<%--                         <div><strong>Photo URL:</strong> ${part.photoURL}</div> --%>
                        <div><strong>Vehicle Section:</strong> ${part.vehicleSection}</div>
                        <!-- Update and Delete buttons for each record -->
                        <div class="mt-2">
                            <a href="updatePart.do?partId=${part.id}" class="btn btn-primary btn-sm">Update</a>
                        	<form action="deletePart.do" method="post" onsubmit="return confirm('Are you sure you want to delete this part?');" style="display: inline-block;">
                            <input type="hidden" name="partId" value="${part.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <!-- Navigation Button back to Home Page -->
    <div class="text-center mt-4">
        <a href="home.do" class="btn btn-outline-primary">Back to Home</a>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>