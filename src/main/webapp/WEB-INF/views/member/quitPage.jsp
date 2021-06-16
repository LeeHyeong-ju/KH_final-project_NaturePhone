<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
 <!-- 자바스크립트-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
    <!-- Font Awesome5 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
    .main-div {
        background: #ffffff none repeat scroll 0 0;
        border-radius: 2px;
        
        max-width: 850px;
        padding: 50px 70px 50px 71px;
    }

    p {
        font-size: 13px;
    }
    .b{
        margin-bottom: 10px;
    }
    .btn{
        font-size: 13px;
    }
    .quitEtc {
    font-size: 12px;
    height: 100px;
    overflow: auto;
    resize: none;
    }
    .form-check{
        font-size: 13px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row">
        
            <!-- 내용 -->
			<form>
				<div class="col-md-12 content">
					<div class="main-div">
						<div>
							<b>주의사항</b><br>
							<p>탈퇴 시 회원님께서 이용하시던 쪽지 및 작성하신 게시글 등 모든 서비스 이용이 불가능하게 되며, 탈퇴
								이후에는 본인 여부 확인이 불가능하오니 삭제를 원하실 경우 탈퇴 전 삭제해 주시기 바랍니다.</p>
							<hr>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="b">
									<b>탈퇴 사유(필수)</b>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="quitType"
										id="quitReason1" value="개인정보유출우려"> <label
										class="form-check-label" for="quitReason1">개인정보 유출 우려</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="quitType"
										id="quitReason2" value="교환/환불/품질불만"> <label
										class="form-check-label" for="quitReason2">교환/환불/품질 불만</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="quitType"
										id="quitReason3" value="서비스속도불만"> <label
										class="form-check-label" for="quitReason3">서비스 속도 불만</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="quitType"
										id="quitReason4" value="이용빈도낮음"> <label
										class="form-check-label" for="quitReason4">이용빈도 낮음</label>
								</div>
							</div>
							<div class="col-6">
								<div class="b">
									<b>그 외에 남기고 싶으신 의견(선택)</b>
								</div>
								<textarea class="form-control quitEtc" name="quitContent" id="quitContent" maxlength="100" placeholder="100자 이내로 입력해주세요."></textarea>
							</div>
						</div>
						<br>
						<div class="row" style="margin: auto;">
							<button class="btn btn-success col" type="button" id="pwCheckModelOpen">탈퇴 하기</button>
							<span class="col-1"></span>
							<button type="button" class="btn btn-secondary col" id="closeQuit">취소</button>
						</div>
					</div>
				</div>
				
				<!-- 비밀번호 확인 Modal 창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">비밀번호를 입력하세요</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							
							<div class="modal-body">
							<input type="password" name="pwd" id="pwd" class="form-control">
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-success" id="quitSubmit">탈퇴하기</button>
							</div>
						</div>
					</div>
				</div>
				
			</form>

		</div>
     </div>

	<script>
	
		// 탈퇴 클릭 시 이벤트
		document.getElementById('pwCheckModelOpen').onclick = function(){
			if (!$('input:radio[name=quitType]:checked').val()) {
				alert("탈퇴 사유를 선택해주세요.");
				return false;	
			} else {
				$("#exampleModal").modal("show");
				return false;
			}
		}
		
		// 취소 시 새창 꺼짐
		document.getElementById('closeQuit').onclick = function() {
			window.close();
		}
		
		// ajax로 값 넘기기
		$("#quitSubmit").on("click", function() {
			
			var inputPass = document.getElementById('pwd').value;
		
			if (inputPass != null) {
				var pwd = inputPass.trim();

				if (pwd != "" && pwd != undefined) {
					var quitType = $('input[name="quitType"]:checked').val();
					var	quitContent = document.getElementById('quitContent').value;
					var param = { "pwd" : pwd, "quitType" : quitType, "quitContent" : quitContent };
				
					$.ajax ({            
	                    type: 'POST',
	                    data: JSON.stringify(param),
	                    url: "${ contextPath }/member/delete",
	                    dataType: "text",
	                    contentType: "application/json; charset=UTF-8",
	                    success: function(data) {
	                    	if(data == 'success'){
	                        	alert("탈퇴가 처리되었습니다. 그동안 이용해주셔서 감사합니다.");
	                        	window.close();
	                        	opener.parent.location='${ contextPath }'
	                    	} else if('inconsistency'){
	                    		alert("비밀번호가 일치하지 않습니다.");
	                    	}
	                    },
	                    error: function(e){
	                        alert("error code : " + e.status + "\n"
	                                + "message : " + e.responseText);
	                    }            
	                });    

				} else {
					alert("비밀번호를 제대로 입력해주세요.");    
				}
			}
		});
	</script>
</body>
</html>