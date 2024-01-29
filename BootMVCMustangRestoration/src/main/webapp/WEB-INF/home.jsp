<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Favicon -->
    <link rel="icon" href="<c:url value='/resources/images/favicon.ico'/>" type="image/x-icon">
</head>
<body>

<div class="container my-5">
    <h1 class="display-4 text-center mb-4">Welcome to Ashley's 1972 Mustang Restoration Project</h1>

    <!-- Image of 1972 Mustang -->
    <div class="text-center mb-5">
        <img src="<c:url value='/resources/images/1972Mustang.jpg'/>" alt="1972 Mustang" class="img-fluid" style="max-height: 400px;">
    </div>

    <div class="row justify-content-center mb-4">
        <div class="col-md-8">
            <h2 class="h3 mb-3">Find Part by ID</h2>
            <form action="getPart.do" method="GET" class="form-inline justify-content-center">
                <div class="form-group mx-sm-3 mb-2">
                    <label for="partId" class="sr-only">Part ID:</label>
                    <input type="text" class="form-control" id="partId" name="partId" placeholder="Enter Part ID" required>
                </div>
                <button type="submit" class="btn btn-outline-primary mb-2">Show Part</button>
            </form>
        </div>
    </div>

    <!-- View List of Parts Header -->
    <div class="row justify-content-center mb-4">
        <div class="col-md-8 text-center">
            <h2 class="h3 mb-3">View List of Parts</h2>
            <!-- Buttons for List and Table format -->
            <a href="listFormatPage.do" class="btn btn-outline-info mb-2">List Format</a>
            <a href="viewAllParts.do" class="btn btn-outline-info mb-2">Table Format</a>
        </div>
    </div>

    <!-- Add Part Button -->
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <a href="addPart.do" class="btn btn-outline-success">Add Part</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>