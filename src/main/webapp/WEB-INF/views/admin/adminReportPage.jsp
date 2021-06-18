<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지-신고관리</title>
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
    
    .nonContent {
       text-align : center;
       font-size:14px;
    }
    .panel > h5 {
		font-weight:bold;
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
                    class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">회원 관리</a></li>
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
                        <h5>신고 관리</h5>
                        <hr>
                    </div>
                    <c:set var="no" value="0"/>
                    <c:choose>
                    <c:when test="${ !empty rplist }">
                    <table class="table table-hover">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-3">회원명</th>
                            <th scope="col" class="col-3">가입일자</th>
                            <th scope="col" class="col-3">등급변경</th>
                            <th scope="col" class="col-2">탈퇴</th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach items="${ mlist }" var="m" varStatus="status">
                          <tr>
                            <th scope="row" onclick="memberDetail(${ m.userNo });">${ m.userNo }</th>
                            <td onclick="memberDetail(${ m.userNo });">${ m.name }</td>
                            <td onclick="memberDetail(${ m.userNo });">${ m.createDate }</td>
                            <td>
                            	<select id="member-grade-select" style="border-radius:5px; border:1px solid lightgray; height:25px;">
                            		<option <c:if test="${ m.grade eq '일반회원' }">selected</c:if>>일반회원</option>
                            		<option <c:if test="${ m.grade eq '블랙회원' }">selected</c:if>>블랙회원</option>
                            	</select>
                            </td>
                            <td><button type="button" class="btn-secondary" style="width:45px; height:25px; border-radius:5px; border:none; font-size:13px;"
                            	onclick="location.href='${contextPath}/admin/memberQuit?userNo=' + ${ m.userNo }">탈퇴</button></td>
                          </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                     
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
                              value="/admin/memberList">
                              <c:param name="page" value="${ pi.currentPage -1 }" />
                           </c:url>
                           <a class="page-link" href="${ before }" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                           </a>
                        </c:if>
   
                        <!-- 페이지 숫자 -->
                        <c:forEach var="p" begin="${ pi.startPage }" end="${pi.endPage }">
                           <c:if test="${ p eq pi.currentPage }">
                              <li class="page-item"><a class="page-link">${ p }</a></li>
                           </c:if>
                           <c:if test="${ p ne pi.currentPage }">
                              <c:url var="pagination"
                                 value="/admin/memberList">
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
                              value="/admin/memberList">
                              <c:param name="page" value="${ pi.currentPage + 1 }" />
                           </c:url>
                           <a class="page-link" href="${ after }" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                           </a>
                        </c:if>
                     </ul>
                  </nav>
                  </c:when>
                  <c:otherwise>
                     <div class="nonContent">회원정보가 존재하지 않습니다.</div>
                  </c:otherwise>
                  </c:choose>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		$("#member-grade-select").on("change", function(e){
    			target = $(e.target);
    			var grade = target.val();
    			var userNo = target.parent().siblings('th').html();
    			
    			$.ajax({
					url : "${ contextPath }/admin/memberGrade",
					data : { grade : grade, userNo : userNo },
					type : "post",
					success : function(result){
						if(result == 1){
							alert("회원 등급이 변경되었습니다.");
						}
						else if(result == 0){
							alert("회원 등급 변경에 실패하였습니다.");
							target.val(grade).prop("selected", false);
						}
					},
					error : function(e){
						console.log(e);
					}
				});
    		});
    	});
    	function memberDetail(userNo){
			location.href = '${contextPath}/admin/memberDetail?userNo=' + userNo;
		}
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>