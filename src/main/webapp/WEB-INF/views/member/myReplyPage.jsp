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
						<li><a href="${ contextPath }/member/myReplyList" class="list-group-item list-group-item-action sideContent">나의
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
                    <div class="panel">
                        <h5>나의 게시글</h5>
                        <hr>
                    </div>
                    <table class="table table-hover">
                    <c:set var="no" value="0"/>
                    <c:choose>
                    <c:when test="${ !empty list }">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-2">분류</th>
                            <th scope="col" class="col-7">댓글 내용</th>
                            <th scope="col" class="col-2">작성일자</th>
                          </tr>
                        </thead>

                        <tbody>
                          
                          <c:forEach items="${ list }" var="n" varStatus="status">
                          <tr>
                            <th scope="row">${ status.count }</th>
                            
                            <td>${ n.category }</td>
                            <td>${ n.content }</td>
                            <td>${ n.createDate }</td>
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
										value="/member/myBoardList">
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
											value="/member/myBoardList">
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
										value="/member/myBoardList">
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
							<div class="nonContent">작성하신 글이 존재하지 않습니다.</div>
						</c:otherwise>
						
						</c:choose>
                      
                      
						
						
                </div>
            </div>
        </div>
    </div>
	
	
	
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>