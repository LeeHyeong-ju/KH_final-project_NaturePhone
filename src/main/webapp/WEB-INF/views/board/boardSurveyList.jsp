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
    <!-- 부트스트랩 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
    <!-- Font Awesome5 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>메뉴바</title>
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
    td:nth-child(3) {
        text-align: left;
    }
    
     #listTable{
      text-align:center;
      width : 100%;
      min-width : 570px;
      line-height : 2.5;
      border-collapse : collapse;
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
	      background-color: #4CAF50;
	      color:white;
	      width : 100px;
	      border : none;
	   }
	   
	   .searchArea input[type=search]{
	      width : 250px;
	   }
   
   
</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-2 rightSpace" style="margin-top: 100px;">
                <div class="list-group col-md-10 sideBar">
                    <ul>
                        <li class="list-group-item sideTitle">커뮤니티</li>
                        <li><a href="${ contextPath }/boardMobile/list" class="list-group-item list-group-item-action sideContent">모바일 뉴스</a></li>
                        <li><a href="${ contextPath }/boardFree/list" class="list-group-item list-group-item-action sideContent">자유게시판</a></li>
                        <li><a href="${ contextPath }/boardSurvey/list" class="list-group-item list-group-item-action sideContent">회원 설문</a></li>
                    </ul>
                </div>               
            </div>
            <!-- 내용 -->                                 
            <div class="col-md-8 content">
                <div class="main-div">
                    <div class="panel">
                        <h5>회원 설문</h5>
                        <hr>
                    </div>
                    <table class="table table-hover">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-1">분류</th>
                            <th scope="col" class="col-5">제목</th>
                            <th scope="col" class="col-1">작성자</th>
                            <th scope="col" class="col-1">참가자</th>
                            <th scope="col" class="col-1">조회</th>
                            <th scope="col" class="col-2">등록일</th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${ list }" var="board">
                          <tr  onclick="selectBoard(${ board.s_no });" style="cursor: pointer">
                            <th scope="row">${ board.s_no }</th>
                            <td>${ board.scategory }</td>
                            <td>${ board.stitle }</td>
                            <td>${ board.writer_id }</td>
                            <td>${ board.sparticipant }</td>
                            <td>${ board.scount }</td>
                            <td>${ board.s_create_date }</td>
                          </tr>
                          </c:forEach>                          
                          </tbody>                     
                     </table> 
	        <c:if test="${ !empty loginUser }">
				<div class="btnArea" style="float:right;">
					<button class="btn" style="background-color: #C8C8C8;" onclick="location.href='${ contextPath }/boardSurvey/write'">글쓰기</button>			
				</div>
			</c:if>
<!--  페이징바 구간 -->
			 <table id="listTable">
			    <tr>
					<td colspan="12">
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/boardSurvey/list">
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
							<c:url var="pagination" value="/boardSurvey/list">
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
						<c:url var="after" value="/boardSurvey/list">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
					</td>				
			   </tr>	                        
            </table>                         
            <div class="searchArea">
				<form action="${ contextPath }/boardSurvey/search" method="get">
					<select id="searchCondition" name="searchCondition">
						<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>전체</option>
						<option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
						<option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>		
					</select>					
					<input type="search" name="searchValue" value=" ${ param.searchValue }">
					<button>검색</button>		
				</form>
			</div>	     

			<script>
				function selectBoard(s_no){
					location.href = '${contextPath}/boardSurvey/detail?s_no=' + s_no + '&page=${pi.currentPage}';					
				}		
			</script>    
          </div>           
        </div>               
      </div>
    </div>     
</body>
</html>