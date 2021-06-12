<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
    span {
        color: rgba(213, 70, 70, 0.809);
    }

    .massageDetileTable td, th{
        font-size: 13px;
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
						<li><a href="${ contextPath }/message/selectList?type=받은 쪽지함"
							class="list-group-item list-group-item-action sideContent">받은
								쪽지함</a></li>
						<li><a href="${ contextPath }/message/selectList?type=보낸 쪽지함"
							class="list-group-item list-group-item-action sideContent">보낸
								쪽지함</a></li>
						<li><a href="${ contextPath }/message/selectList?type=보관함"
							class="list-group-item list-group-item-action sideContent">보관함</a></li>
						<li><a href="${ contextPath }/message/selectList?type=휴지통"
							class="list-group-item list-group-item-action sideContent">휴지통</a></li>
					</ul>
				</div>

				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">주문내역</li>
						<li><a href="${ contextPath }/sellInfo/list"
							class="list-group-item list-group-item-action sideContent">나의
								판매내역</a></li>
						<li><a href="#"
							class="list-group-item list-group-item-action sideContent">나의
								구매내역</a></li>
						<li><a href="${ contextPath }/itd/list"
							class="list-group-item list-group-item-action sideContent">관심상품</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 내용 -->
			
			<div class="col-md-8 content">
                <div class="main-div">

                    <div class="panel">
                        <h5>${ detailMessage.type }</h5>
                        <hr>
                    </div>

                    <table class="table align-middle massageDetileTable">
                        <tr>
                        <c:choose>
                        	<c:when test="${ detailMessage.type eq '받은 쪽지함' }">
                            <th class="col-3">보낸 사람</th>
                            </c:when>
                            <c:when test="${ detailMessage.type eq '보낸 쪽지함' }">
                            <th class="col-3">받는 사람</th>
                            </c:when>
                        </c:choose>
                            <td>${ detailMessage.userId }</td>
                        </tr>

                        <tr>
                            <th scope="row">제목</th>
                            <td>${ detailMessage.messageTitle }</td>
                        </tr>

                        <tr style="height : 250px;">
                            <th scope="row">내용</th>
                            <td>${ detailMessage.messageContent }</td>
                        </tr>

                        <tr>
                         <c:choose>
                        	<c:when test="${ detailMessage.type eq '받은 쪽지함' }">
                            <th class="col-3">받은 일자</th>
                            </c:when>
                            <c:when test="${ detailMessage.type eq '보낸 쪽지함' }">
                            <th class="col-3">보낸 일자</th>
                            </c:when>
                        </c:choose>
                            <td>${ detailMessage.createDate }</td>
                        </tr>
                    </table>
                    
                    <div class="row" style="margin :auto;">
                        <button class="btn btn-primary col-5 mx-auto" type="button" style="font-size: 13px;" onclick="window.history.back()">이전으로</button>
                    <c:if test="${ detailMessage.type eq '받은 쪽지함' }">
                        <span class="col-2"></span>
                        <button class="btn btn-primary col-5" id="sendBtn" data-bs-toggle="modal" type="button" style="font-size: 13px;" onclick="return userStatusCK()">답장하기</button>
                    </c:if>  
                    </div>
                    
                </div>
            </div>

			<!-- Modal -->
			<div class="modal fade" id="sendMessage" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="sendMessageLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="sendMessageLabel">쪽지 보내기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						
						<form action="${ contextPath }/message/insert" method="POST">
						<div class="modal-body">
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label"><b>받는 사람 </b>: ${ detailMessage.userId }</label>
			                        <input type="hidden" name="recipientNo" value="${ detailMessage.senderNo }">
									<input type="hidden" name="senderNo" value="${ loginUser.userNo }">
								</div>
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label" ><b>제목</b></label>
									<input type="text" class="form-control" name="messageTitle" required>
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label"><b>내용 </b></label>
									<textarea class="form-control" name="messageContent" id="messageContent" style="resize: none; height:210px;"placeholder="200자 이내로 입력하세요" required></textarea>
									<input readonly class="form-control-plaintext" id="count" style="border: 0; outline:0; text-align:right;">
								</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소" onClick="window.location.reload()">
							<button type="submit" class="btn btn-primary">보내기</button>
						</div>
						</form>
						
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	/*------------- 실시간 글자수 카운팅 -------------*/
	$("#messageContent").on("propertychange change keyup paste input", function() {
		var content = $(this).val();
		$("#count").val("(" + content.length + "/ 200)"); 
		if (content.length > 200) {
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 200));
			$('#count').html("(200 / 최대 200자)");
		}
	});
	/*------------- 탈퇴한 회원일 때 쪽지 못보내게 하기 -------------*/
	function userStatusCK(){
		if('${ detailMessage.userStatus }' == 'N'){
			alert("탈퇴한 회원입니다.");
			return false;
		}
		$("#sendMessage").modal("show");
	}
	
	</script>
		
</body>

</html>