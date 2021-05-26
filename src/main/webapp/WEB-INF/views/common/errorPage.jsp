<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
<style>
	.error_container {
		text-align : center;
	}
	.error_container img {
		width : 300px;
		margin-top : 100px;
	}
	.error_container h2 {
		color : red;
	}
</style>
</head>
<body>
	<jsp:include page="menubar.jsp"/>
	<div class="error_container">
		<img src="${ contextPath }/resources/images/error-image.png"/>
		<h2>${ msg }<%= request.getAttribute("javax.servlet.error.message") %></h2>
	</div>
</body>
</html>