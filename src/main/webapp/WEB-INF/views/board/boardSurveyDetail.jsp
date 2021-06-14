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
     .cal {
        color: grey;
    }
    
      #replyTable {
	      min-width: 550px;
	      line-height: 2;
	      border-collapse: collapse;
	      width: 100%;
	      border-spacing: 5px;
  		  border-collapse: separate;
	   }
    
       #replyTable td:nth-child(1){
	      width : 20px;
	   } 
	  
	   #replyTable td:nth-child(3){
	      float: right;	      
	   } 
	   	   
	    .replyWriterArea {
	      text-align:center;
	      padding-top : 50px;
	      width: 100%
	   } 
	     
        .replyWriterArea textarea {
          width : 600px;
          height : 100px;
          padding : 10px 10px 14px 10px;
          border: solid 1px #dadada;
          resize:none;
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
                        <h5>회원설문</h5>                        
                    </div>
                    <div style="border-bottom: 1px #C8C8C8 solid; border-top: 1.5px #C8C8C8 solid; padding: 10px 0px 10px 0px; margin-bottom: 3px;">
                      [${ board.scategory }]&nbsp;&nbsp;${ board.stitle }</div>
                    <span class="topContent">작성자 : ${ board.writer_id }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent">등록일 : ${ board.s_create_date }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent"> 조회 : ${ board.scount }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                    
                    <span class="topContent"><button class="btn" style="background-color: #C8C8C8; ">신고</button></span>
                   
                    <br><br>
                    <div>${ board.scontent }</div>
                        <br><br>                  
                    <hr>                                                             
                   <br><br>
                   
                     <div class="container" style="border-top: 1px solid #C8C8C8; padding-top: 20px; padding-bottom: 20px;">
                    <div class="row">
                        <div class="col-2">
                       1. 삼성
                        </div>
                        <div class="col-6">
                            <div class="progress" style="width: 100%; float: left;">
                                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div style="float: left;">25%</div>
                            <div style="float: left;">(2명)</div>
                            <button style="float: left;font-size: 10px;">투표하기</button>
                        </div>                  
                    </div>
                </div>

                <div class="container" style="border-top: 1px solid #C8C8C8; padding-top: 20px; padding-bottom: 20px;">
                    <div class="row">
                        <div class="col-2">
                       2. 갤럭시
                        </div>
                        <div class="col-6">
                            <div class="progress" style="width: 100%; float: left;">
                                <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div style="float: left;">25%</div>
                            <div style="float: left;">(2명)</div>
                            <button style="float: left;font-size: 10px;">투표하기</button>
                        </div>                  
                    </div>
                </div>

                <div class="container" style="border-top: 1px solid #C8C8C8; padding-top: 20px; padding-bottom: 20px;">
                    <div class="row">
                        <div class="col-2">
                       3. 기타
                        </div>
                        <div class="col-6">
                            <div class="progress" style="width: 100%; float: left;">
                                <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div style="float: left;">50%</div>
                            <div style="float: left;">(4명)</div>
                            <button style="float: left;font-size: 10px;">투표하기</button>
                        </div>                  
                    </div>
                </div> 
                
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   <hr>

                    <c:if test="${ loginUser.id eq board.writer_id }">
                    <span class="topContent" ><button style="background-color: #C8C8C8;" class="btn" onclick="location.href='${ contextPath }/boardSurvey/updatePage?s_no=${ board.s_no }&page=${ param.page }'">수정하기</button></span>                
                    <span class="topContent"><button style="background-color: #C8C8C8;" class="btn" onclick="location.href='${ contextPath }/boardSurvey/delete?s_no=${ board.s_no }'">삭제하기</button></span>
                    </c:if>
                     <span class="topContent" style="float:right;"><button style="background-color: #C8C8C8;"class="btn" onclick="location.href='${ contextPath }/boardSurvey/list?page=${ param.page }'">목록으로</button></span>
                    <br>                  
<!-- 댓글-->	
		<div class="content">
			<div class="outer">
			
			<br><hr>
			<div class="replySelectArea">
			<table id="replyTable">
				<thead>				
				</thead>
				<tbody id="recontent">				
					<c:if test="${ !empty rlist }">
						<c:forEach items="${ rlist }" var="r">
						<tr>
							<td style="font-size: 22px">${ r.user_id }</td>																			
							<td style="font-size: 15px">${ r.create_date }&nbsp;&nbsp;
							<c:if test="${ loginUser.id eq r.user_id }">	
								<button style=" border: none; margin-bottom:2px;" type="button" class="btn-close" aria-label="Close"></button>
							</c:if>
							</td>
							<td><button style=" border: none;">신고</button></td>											
						</tr>
						<tr>						
							<td colspan="3" style="border-bottom:1px solid #C8C8C8;">${ r.re_content }</td>												
						</tr>					
						</c:forEach>				
					</c:if>
					<c:if test="${ empty rlist }">
						<tr>
							<td colspan="5">작성된 댓글이 없습니다.</td>				
						</tr>				
					</c:if>				
				</tbody>				
			</table>
					<div class="replyWriterArea">				
					<textarea id="replyContent"></textarea>
					<br><br>
					<button type="button" class="btn btn-outline-secondary" class="btn" id="addReply">댓글 등록</button>			
					</div>			
					</div>		
				</div>
			</div> 
       	<br><br>
     	</div>
  	</div>     
   </div>
  </div>     
     <script>
		$("#addReply").on("click", function(){
			var re_content = $("#replyContent").val();
			var s_no = ${ board.s_no };
			
			$.ajax({
					url : "${ contextPath }/boardSurvey/insertReply",
					data : { re_content : re_content, s_no : s_no },
					type : "post",
					dataType : "json",
					success : function(data){
						console.log(data);
						
						tableBody = $("#replyTable tbody");
						tableBody.html("");
						var html = '';
						/* if(loginUser.id == data[i].user_id){  */
						for(i in data){
							html += '<tr>';
							html += '<td style="font-size: 22px">'+data[i].user_id+'</td>';
							html += '<td style="font-size: 15px">'+data[i].create_date+'&nbsp;&nbsp;<button style=" border: none;  margin-bottom:2px;" type="button" class="btn-close" aria-label="Close"></button></td>';
							html += '<td><button style=" border: none;">신고</button></td>';
							html += '</tr>';
							html += '<tr>';							
							html += '<td colspan="3" style="border-bottom:1px solid #C8C8C8;">'+data[i].re_content+'</td>';										
							html += '</tr>';		
						}	
							$("#replyContent").empty();
							$("#recontent").append(html);
							$("#replyContent").val("");	
		
					}	
					
			});			
		});	
	</script>

</body>
</html>