<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
     .cal {
        color: grey;
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
                    </div>
                    <div style="border-bottom: 1px #C8C8C8 solid; border-top: 1.5px #C8C8C8 solid; padding: 10px 0px 10px 0px; margin-bottom: 3px;">
                    ${ notice.btitle }</div>
                    <span class="topContent">작성자 : ${ notice.userName }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent">등록일 : ${ notice.bcreateDate }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent"> 조회 : ${ notice.bcount }</span>     
                    <span class="topContent" style="float : right;"><button>신고</button></span>
                    <div style="padding-top : 30px; min-height : 200px;">${ notice.bcontent }</div>
                    <div style="text-align: center;"><button type="button" class="btn btn-outline-secondary" 
                                                      style="text-align: center;">공감 ${ notice.brecom }</button></div>
                    <hr>               
                    <span class="topContent">
                    	<button type="button" onclick="location.href='${contextPath}/notice/list?page=${ param.page }'">목록으로</button>
                    	<c:if test="${ !empty loginUser && loginUser.grade eq '관리자' }">
                    		<button type="button" style="float:right;" onclick="location.href='${contextPath}/notice/delete?bno=${ notice.bno }'">삭제</button>
                    		<button type="button" style="float:right;" onclick="location.href='${contextPath}/notice/updatePage?bno=${ notice.bno }&page=${ param.page }'">수정</button>
                    	</c:if>
                    </span>
                    <br><br>      
                    
                    <div style="clear: both; width: 85%; overflow: hidden; text-align: left; margin: auto;">
                         <div style="width: 100%; margin-top :25px; ">
                             <textarea style="width: 88%; float: left; "></textarea>
                             <span>
                             	<button type="button" style="height: 53px; float: right;" onclick="location.href='${contextPath}/notice/insertReply'">등록</button>
                             </span>
                         </div>           
                   	</div>             
                    
                    <c:if test="${ !empty rlist }">
                    	<c:forEach items="${ rlist }" var="reply">
	                    <div style="clear: both; margin-top:10px;padding: 10px 0px 10px 0px;border-bottom: 1px solid #C8C8C8;">                     
	                        <div style="float: left;width: 20%; overflow: hidden;text-align: left;">
	                        <br>
	                        <span class="topContent" style="font-size: 13px;">${ reply.username }</span>
	                        <br>
	                        <span class="topContent cal" style="font-size: 12px;">
	                        	<fmt:formatDate value="${ reply.createDate }" pattern="yy.MM.dd hh:mm"/>
	                        </span>
	                        </div>                      
	                        <div style="float: left;width: 80%; overflow: hidden;text-align: left;">
	                            <div style="width: 100%; margin-top :25px; ">
	                                <div style="width: 88%; float: left; font-size: 14px;">${ reply.recontent }</div>
	                            </div>           
	                        </div>                       
	                    </div>
                   	 	</c:forEach>
                    </c:if>
                    <c:if test="${ empty rlist }">
                    	<div style="clear: both; margin-top:10px;padding: 10px 0px 10px 0px;border-bottom: 1px solid #C8C8C8;">                     
	                        <div style="float: left;width: 100%; overflow: hidden;text-align: left;">
	                            <div style="width: 100%; margin-top :25px;">
	                                <p style="text-align: center;">작성 된 댓글이 없습니다.</p>
	                            </div>           
	                        </div>                      
	                    </div>
                    </c:if>
                </div>
            </div>   
        </div>
     </div>
</body>
</html>