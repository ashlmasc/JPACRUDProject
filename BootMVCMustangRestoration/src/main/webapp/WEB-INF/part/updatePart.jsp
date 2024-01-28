<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>s
<html>
<head>
    <title>Update Part</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Update Part</h2>
    <form action="updatePart.do" method="post" enctype="multipart/form-data">
        <!-- Hidden field to store part ID -->
        <input type="hidden" name="id" value="${part.id}">

        <div class="form-group">
            <label for="partName">Part Name</label>
            <input type="text" class="form-control" id="partName" name="partName" value="${part.partName}" required>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="${part.category}" required>
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
            <input type="number" step="0.01" class="form-control" id="purchasePrice" name="purchasePrice" value="${part.purchasePrice}" required>
        </div>
        <!-- Additional fields as needed... -->

        <div class="form-group">
            <label for="photo">Photo</label>
            <input type="file" class="form-control-file" id="photo" name="photo">
            <!-- Display current photo if available -->
            <c:if test="${not empty part.photoUrl}">
                <img src="${part.photoUrl}" alt="Part Photo" style="max-width: 100px; max-height: 100px;"/>
            </c:if>
        </div>

        <button type="submit" class="btn btn-success" data-toggle="tooltip" title="Click to update the part details">Update Part</button>
        <a href="home.do" class="btn btn-secondary" data-toggle="tooltip" title="Cancel and return to the homepage">Cancel</a>
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