<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/menubar.jsp"/>
	<button onclick="location.href='${ contextPath }/sellInfo/list'">나의 판매내역</button>
	<jsp:include page="WEB-INF/views/common/footer.jsp"/>
</body>
</html>