<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
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

.SC{
	padding-right : 15px;
	padding-left : 15px;
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
							class="list-group-item list-group-item-action sideContent">회원
								정보</a></li>
						<li><a href="${ contextPath }/member/myBoardList" class="list-group-item list-group-item-action sideContent">나의
								게시글</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">나의
								댓글</a></li>
					</ul>
				</div>

				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">쪽지함</li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">받은
								쪽지함</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">보낸
								쪽지함</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">보관함</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">휴지통</a></li>
					</ul>
				</div>

				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">주문내역</li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">나의
								판매내역</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">나의
								구매내역</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">관심상품</a></li>
					</ul>
				</div>
			</div>

			<!-- 내용 -->
			<div class="col-md-8 content">
				<div class="main-div">
					<div class="panel">
						<h5>회원 정보</h5>
						<hr>
					</div>

					<form id="modifyMemberInfo" name="modifyMemberInfo"	action="${ contextPath }/member/update" onsubmit="return confirm('회원정보를 수정하시겠습니까?')" method="post">
						<table class="table align-middle table-borderless">
							<tr>
								<th class="col-3">
									<label for="userId" class="req">아이디</label>
								</th>
								<td class="input-group">
									<div>${ loginUser.id }</div>
								</td>
							</tr>
							
							<tr>
								<th scope="row"><label for="userPwd" class="req">비밀번호</label></th>
								<td>
									<button type="button" class="btn btn-primary" id="pwdChangeBtn">비밀번호 변경</button>
								</td>
							<tr>
							
							<tr>
								<th scope="row">
									<label for="userName" class="req">이름</label>
								</th>
								<td>
									<div>${ loginUser.name }</div>
								</td>
							</tr>
							
							<c:forTokens items="${ loginUser.phone }" var="hp" delims="-" varStatus="status">
								<c:if test="${ status.index eq 0 }">
									<c:set var ="p1" value="${ hp }"/>
								</c:if>
								<c:if test="${ status.index eq 1 }">
									<c:set var ="p2" value="${ hp }"/>
								</c:if>		
								<c:if test="${ status.index eq 2 }">
									<c:set var ="p3" value="${ hp }"/>
								</c:if>								
							</c:forTokens>
							
							<tr>
								<th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
								<td>
									<div class="telselect_wrap input-group">
										<select id="hp1" name="hp1" class="form-select" required>
											<option value="010" 
												<c:if test="${ p1 == 010 }">selected</c:if>>010</option>
											<option value="011"
												<c:if test="${ p1 == 011 }">selected</c:if>>011</option>
											<option value="016"
												<c:if test="${ p1 == 016 }">selected</c:if>>016</option>
											<option value="017"
												<c:if test="${ p1 == 017 }">selected</c:if>>017</option>
											<option value="018"
												<c:if test="${ p1 == 018 }">selected</c:if>>018</option>
											<option value="019"
												<c:if test="${ p1 == 019 }">selected</c:if>>019</option>
										</select> 
										<b class="SC"><i class="far fa-window-minimize"></i></b> 
										
										<input type="text"  id="hp2" name="hp2" class="reg_input form-control" value="${ p2 }" minlength="3" maxlength="4" required> 
										
										<b class="SC"><i class="far fa-window-minimize"></i></b> 
										
										<input type="text" id="hp3" name="hp3" class="reg_input form-control" value="${ p3 }" minlength="4" maxlength="4" required>
									</div> 

									<input type="hidden" name="old_mb_hp" value="">
								</td>

							</tr>
							
							<c:forTokens items="${ loginUser.address }" var="addr" delims="," varStatus="status">
								<c:if test="${ status.index eq 0 }">
									<c:set var ="addr1" value="${ addr }"/>
								</c:if>
								<c:if test="${ status.index eq 1 }">
									<c:set var ="addr2" value="${ addr }"/>
								</c:if>		
								<c:if test="${ status.index eq 2 }">
									<c:set var ="addr3" value="${ addr }"/>
								</c:if>								
							</c:forTokens>
							
							<tr>
								<th scope="row"><label for="reg_mb_zip" class="req">주소</label></th>
								<td>
									<div class="input-group">
										<input type="text" name="postcode" id="postcode" value="${ addr1 }"
											class="reg_input form-control" placeholder="우편번호" required readonly>&nbsp
										<div>
											<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
									</div> 
									<input type="text" name="address1" id="address1" class="reg_input form-control" value="${ addr2 }" placeholder="주소" readonly required> 
									<input type="text" name="address2" id="address2" class="reg_input form-control" value="${ addr3 }" placeholder="상세주소" required>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
								<td>
									<div>${ loginUser.email }</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">회원 등급</label></th>
								<td>
									<div>${ loginUser.grade }</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">가입 일자</label></th>
								<td>
									<div>${ loginUser.createDate }</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="row" style="margin: auto;">
							<button class="btn btn-primary col" type="button" id="quitOpenBtn" onclick="quitOpenOpen();">회원 탈퇴</button>
							
							<span class="col-1"></span>
							
							<button class="btn btn-primary col" type="submit" id="btn_submit">회원 정보 수정</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 확인 Modal 창 -->
	<form id="pwdChangeForm" name="pwdChangeForm" action="${ contextPath }/member/pwdupdate" onsubmit="return pwdChangeCheck(this)" method="post">
		<div class="modal fade" id="pwdChangeModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">비밀번호 변경하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
	
					<div class="modal-body">
						<input type="password" name="pwdOrigin" id="pwdOrigin" class="form-control" placeholder="현재 비밀번호" required><hr>
						<input type="password" name="pwdChange" id="pwdChange" class="form-control" placeholder="새 비밀번호" required>
						<input type="password" id="pwdChange2" class="form-control" placeholder="새 비밀번호 확인" required>
					</div>
	
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary" id="pwdChangeSubmit">수정</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script>
	
		// 탈퇴하기 버튼 클릭 시
		function quitOpenOpen() {

			window.open('${ contextPath }/member/quitPage', 'popup1',
					'width=800, height=450');
		}
		
		// 비밀번호 변경하기 버튼 클릭 시
		document.getElementById("pwdChangeBtn").onclick = function() {
			$("#pwdChangeModal").modal("show");
		}
		
		// 비밀번호 변경 유효성 검사
		function pwdChangeCheck(f) {
			
			// 비밀번호 검사 1 - 일치
			if (f.pwdChange.value != f.pwdChange2.value) {
				alert("비밀번호가 같지 않습니다.");
				f.pwdChange2.value = "";
				f.pwdChange2.focus();
				return false;
			} 
			if(f.pwdOrigin.value == f.pwdChange.value){
				alert("현재 비밀번호와 변경할 비밀번호가 같습니다.");
				f.pwdChange.focus();
				return false;
			} 
			
			// 비밀번호 검사 2 - 8~16자 영문 대 소문자, 숫자, 특수문자 사용 
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			if (false === reg.test(f.pwdChange.value)) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				f.pwdChange.value = "";
				f.pwdChange2.value = "";
				f.pwdChange.focus();
				return false;
			} 
		}
		
		
		
		
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	/*--------- 다음 주소 API ---------*/
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName
										: data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							addr += extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode;
						document.getElementById("address1").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("address2").focus();
					}
				}).open();
	}
	</script>
</body>
</body>
</html>