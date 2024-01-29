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
<style>
	@media print {
		.no-print {
            display: none;
        }
        @page {
            size: landscape;
        }
        .table-responsive {
            transform: scale(0.8);
            transform-origin: top center;
        }
        table {
            font-size: 10px; /* Reduce font size */
        }
        table th, table td {
            padding: 2px; /* Reduce padding */
        }
         thead { display: table-header-group; }
        tfoot { display: table-footer-group; }
        tr { page-break-inside: avoid; }
        .centered-table {
        margin-left: auto;
        margin-right: auto;
    	}
    	.wide-table {
        min-width: 1200px; /* Adjust the value as needed*/
    	}
    	table th, .table td {
        white-space: nowrap; /* Prevents text from wrapping */
        max-width: 200px; /* Sets a max width for table cells */
        overflow: hidden;
        text-overflow: ellipsis;
    	}
    	
    }
</style>
</head>
<body>
<div class="container-fluid mt-5">

    <h1 class="display-4 text-center mb-4">Parts List</h1>
    
    <!-- Flex container to center the table -->
    <div class="d-flex justify-content-center">
        <div class="table-responsive">
           
    	<table class="table table-bordered table-hover mt-3">
        <thead class="thead-dark">
            <tr>
<!--                 <th>Photo</th> -->
                <th>Name</th>
                <th>Category</th>
                <th>Condition</th>
                <th>Date Purchased</th>
                <th>Purchase Price</th>
                <th>Supplier Name</th>
                <th>Date Installed</th>
                <th>Installation Notes</th>
                <th>Status</th>
                <th>Warranty Information</th>
                <th>Vehicle Section</th>
                <th class="no-print">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${allParts}" var="part">
                <tr>
<!--                     <td> -->
<%--                         <c:if test="${not empty part.photoURL}"> --%>
<%--                             <img src="${part.photoURL}" alt="Part Photo" style="width: 100px; height: auto;"> --%>
<%--                         </c:if> --%>
<!--                     </td> -->
                    <td>${part.partName}</td>
                    <td>${part.category}</td>
                    <td>${part.condition}</td>
                    <td>${part.datePurchased}</td>
                    <td><fmt:formatNumber value="${part.purchasePrice}" type="currency" currencySymbol="$" maxFractionDigits="2" minFractionDigits="2"/></td>
                    <td>${part.supplierName}</td>
                    <td>${part.dateInstalled}</td>
                    <td>${part.installationNotes}</td>
                    <td>${part.status}</td>
                    <td>${part.warrantyInfo}</td>
                    <td>${part.vehicleSection}</td>
                    <td class="no-print">
                        <a href="getPart.do?partId=${part.id}" class="btn btn-info btn-sm">View</a>
                        <a href="updatePart.do?partId=${part.id}" class="btn btn-warning btn-sm">Edit</a>
                        <form action="deletePart.do" method="post" onsubmit="return confirm('Are you sure you want to delete this part?');" style="display: inline-block;">
                            <input type="hidden" name="partId" value="${part.id}" />
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    </div>
    </div>

    <!-- Print and Go Home Buttons -->
    <div class="text-center mt-4 no-print">
        <button onclick="window.print();" class="btn btn-primary">Print</button>
        <a href="home.do" class="btn btn-secondary">Go Home</a>
    </div>
    
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>