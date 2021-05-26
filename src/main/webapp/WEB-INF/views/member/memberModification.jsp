<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
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

.rightSpace {
	margin-top: 100px;
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

<body>

	<div class="container">

		<div class="row">

			<div class="col-md-2 rightSpace">
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">마이페이지</li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">회원
								정보</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">나의
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

					<form id="modifyMemberInfo" name="modifyMemberInfo"
						onsubmit="return modifyMemberInfo(this);" method="post">
						<table class="table align-middle table-borderless">
							<tr>
								<th class="col-3"><label for="userId" class="req">아이디</label>
								</th>
								<td class="input-group">
									<div>chichi</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userPwd" class="req">비밀번호</label></th>
								<td>
									<button type="button" class="btn btn-primary" onclick="">비밀번호
										변경</button>
								</td>
							<tr>
							<tr>
								<th scope="row"><label for="userName" class="req">이름</label>
								</th>
								<td>
									<div>홍길순</div>
								</td>
							</tr>

							<tr>
								<th scope="row"><label for="reg_mb_hp" class="req">휴대전화</label></th>
								<td>
									<div class="telselect_wrap input-group">
										<select name="hp1" id="hp1" class="form-select" required="">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select> <b>&nbsp&nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp&nbsp</b> <input
											type="text" name="hp2" value="" id="hp2"
											class="reg_input form-control" minlength="3" maxlength="4"
											required=""> <b>&nbsp&nbsp&nbsp&nbsp -
											&nbsp&nbsp&nbsp&nbsp</b> <input type="text" name="hp3" value=""
											id="hp3" class="reg_input form-control" minlength="4"
											maxlength="4" required="">

									</div> <input type="hidden" name="mb_hp" value="" id="reg_mb_hp">

									<input type="hidden" name="old_mb_hp" value="">
								</td>

							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_zip" class="req">주소</label></th>
								<td>
									<div class="input-group">
										<input type="text" name="mb_zip" id="reg_mb_zip" required=""
											class="reg_input form-control" placeholder="우편번호" readonly>&nbsp
										<div>
											<button type="button" class="btn btn-primary" onclick="">주소
												검색</button>
										</div>
									</div> <input type="text" name="mb_addr1" value="" id="reg_mb_addr1"
									required="" class="reg_input form-control" placeholder="기본주소"
									readonly> <input type="text" name="mb_addr2" value=""
									id="reg_mb_addr2" class="reg_input form-control"
									placeholder="상세주소">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="reg_mb_email" class="req">이메일</label></th>
								<td>
									<div>asdf@nate.com</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">회원
										등급</label></th>
								<td>
									<div>일반 회원</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="userName" class="req">가입
										일자</label></th>
								<td>
									<div>2021-05-21</div>
								</td>
							</tr>
						</table>
						<br>
						<div class="row" style="margin: auto;">
							<button class="btn btn-primary col">취소</button>
							<span class="col-1"></span>
							<button class="btn btn-primary col" type="submit" value="회원 가입"
								id="btn_submit" accesskey="s">회원 정보 수정</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</body>
</html>