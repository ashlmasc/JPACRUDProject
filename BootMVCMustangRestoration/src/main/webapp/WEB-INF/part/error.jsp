<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
</head>
<body>
    <h2>Error Occurred</h2>
    <p>${errorMessage}</p>
    <p><strong>Details:</strong> ${errorDetails}</p>

    <!-- Link to go back to the home page -->
    <a href="<c:url value='/' />">Back to Home</a>
</body>
</html>