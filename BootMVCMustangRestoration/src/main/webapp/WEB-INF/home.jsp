<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
	<form action="getPart.do" method="GET">
	  Part ID: <input type="text" name="partId" />
	  <input type="submit" value="Show Part" />
	</form>
	
	<c:forEach items="${part}" var="part">
    	${part.id}. <a href="getPart.do?partId=${part.id}">${part.partName}</a><br/>
	</c:forEach>
	
	<!--  Add Part button -->
<div class="container mt-3">
    <a href="addPart.do" class="btn btn-primary" role="button">Add Part</a>
</div>
	
</body>
</html>