<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"
scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<!-- Font Awesome5 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<title>메뉴바</title>
</head>
<style>
.bg-light {
	background-color: #56CE7C !important;
	height: 50px;
}

.menum .form-control {
	background-color: #56CE7C;
	border: none;
}

.menum {
	background-color: #56CE7C;
	height: 100px;
}

.menuBar a {
	color: #fff !important;
}

.nav-item {
	font-family: Century Gothic;
	margin: 0 auto;
	padding: 4em;
	padding-top: 28px;
	text-align: center;
}

.nav-item a {
	text-decoration: none;
	font: 20px Century Gothic;
	margin: 0px 10px;
	padding: 10px 10px;
	position: relative;
	z-index: 0;
}

.topNav a {
	cursor: pointer;
	font: 14px Century Gothic;
}

/* Top & Bottom Borders Out */
.topBotomBordersOut {
	height: 100px;
}

.topBotomBordersOut a:before, .topBotomBordersOut a:after {
	position: absolute;
	left: 0px;
	width: 100%;
	height: 2px;
	background: #FFF;
	content: "";
	opacity: 0;
	-webkit-transition: all 0.3s;
	transition: all 0.3s;
}

.collapse {
	height: 100px;
}

.topBotomBordersOut a:before {
	top: 0px;
	transform: translateY(10px);
}

.topBotomBordersOut a:after {
	bottom: 0px;
	transform: translateY(-10px);
}

.topBotomBordersOut a:hover:before, .topBotomBordersOut a:hover:after {
	opacity: 1;
	transform: translateY(0px);
}
</style>

<body>

	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>
	
	
	<div class="menuBar">
		<c:if test="${ empty sessionScope.loginUser }">
		<nav class="py-2 bg-light border-top">
			<div class="container d-flex flex-wrap">
				<ul class="nav me-auto"></ul>
				<ul class="nav">
					<li class="topNav"><a href="${ contextPath }/member/loginPage" class="nav-link link-dark px-2"
						style="cursor: pointer;">Login</a></li>
					<li class="topNav"><a href="${ contextPath }/member/joinPage" class="nav-link link-dark px-2"
						style="margin-right: 75px;">Sign up</a></li>
				</ul>
			</div>
		</nav>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
		<nav class="py-2 bg-light border-top">
            <div class="container d-flex flex-wrap">
                <ul class="nav me-auto"></ul>
                <ul class="nav">
                    <li class="topNav"><a href="${ contextPath }/message/selectList?type=받은 쪽지함" class="nav-link link-dark px-2"><i class="fas fa-envelope"></i></a></li>
                    <li class="topNav"><a href="#" class="nav-link link-dark px-2"><i class="fas fa-shopping-cart"></i></a></li>
                    <li class="topNav"><a href="#" class="nav-link link-dark px-2">${ loginUser.name }님</a></li>
                    <li class="topNav"><a href="${ contextPath }/member/myPage" class="nav-link link-dark px-2">MyPage</a></li>
                    <li class="topNav"><a href="${ contextPath }/member/logout" class="nav-link link-dark px-2" style="margin-right:75px;">Logout</a></li>
                </ul>
            </div>
        </nav>	
		</c:if>
		<nav
			class="menum navbar navbar-light navbar-expand-md justify-content-center border-bottom">
			<div class="container">

				<div
					class="navbar-collapse collapse justify-content-between align-items-center w-100"
					id="collapsingNavbar2">
					<div class="logo form-control">
						<a href="${ contextPath }"><img src="${ contextPath }/resources/images/logo.png" style="width: 230px;"></a>
					</div>
					
					<ul class="topBotomBordersOut navbar-nav mx-auto text-center">

						<li class="nav-item"><a class="nav-link" href="${ contextPath }/goods/list">Market</a></li>						
						<li class="nav-item"><a class="nav-link" href="${ contextPath }/boardMobile/list">Community</a></li>
						<li class="nav-item"><a class="nav-link" href="${ contextPath }/support/compare">Support</a></li>
						<li class="nav-item"><a class="nav-link" href="${ contextPath }/notice/list">Service</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>


</body>
</html>