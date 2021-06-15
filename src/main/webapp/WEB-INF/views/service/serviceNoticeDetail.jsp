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
                    <span class="topContent">작성자 : ${ notice.writer_id }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent">등록일 : ${ notice.bcreateDate }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent"> 조회 : ${ notice.bcount }</span>     
                    <div style="padding-top : 30px; min-height : 200px;">${ notice.bcontent }</div>
                    <div style="text-align: center;"><button type="button" class="btn btn-outline-secondary" 
                                                      style="text-align: center;">공감 ${ notice.brecom }</button></div>
                    <hr>               
                    <span class="topContent">
                    	<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/notice/list?page=${ param.page }'">목록으로</button>
                    	<c:if test="${ !empty loginUser && loginUser.grade eq '관리자' }">
                    		<button type="button" class="btn btn-secondary" style="float:right;" onclick="location.href='${contextPath}/notice/delete?bno=${ notice.bno }'">삭제</button>
                    		<button type="button" class="btn btn-secondary" style="float:right; margin-right: 10px;" onclick="location.href='${contextPath}/notice/updatePage?bno=${ notice.bno }&page=${ param.page }'">수정</button>
                    	</c:if>
                    </span>
                    <br><br>      
                    
                    <div class="replySelectArea">
					<table id="replyTable">
						<tbody id="recontent">				
							<c:if test="${ !empty rlist }">
								<c:forEach items="${ rlist }" var="r">
								<tr>
									<td style="font-size: 17px">${ r.writer_id }</td>																			
									<td style="font-size: 12px">
									<fmt:formatDate value="${ r.createDate }" pattern="yy.MM.dd hh:mm"/>&nbsp;&nbsp;
									<input type="hidden" class="reno" value="${ r.reno }">
									<c:if test="${ loginUser.id eq r.writer_id }">	
										<button style=" border: none; margin-bottom:2px;" type="button" class="btn-close" aria-label="Close" onclick="replyDelete(this);"></button>
									</c:if>
									</td>
									<td><button style=" border: none;">신고</button></td>											
								</tr>
								<tr>						
									<td colspan="3" style="border-bottom:1px solid #C8C8C8;">${ r.recontent }</td>												
								</tr>					
								</c:forEach>				
							</c:if>
							<c:if test="${ empty rlist }">
								<tr>
									<td colspan="5">작성 된 댓글이 없습니다.</td>				
								</tr>				
							</c:if>				
						</tbody>				
					</table>
						<div class="replyWriterArea">				
							<textarea id="replyContent"></textarea>
							<br><br>
							<button type="button" class="btn btn-outline-secondary" class="btn" id="addReply">등록</button>			
						</div>			
					</div>
                </div>
            </div>   
        </div>
     </div>
     
     <script>
		$("#addReply").on("click", function(){
			var recontent = $("#replyContent").val();
			var bno = ${ notice.bno };
			var loginUser_id = '${ loginUser.id }';
			
			$.ajax({
					url : "${ contextPath }/notice/insertReply",
					data : { recontent : recontent, bno : bno },
					type : "post",
					dataType : "json",
					success : function(data){
						console.log(data);
						
						tableBody = $("#replyTable tbody");
						tableBody.html("");
						var html = '';
						
						for(i in data){
							html += '<tr>';
							html += '<td style="font-size: 17px">'+data[i].writer_id+'</td>';
							html += '<td style="font-size: 12px">'+data[i].createDate+'&nbsp;&nbsp;';
							html += '<input type="hidden" class="reno" value="'+data[i].reno+'">';
							if(loginUser_id == data[i].writer_id){
								html += '<button style=" border: none;  margin-bottom:2px;" type="button" class="btn-close" aria-label="Close" onclick="replyDelete(this);"></button>';
							}
							html += '</td><td><button style=" border: none;">신고</button></td>';
							html += '</tr>';
							html += '<tr>';							
							html += '<td colspan="3" style="border-bottom:1px solid #C8C8C8;">'+data[i].recontent+'</td>';										
							html += '</tr>';		
						}	
							$("#replyContent").empty();
							$("#recontent").append(html);
							$("#replyContent").val("");	
					}	
			});			
		});	
		
		/* $(".btn-close").on("click", function(){
			var reno = $(this).prev().val();
			var bno = ${ notice.bno };
			var title = $(this).parent('td').parent('tr');
			var content = $(this).parent('td').parent('tr').next();
			
			$.ajax({
					url : "${ contextPath }/notice/deleteReply",
					data : { reno : reno, bno : bno },
					type : "post",
					success : function(data){
						title.remove();
						content.remove();
					}	
			});			
		});	 */
		
		function replyDelete(obj){
			var reno = $(obj).prev().val();
			var bno = ${ notice.bno };
			var title = $(obj).parent('td').parent('tr');
			var content = $(obj).parent('td').parent('tr').next();
			
			$.ajax({
					url : "${ contextPath }/notice/deleteReply",
					data : { reno : reno, bno : bno },
					type : "post",
					success : function(data){
						title.remove();
						content.remove();
					}	
			});
		}
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>