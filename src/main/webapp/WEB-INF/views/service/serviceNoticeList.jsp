<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 자바스크립트-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- Font Awesome5 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>공지사항</title>
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
    .sideTitle{
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
    
    .table{
        text-align: center;
        font-size:13px;
    }
    td:nth-child(2) {
        text-align: left;
    }
    
    .searchArea {
      margin-top : 30px;
      padding : 10px;
      text-align : center;
   }
   
   .searchArea * {
      height : 30px;
      vertical-align:middle;
      margin:5px;
   }
   
   .searchArea button {
      background-color: #56CE7C;
      color:white;
      width : 100px;
      border : none;
   }
   
   .searchArea input[type=search]{
      width : 250px;
   }
   
   tbody > tr:hover {
   	  cursor : pointer;
   }
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-2 rightSpace" style="margin-top: 100px;">
                <div class="list-group col-md-10 sideBar">
                    <ul>
                        <li class="list-group-item sideTitle">고객센터</li>
                        <li><a href="${ contextPath }/notice/list" class="list-group-item list-group-item-action sideContent">공지사항</a></li>
                        <li><a href="${ contextPath }/qna/list" class="list-group-item list-group-item-action sideContent">Q&A</a></li>
                    </ul>
                </div>               
            </div>
            <!-- 내용 -->                                 
            <div class="col-md-8 content">
                <div class="main-div">
                    <div class="panel">
                        <h5>공지사항</h5>
                        <hr>
                    </div>
                    <table class="table table-hover">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-5">제목</th>
                            <th scope="col" class="col-1">작성자</th>
                            <th scope="col" class="col-1">공감</th>
                            <th scope="col" class="col-1">조회</th>
                            <th scope="col" class="col-2">등록일</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${ list }" var="notice">
                          <tr onclick="selectNotice(${ notice.bno });">
                            <th scope="row">${ notice.bno }</th>
                            <td style="overflow:hidden;">${ notice.btitle }</td>
                            <td>${ notice.writer_id }</td>
                            <td>${ notice.brecom }</td>
                            <td>${ notice.bcount }</td>
                            <td>${ notice.bcreateDate }</td>
                          </tr>
                          </c:forEach>             
                        </tbody>
                        <tfoot>
                          <!--  페이징바 구간 -->
						  <tr>
							<td colspan="12">
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">
								[이전] &nbsp;
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="/notice/list">
									<c:param name="page" value="${ pi.currentPage -1 }"/>
								</c:url>
							<a href="${ before }">[이전]</a>&nbsp;
							</c:if>					
							<!-- 페이지 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<font color ="red" size="4"><b>[ ${ p } ]</b></font>&nbsp;
								</c:if>
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="/notice/list">
										<c:param name="page" value="${ p }"/>
									</c:url>
								<a href="${ pagination }">${ p }</a>&nbsp;
								</c:if>	
							</c:forEach>					
							<!-- [다음] -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								[다음]
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="after" value="/notice/list">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url>
								<a href="${ after }">[다음]</a>
							</c:if>
							<c:if test="${ !empty loginUser && loginUser.grade eq '관리자' }">
								<div class="btnArea" style="float:right;">
									<button class="btn btn-secondary" onclick="location.href='${ contextPath }/notice/write'">글쓰기</button>			
								</div>
							</c:if>
							</td>			
						  </tr>
                        </tfoot>                     
                      </table>
			
			<div class="searchArea">
			<form action="${ contextPath }/notice/search" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>전체</option>
					<option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
					<option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
					<option value="content" <c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
				</select>
				<input type="search" name="searchValue" value="${ param.searchValue }">
				<button>검색</button>
			</form>
		</div>
			
			<script>
				function selectNotice(bno){
					location.href = '${contextPath}/notice/detail?bno=' + bno + '&page=${pi.currentPage}';
				}		
			</script>    
          </div>           
        </div>               
      </div>
    </div>     
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>