<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지-회원상세</title>
<!-- 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<style>
/* 사이드 바*/
.sideBar {
	text-align: center;
}

.sideTitle {
	background-color: lightgray;
	border-color: lightgray;
}

.sideContent {
	font-size: 13px;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 850px;
	padding: 50px 70px 70px 71px;
}

.rightSpace a {
	color: rgb(7, 7, 7) !important;
}

.sideBar li {
	background-color: #56CE7C;
	color: #ffffff;
}

.sideTitle {
	font-size: 14px;
	font-weight: bold;
}

/* 내용 */
.btn {
	font-size: 13px;
}

span {
	color: rgba(213, 70, 70, 0.809);
}

#modifyMemberInfo * {
	font-size: 13px;
}

.rightSpace a {
	color: rgb(7, 7, 7) !important;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="container">

		<div class="row">

			<div class="col-md-2 rightSpace">
				<div class="list-group col-md-10 sideBar" style="margin-top: 100px;">
	               <ul>
	                  <li class="list-group-item sideTitle">마이페이지</li>
	                  <li><a href="${ contextPath }/member/myPage"
	                     class="list-group-item list-group-item-action sideContent">회원 정보</a></li>
	                  <li><a href="${ contextPath }/member/myBoardList" 
	                     class="list-group-item list-group-item-action sideContent">나의 게시글</a></li>
	                  <li><a href="#"
	                     class="list-group-item list-group-item-action sideContent">나의 댓글</a></li>
	               </ul>
	            </div>
	            
	            <div class="list-group col-md-10 sideBar">
	               <ul>
	                  <li class="list-group-item sideTitle">관리페이지</li>
	                  <li><a href="${ contextPath }/admin/memberList"
	                    class="list-group-item list-group-item-action sideContent">회원 관리</a></li>
	                  <li><a href="${ contextPath }/admin/boardList" 
	                  	class="list-group-item list-group-item-action sideContent">게시글 관리</a></li>
	                  <li><a href="${ contextPath }/admin/reportList"
	                    class="list-group-item list-group-item-action sideContent">신고 관리</a></li>
	                  <li><a href="${ contextPath }/admin/phoneInfoInsert"
	                    class="list-group-item list-group-item-action sideContent">폰 정보입력</a></li>
	                  <li><a href="${ contextPath }/admin/calculate"
	                    class="list-group-item list-group-item-action sideContent">정산</a></li>
	               </ul>
	            </div>
			</div>

			<!-- 내용 -->
			<div class="col-md-8 content">
				<div class="main-div">
					<div class="panel">
						<h5>${ member.name }님 상세 정보</h5>
						<hr>
					</div>

					<form id="modifyMemberInfo" name="modifyMemberInfo"	action="">
						<table class="table align-middle table-borderless">
							<tr>
								<th class="col-3">
									<label for="userId" class="req">아이디</label>
								</th>
								<td class="input-group">
									<div>${ member.id }</div>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="userName" class="req">이름</label>
								</th>
								<td>
									<div>${ member.name }</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
								<td>
									<div class="telselect_wrap input-group">
										<div>${ member.phone }</div>
									</div> 

									<input type="hidden" name="old_mb_hp" value="">
								</td>

							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_zip" class="req">주소</label></th>
								<td>
									<div>${ member.address }</div>	
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
								<td>
									<div>${ member.email }</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">회원 등급</label></th>
								<td>
									<div>${ member.grade }</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">가입 일자</label></th>
								<td>
									<div>${ member.createDate }</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="row" style="margin: auto;">
							<button class="btn btn-secondary" type="button" style="margin:auto; float:left; width: 100px;" onclick="history.back();">뒤로</button>
							<button class="btn btn-secondary" type="button" style="margin:auto; float:right; width: 100px;" onclick="location.href='${contextPath}/admin/memberQuit?userNo=' + ${member.userNo}">회원 탈퇴</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</body>
</html>