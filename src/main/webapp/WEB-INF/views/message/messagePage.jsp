<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
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
 /* 테이블 */
    .table{
        text-align: center;
        font-size:13px;
    }
    td:nth-child(3) {
        text-align: left;
    }
    .messageMove{
      text-align: center;
    }
    .btn{
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
					<div class="panel row">
						<div class="col-7">
							<h5 id="mType">${ message.type }</h5>
						</div>
						
						
						<div class="col-5">
						
						<form action="${ contextPath }/message/search" method="GET">
						<div class="input-group input-group-sm mb-3" >
							<select  class="form-select form-select-sm" id="searchCondition" name="searchCondition">
								<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
								<option value="content" <c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
								<option value="writer" <c:if test="${ param.searchCondition == 'name' }">selected</c:if>>이름</option>
							</select>
							<input type="search" class="form-control" name="searchValue" style="width:100px;" value="${ param.searchValue }" required>
							<input type="hidden" name="type" value="${ message.type }">
							<button class="btn btn-primary btn-sm">검색</button>
						</div>
						
						</form>
						
						</div>

					</div>
					<hr style="margin-top: -8px;">
					
					<form id="delList">
					<table class="table table-hover">
						<thead class="table-light">
							<tr>
							
							<c:choose>
                        	<c:when test="${ message.type eq '받은 쪽지함' }">
                        		<th scope="col" class="col-1">
                        			<input type="checkbox" name='selectall' value='selectall' onclick='selectAll(this)'>
                        		</th>
                            	<th scope="col" class="col-2">분류</th>
								<th scope="col" class="col-5">제목</th>
								<th scope="col" class="col-2">보낸 사람</th>
								<th scope="col" class="col-2">받은 일시</th>
                            </c:when>
                            <c:when test="${ message.type eq '보낸 쪽지함' }">
                            	<th scope="col" class="col-1">
                            		<input type="checkbox" name='selectall' value='selectall' onclick='selectAll(this)'>
                            	</th>
                            	<th scope="col" class="col-2">상태</th>
								<th scope="col" class="col-5">제목</th>
								<th scope="col" class="col-2">받는 사람</th>
								<th scope="col" class="col-2">보낸 일시</th>
                            </c:when>
                        	</c:choose>	
								
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${ list }" var="m">
								<tr onclick="selectMessage(${ m.messageNo });">
								<c:choose>
		                        	<c:when test="${ message.type eq '받은 쪽지함' }">
		                        		<th scope="row" onclick="event.cancelBubble=true">
		                        			<input type="checkbox" name='checkRow' value="${ m.messageNo }" onclick='checkSelectAll()'>
		                        		</th>
		                        		
		                        		<c:if test="${ m.senderNo == 1 }">
										<td style="color:red;">중요</td>
										</c:if>
										<c:if test="${ m.senderNo != 1 }">
										<td>일반</td>
										</c:if>
										
										<td>${ m.messageTitle }</td>
										<td>${ m.userId }</td>
										<td>${ m.createDate }</td>
										
		                            </c:when>
		                            
		                            <c:when test="${ message.type eq '보낸 쪽지함' }">
		                            	<th scope="row" onclick="event.cancelBubble=true">
		                            		<input type="checkbox" name='checkRow' value="${ m.messageNo }" onclick='checkSelectAll()'>
		                            	</th>
		                            	
		                        		<c:if test="${ m.viewStatus == 'Y' }">
										<td style="color:blue;">읽음</td>
										</c:if>
										<c:if test="${ m.viewStatus == 'N'}">
										<td>안읽음</td>
										</c:if>
										
										<td>${ m.messageTitle }</td>
										<td>${ m.userId }</td>
										<td>${ m.createDate }</td>
		                            </c:when>
	                        	</c:choose>	
									
								</tr>

							</c:forEach>

						</tbody>

					</table>
					</form>
					
					<!-- 페이징 처리 -->
					<div class="row messageMove">
						<div class="col"></div>
						<div class="col">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<!-- 이전 -->
									<c:if test="${pi.currentPage <= 1 }">
										<li class="page-item"><a class="page-link"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before"
											value="/message/selectList?type=${ message.type }">
											<c:param name="page" value="${ pi.currentPage -1 }" />
										</c:url>
										<a class="page-link" href="${ before }" aria-label="Previous">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</c:if>

									<!-- 페이지 숫자 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="page-item active"><a class="page-link">${ p }</a></li>
										</c:if>
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination"
												value="/message/selectList?type=${ message.type }">
												<c:param name="page" value="${ p }" />
											</c:url>
											<a class="page-link" href="${ pagination }">${ p }</a>
										</c:if>
									</c:forEach>

									<!-- 다음 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="page-item"><a class="page-link"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after"
											value="/message/selectList?type=${ message.type }">
											<c:param name="page" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a class="page-link" href="${ after }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</c:if>
								</ul>
							</nav>
						</div>
						<div class="col">
							<button type="button" id="delectMessageBtn" class="btn btn-primary btn-sm" onclick="deleteMessage()">삭제하기</button>
						</div>
					</div>
				</div>
				
				
			</div>
        </div>
    </div>
   
    <script>
    
    	/*---------------- 쪽지 상세 ----------------*/
    	function selectMessage(messageNo){
    		location.href = '${ contextPath }/message/detail?type=${ message.type }&messageNo=' + messageNo + '&page=${ pi.currentPage }';
    	} 
    	
    	
    	
    	/*---------------- 체크박스 동작 ----------------*/
    	function checkSelectAll()  {
    		  // 전체 체크박스
    		  const checkboxes 
    		    = document.querySelectorAll('input[name="checkRow"]');
    		  // 선택된 체크박스
    		  const checked 
    		    = document.querySelectorAll('input[name="checkRow"]:checked');
    		  // select all 체크박스
    		  const selectAll 
    		    = document.querySelector('input[name="selectall"]');
    		  
    		  if(checkboxes.length === checked.length)  {
    		    selectAll.checked = true;
    		  }else {
    		    selectAll.checked = false;
    		  }

    		}
    	
    	function selectAll(selectAll)  {
    		  const checkboxes 
    		     = document.getElementsByName('checkRow');
    		  
    		  checkboxes.forEach((checkbox) => {
    		    checkbox.checked = selectAll.checked
    		  })
    		}
    	
    	/*---------------- 삭제버튼 눌렀을 때 ----------------*/
		function deleteMessage(){
    		var type = "${ message.type }";	
    		var ckArr = [];					
        	$("input[name=checkRow]:checked").each(function(){
        		var chk = $(this).val();
        		console.log(chk);
        		ckArr.push(chk);
        	})
        		
        	
        	// 쪽지가 선택 되지 않았을 때
        	if(ckArr.length == 0){
        		alert("삭제할 쪽지를 선택해주세요.");
        	
        	// 쪽지가 선택 되었다면
        	} else{
        		// 정말 삭제할 것인지 확인
	        	if(confirm("선택 된 쪽지를 삭제하시겠습니까?") == true){
	        		console.log(ckArr);
	        		console.log(type);
	        		$.ajax({
	        			type : 'POST',
	        			url : "${ contextPath }/message/delete",
	        			data:{ "ckArr" : ckArr, "type" : type },
	        			dataType: "text",
	                    success: function(data) {
	                    	if(data == 'success'){
	                    		location.reload();
	                        	alert("삭제가 완료되었습니다.");
	                    	} else {
	                    		alert("삭제 실패.");
	                    	}
	                    },
	                    error: function(e){
	                        alert("error code : " + e.status + "\n"
	                                + "message : " + e.responseText);
	                    }        
	        		});
	        	
	        	// 취소 버튼 눌렀을 때	페이지 reload
	        	} else {	
	        		location.reload(true);
	        	}
        		
        	}
        	
    	}
    	
    	
		
		
    
    	
    </script>
</body>


</html>