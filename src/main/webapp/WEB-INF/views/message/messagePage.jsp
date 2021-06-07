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
						<li><a href="${ contextPath }/message/selectList?type=보관함"
							class="list-group-item list-group-item-action sideContent">보관함</a></li>
						<li><a href="${ contextPath }/message/selectList?type=휴지통"
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
					<div class="panel row">
						<div class="col-7">
							<h5>${ message.type }</h5>
						</div>

						<div class=" col-5">

							<div class="input-group input-group-sm mb-3">
								<button class="btn btn-outline-secondary dropdown-toggle"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">검색하기</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">제목</a></li>
									<li><a class="dropdown-item" href="#">내용</a></li>
									<li><a class="dropdown-item" href="#">이름</a></li>
								</ul>
								<input type="text" class="form-control"
									aria-label="Text input with dropdown button">
							</div>

						</div>

					</div>
					<hr style="margin-top: -8px;">
					<table class="table table-hover">
						<thead class="table-light">
							<tr>
								<th scope="col" class="col-1"><input type="checkbox"
									name=""></th>
								<th scope="col" class="col-2">유형</th>
								<th scope="col" class="col-5">제목</th>
								<th scope="col" class="col-2">보낸사람</th>
								<th scope="col" class="col-2">받은일시</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach items="${ list }" var="m">
								<tr>
									<th scope="row"><input type="checkbox" name=""></th>
									<td>일반</td>
									<td>${ m.messageTitle }</td>
									<td>${ m.userName }</td>
									<td>${ m.createDate }</td>
								</tr>

							</c:forEach>

						</tbody>
						<tfoot>

						</tfoot>

					</table>

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
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="page-item"><a class="page-link">${ p }</a></li>
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
							<button type="button" class="btn btn-primary btn-sm">보관함
								담기</button>
							<button type="button" class="btn btn-primary btn-sm">휴지통
								담기</button>
						</div>
					</div>
				</div>
			</div>
        </div>
    </div>
</body>
</body>

</html>