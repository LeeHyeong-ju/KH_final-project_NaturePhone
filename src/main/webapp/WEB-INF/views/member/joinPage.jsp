<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 2단계</title>
<!-- 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<style>
.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 850px;
	padding: 50px 70px 70px 71px;
}

.btn {
	font-size: 13px;
}

span {
	color: red;
	
}

#joinForm * {
	font-size: 13px;
}

.idOverlapTd{
	padding-top: 0px;
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
			<div class="col-md-2"></div>

			<!-- 내용 -->
			<div class="col-md-8 content">
				<div class="main-div">
					<div class="panel">
						<h5>회원 가입</h5>
						<hr>
					</div>

					<form action="${ contextPath }/member/join" id="joinForm" onsubmit="return joinFormSubmit(this);" method="post">
						<table class="table align-middle table-borderless">
							<tr>
								<th class="col-3">
									<span> * </span>
									<label for="id" class="req">아이디</label>
								</th>
								<td class="input-group">
									<input type="text" id="id" name="id" class="JoinInput form-control" minlength="4"
									maxlength="20" placeholder="영문 소문자로 시작, 영문 소문자 또는 숫자를 4~20자 조합해주세요." required>
								</td>
							</tr>
							
							<tr id="idOverLapTr" style="display:none;">
								<th class='col-3'></th> 
								<td class='input-group' style='padding-top: 0px;'>
									<span id="idOverlap"></span>
								</td>
							</tr>
							
							<tr>
								<th scope="row">
									<span> * </span>
									<label for="pwd" class="req">비밀번호</label>
								</th>
								<td>
									<input type="password" name="pwd" id="pwd"  class="JoinInput form-control" minlength="8"
											maxlength="16" placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요." required>
								</td>
							</tr>
							
							<tr>
								<th scope="row">
									<span> * </span>
									<label for="pwd2" class="req">비밀번호 확인</label>
								</th>
								<td>
									<input type="password" name="pwd2" id="pwd2"  class="JoinInput form-control" minlength="8" maxlength="16" required> 
									<span id="msg_mb_pw" class="reg_msg"></span>
								</td>
							</tr>
							
							<tr>
								<th scope="row">
									<span> * </span> 
									<label for="userName" class="req">이름</label>
								</th>
								<td>
									<input type="text" name="name" id="name"class="JoinInput form-control" minlength="2" maxlength="20" required>
								</td>

							</tr>
							<tr>
								<th scope="row">
									<span> * </span>
									<label for="reg_mb_hp" class="req">휴대전화</label>
								</th>
								<td>
									<div class="telselect_wrap input-group">
										<select id="hp1" name="hp1" class="form-select" required>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select> 
										<b class="SC"><i class="far fa-window-minimize"></i></b> 
										
										<input type="text"  id="hp2" name="hp2" class="reg_input form-control" minlength="3" maxlength="4" required> 
										
										<b class="SC"><i class="far fa-window-minimize"></i></b> 
										
										<input type="text" id="hp3" name="hp3" class="reg_input form-control" minlength="4" maxlength="4" required>
									</div> 
								</td>
							</tr>

							<tr>
								<th scope="row">
									<span> * </span>
									<label for="reg_mb_zip" class="req">주소</label>
								</th>
								<td>
									<div class="input-group">
										<input type="text" name="postcode" id="postcode"
											class="reg_input form-control" placeholder="우편번호" required readonly>&nbsp
										<div>
											<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										</div>
									</div> 
									<input type="text" name="address1" id="address1" class="reg_input form-control" placeholder="주소" readonly required> 
									<input type="text" name="address2" id="address2" class="reg_input form-control" placeholder="상세주소" required>
								</td>
							</tr>

							<tr>
								<th scope="row"><span> * </span><label for="reg_mb_email"
									class="req">이메일</label></th>
								<td>

									<div class="emailselect_wrap input-group" id="emailDIV">
										<input type="text" name="email1" id="email1" value="" class="reg_input form-control" maxlength="20">

										<p class="SC" style="margin-bottom: 0px; margin-top: 5px;">@</p>

										<input type="text" name="email2" id="email2" value="" class="reg_input form-control" maxlength="20" required readonly>&nbsp 
										
										<select name="email3" id="email3" class="form-select" required onchange="emailAddress(this)" >
											<option value="" selected>선택하세요</option>
											<option value="1">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
										</select>
										&nbsp 
										<div>
                                            <button type="button" class="btn btn-primary" onclick="">메일 인증</button>
                                        </div>
										
									</div> 
								</td>
								
							</tr>
							<tr id="emailOverLapTr" style="display: none;">
								<th class='col-3'></th>
								<td class='input-group' style='padding-top: 0px;'>
								<span id="emailOverLap"></span>
								</td>
							</tr>

						</table>
						<p style="font-weight:bold; text-align:center;"><i class="fas fa-star" style="color:red;"></i> 주의 : 이메일 인증을 하셔야 로그인이 가능합니다. 정확한 이메일을 적어주세요.</p>
						
						<hr>
						
						<br>
						<div class="row" style="margin: auto;">
							<a href="" class="btn btn-primary col">취소</a> <span class="col-1"></span>
							<button class="btn btn-primary col" type="submit" value="회원 가입"
								id="btn_submit" accesskey="s">가입 하기</button>
						</div>

					</form>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		// 이메일 주소 선택
		function emailAddress(e) {
			var ea = $(e);
			
			var email2 = $('input[name=email2]');

			if (ea.val() == "1") {
				email2.attr('readonly', false);
				email2.val('');
				
			} else {
				email2.attr('readonly', true);
				email2.val(ea.val());
			}
			
		}
		
		// 아이디 중복 확인 - Ajax
		$("#id").keyup(function() {
			$.ajax({
				url : "${ contextPath }/member/idOverlap",
				type : "POST",
				data : {
					id : $("#id").val()
				},
				success : function(data) {
					if (data == 1) {
						$('#idOverLapTr').show();
						$("#idOverlap").text('중복된 아이디가 존재합니다.');
						$("#btn_submit").attr("disabled", "disabled");
					} else {
						$("#idOverlap").text("");
						$('#idOverLapTr').hide();
						$("#btn_submit").removeAttr("disabled");
					}
				},
				error : function(e){
					console.log("error code : " + e.status + "\n" + "message : " + e.responseText);
				}
			})
		});
		
		// 이메일 중복 확인 - Ajax
		$("#emailDIV").on('change', function(){
			var email;
			var email1 = document.getElementById("email1").value;
			var email2 = document.getElementById("email2").value;
			
			email2 = document.getElementById("email2").value;
			email = email1 + '@' + email2
			console.log(email);
			$.ajax({
				url : "${ contextPath }/member/emailOverlap",
				type : "POST",
				data : { 
					email : email
				},
				success : function(data){
					console.log(data);
					if(data > 0){
						$('#emailOverLapTr').show();
						$("#emailOverLap").text('중복된 이메일이 존재합니다.');
						$("#btn_submit").attr("disabled", "disabled");
					} else {
						$("#emailOverLap").text("");
						$('#emailOverLapTr').hide();
						$("#btn_submit").removeAttr("disabled");
					}
				}
			})
		})
		

		/*--------- 로그인 폼 유효성 확인 ---------*/
		function joinFormSubmit(f) {
			
			// 회원아이디 검사 1 - 4~10자, 영어 대문자 x, 맨앞 숫자 x
			var idCheck= /^[a-z]+[a-z0-9]{3,19}$/g;
			if (!idCheck.test(f.id.value)){ 
				alert("아이디는 영어 소문자로 시작하는 4~20자 영어 소문자 또는 숫자이어야 합니다."); 
				f.id.select(); 
				return false; 
			}

			// 비밀번호 검사 1 - 일치
			if (f.pwd.value != f.pwd2.value) {
				alert("비밀번호가 같지 않습니다.");
				f.pwd2.value = "";
				f.pwd2.focus();
				return false;
			}
			
			// 비밀번호 검사 2 - 8~16자 영문 대 소문자, 숫자, 특수문자 사용 
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			if (false === reg.test(f.pwd.value)) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				f.pwd.value = "";
				f.pwd2.value = "";
				f.pwd.focus();
				return false;
			} 
			
			// 이름 검사
			for (var i = 0; i < f.name.value.length; i++) {

				var chk = f.name.value.substring(i, i + 1);

				if (chk.match(/[0-9]|[a-z]|[A-Z]/)) {
					alert("이름은 한글로 입력해 주세요.");
					f.name.select();
					return false;

				}

				if (chk.match(/([^가-힣\x20])/i)) {
					alert("이름을 정확히 입력해주세요.");
					f.name.select();
					return false;

				}

				if (chk == " ") {
					alert("이름에는 공백이 들어갈 수 없습니다.");
					f.name.select();
					return false;

				}

			}

			// 전화번호
			var re = /^[0-9]+$/;
			var hp1 = document.getElementById('hp1').value;
			if (!re.test(f.hp2.value)) {
				alert('휴대전화 번호는 숫자만 입력해야 합니다.');
				hp2.value = "";
				hp2.focus();
				return false;
			}

			if (!re.test(hp3.value)) {
				alert('휴대전화 번호는 숫자만 입력해야 합니다.');
				hp3.value = "";
				hp3.focus();
				return false;
			}
			
			// 이메일
			var regType1 = /^[A-Za-z0-9+]{4,12}$/; 

			if(!regType1.test(f.email1.value)){
				alert(f.email1.value);
				email1.value = "";
				email1.focus();
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
</html>