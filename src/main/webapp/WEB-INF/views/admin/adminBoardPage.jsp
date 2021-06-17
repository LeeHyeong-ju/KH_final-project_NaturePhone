<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지-게시글관리</title>
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
    .panel h5,select{
   		display:inline;
    }
    #board-category-select {
    	float:right;
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
                        <h5>게시글 관리</h5>
                        <select id="board-category-select">
                        	<option value="자유" <c:if test="${ cg eq '자유' }">selected</c:if>>자유게시판</option>
                        	<option value="뉴스" <c:if test="${ cg eq '뉴스' }">selected</c:if>>모바일뉴스</option>
                        	<option value="공지" <c:if test="${ cg eq '공지' }">selected</c:if>>공지사항</option>
                        	<option value="질문" <c:if test="${ cg eq '질문' }">selected</c:if>>Q&A</option>
                        	<option value="설문" <c:if test="${ cg eq '설문' }">selected</c:if>>회원설문</option>
                        </select>
                        <hr>
                    </div>
                    <c:set var="no" value="0"/>
                    <c:choose>
                    <c:when test="${ !empty blist }">
                    <table class="table table-hover">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-2">작성자</th>
                            <th scope="col" class="col-5">제목</th>
                            <th scope="col" class="col-2">작성일</th>
                            <th scope="col" class="col-2">삭제처리</th>
                          </tr>
                        </thead>

                        <tbody>
                          <c:forEach items="${ blist }" var="b" varStatus="status">
                          <tr>
                            <th scope="row" onclick="boardDetail(${ b.bno });">${ b.bno }</th>
                            <td onclick="boardDetail(${ b.bno });">${ b.writer_id }</td>
                            <td onclick="boardDetail(${ b.bno });">${ b.btitle }</td>
                            <td onclick="boardDetail(${ b.bno });">${ b.bcreateDate }</td>
                            <td><button type="button" class="btn-secondary" style="width:45px; height:25px; border-radius:5px; border:none; font-size:13px;"
                            	onclick="boardDelete(${ b.bno });">삭제</button></td>
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
                              value="/admin/boardList?category=${ cg }">
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
                                 value="/admin/boardList?category=${ cg }">
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
                              value="/admin/boardList?category=${ cg }">
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
                     <div class="nonContent">게시글이 존재하지 않습니다.</div>
                  </c:otherwise>
                  </c:choose>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	$(function(){
    		$("#board-category-select").on("change", function(e){
    			var category = $(e.target).val();
    			location.href="${contextPath}/admin/boardList?category=" + category;
    		});
    	});
    	function boardDetail(bno){
    		var category = '${ cg }';
    		
    		switch(category){
    		case "자유": location.href="${contextPath}/boardFree/detail?bno=" + bno; break;
    		case "뉴스": location.href="${contextPath}/boardMobile/detail?bno=" + bno; break;
    		case "공지": location.href="${contextPath}/notice/detail?bno=" + bno; break;
    		case "설문": location.href="${contextPath}/boardSurvey/detail?s_no=" + bno; break;
    		case "질문": break;
    		default: alert("게시글 상세조회에 실패하였습니다.");
    		}
		}
    	function boardDelete(bno){
    		var category = '${ cg }';
    		
    		location.href="${contextPath}/admin/boardDelete?bno=" + bno + "&category=" + category;
		}
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>

</html>