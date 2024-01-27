<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Part Details</title>
</head>
<body>
	<div>
  		<c:choose>
    <c:when test="${not empty part}">
        <h2>${part.partName}</h2>
        <strong>Category:</strong> ${part.category}<br>
        <strong>Condition:</strong> ${part.condition}<br>
        <strong>Status:</strong> ${part.status}<br>
     
    </c:when>
    <c:otherwise>
        Part not found.
    </c:otherwise>
</c:choose>
  		
	</div>
	<!-- Back to Home Page button -->
        <form action="." method="GET">
            <input type="submit" value="Back to Home" />
        </form>
	
</body>
</html>