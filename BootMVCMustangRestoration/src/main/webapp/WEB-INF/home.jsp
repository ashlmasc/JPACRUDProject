<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h1>Welcome to Ashley's 1972 Mustang Restoration Project</h1>

    <div class="row mt-3">
        <div class="col-md-6">
            <h2>Find Part by ID</h2>
            <form action="getPart.do" method="GET" class="form-inline">
                <div class="form-group mb-2">
                    <label for="partId" class="sr-only">Part ID:</label>
                    <input type="text" class="form-control" id="partId" name="partId" placeholder="Enter Part ID">
                </div>
                <button type="submit" class="btn btn-primary mb-2">Show Part</button>
            </form>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <h2>Parts List</h2>
            <ul class="list-group">
                <c:forEach items="${part}" var="part">
                    <li class="list-group-item">
                        ${part.id}. <a href="getPart.do?partId=${part.id}">${part.partName}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    
    <!-- View All Parts Button -->
    <div class="mt-3">
    	
    	<a href="viewAllParts.do" class="btn btn-secondary" role="button">View All Parts</a>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <!-- Add Part button -->
            <a href="addPart.do" class="btn btn-success">Add Part</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>