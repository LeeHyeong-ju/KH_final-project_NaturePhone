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
                        <h5>자유게시판</h5>                        
                    </div>
                    <div style="border-bottom: 1px #C8C8C8 solid; border-top: 1.5px #C8C8C8 solid; padding: 10px 0px 10px 0px; margin-bottom: 3px;">
                      [${ board.bcategory }]&nbsp;&nbsp;${ board.btitle }</div>
                    
                    <span class="topContent">작성자 : ${ board.writer_id }</span>
                    <c:if test="${ !empty loginUser }">
                    <i class="far fa-envelope" style="cursor: pointer" onclick="return setUser('${board.writer_id}',${board.userNo })"></i>&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <span class="topContent">등록일 : ${ board.bcreateDate }</span>&nbsp;&nbsp;&nbsp;
                    <span class="topContent"> 조회 : ${ board.bcount }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                   <c:if test="${ !empty loginUser && board.userNo != 1}">                  
                    <span class="topContent"><button class="btn" style="background-color: #C8C8C8;" onclick="return userReportBtn('board', '${board.writer_id}',${board.userNo }, ${board.bno })">신고</button></span>
                    </c:if>
                    <br><br>
                    <div>${ board.bcontent }</div>
                        <br><br>
                    <div style="text-align: center;">
                       <button id="brecom" type="button" onclick="location.href='${ contextPath }/boardFree/recommend?bno=${ board.bno }'" 
                       class="btn btn-outline-secondary" style="text-align: center;">공감 ${ board.brecom }</button>                                             
                        </div>
                    <hr>                                                             
                   
                    <c:if test="${ loginUser.id eq board.writer_id }">
                    <span class="topContent" ><button style="background-color: #C8C8C8;" class="btn" onclick="location.href='${ contextPath }/boardFree/updatePage?bno=${ board.bno }&page=${ param.page }'">수정하기</button></span>                
                    <span class="topContent"><button style="background-color: #C8C8C8;" class="btn" onclick="location.href='${ contextPath }/boardFree/delete?bno=${ board.bno }'">삭제하기</button></span>
                    </c:if>
                     <span class="topContent" style="float:right;"><button style="background-color: #C8C8C8;"class="btn" onclick="location.href='${ contextPath }/boardFree/list?page=${ param.page }'">목록으로</button></span>
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
                     <input type="hidden" class="re_no" value="${r.re_no }">
                     <c:if test="${ loginUser.id eq r.user_id }">   
                        <button style=" border: none; margin-bottom:2px;" type="button" class="btn-close" aria-label="Close" onclick="replyDelete(this);"></button>
                     </c:if>
                     </td>
                     <c:if test="${ !empty loginUser }">
                     <td>
                        <i class="far fa-envelope" style="cursor: pointer" onclick="return setUser('${r.user_id}',${r.user_no })"></i>
                        <button style=" border: none;" onclick="return userReportBtn('reply', '${r.user_id}',${r.user_no }, ${r.re_no })">신고</button>
                     </td>  
                     </c:if>                               
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
  
  <!-------형주 ----------------- 쪽지 보내기 Modal ------------------------>
   <div class="modal fade" id="sendMessage" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
      aria-labelledby="sendMessageLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="sendMessageLabel">쪽지 보내기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            
            <form action="${ contextPath }/message/insert" method="POST">
            <div class="modal-body">
                  <div class="mb-3">
                     <label for="recipient-name" class="col-form-label"><b>받는 사람 </b>:</label>
                           <input type="text" id="recipientName" style="border:none" readonly>
                           <input type="hidden" id="recipientNo" name="recipientNo">
                     <input type="hidden" name="senderNo" value="${ loginUser.userNo }">
                  </div>
                  <div class="mb-3">
                     <label for="recipient-name" class="col-form-label" ><b>제목</b></label>
                     <input type="text" class="form-control" name="messageTitle" required>
                  </div>
                  <div class="mb-3">
                     <label for="message-text" class="col-form-label"><b>내용 </b></label>
                     <textarea class="form-control messageContent" name="messageContent" style="resize: none; height:210px;"placeholder="200자 이내로 입력하세요" required></textarea>
                     <input readonly class="form-control-plaintext count" style="border: 0; outline:0; text-align:right;">
                  </div>
            </div>
            <div class="modal-footer">
               <input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소" onClick="window.location.reload()">
               <button type="submit" class="btn btn-primary">보내기</button>
            </div>
            </form>
            
         </div>
      </div>
   </div>
  
  <!-------형주 ----------------- 쪽지 보내기 Modal 끝------------------------>
  
  <!-------형주 ----------------- 신고하기 Modal ------------------------>
   <div class="modal fade" id="userReport" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="staticBackdropLabel">신고하기</h5>
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>
            
            <form action="${ contextPath }/report/insert" method="POST">
            <div class="modal-body">
               <table class="table align-middle table-borderless sendMessageTable">
                       <tr>
                           <th class="col-3">
                               <label>신고 대상자</label>
                           </th>
                           <td class="input-group">
                               <div id="suspenctName"></div> &nbsp;님
                               <input type="hidden" id="suspect" name="suspect">
                               <input type="hidden" id="boardNo" name="boardNo">
                               <input type="hidden" id="replyNo" name="replyNo">
                           </td>
                       </tr>
   
                       <tr>
                           <th class="col-3">
                               <label>신고자</label>
                           </th>
                           <td class="input-group">
                               <div>${ loginUser.id }</div> &nbsp;님
                               <input type="hidden" name="reporter" value="${ loginUser.userNo }">
                           </td>
                       </tr>
   
                       <tr>
                           <th class="col-3">
                               <label>신고 사유<br>(필수)</label>
                           </th>
                           <td class="input-group">
                               <select name="reportType" class="form-select form-select-sm" aria-label=".form-select-sm example" required>
                                   <option value="" selected disabled>신고 사유를 선택해주세요</option>
                                   <option value="욕설/비방">욕설/비방</option>
                                   <option value="음란물">음란물</option>
                                   <option value="스팸/광고">스팸/광고</option>
                                   <option value="사기">사기</option>
                                   <option value="관리자사칭">관리자사칭</option>
                                 </select>
                           </td>
                       </tr>
                       <tr>
                           <th class="col-3">
                               <label>상세 사유<br>(선택)</label>
                           </th>
                           <td class="input-group">
                               <textarea name="reportContent" class="form-control messageContent" style="resize: none; height:210px;"placeholder="200자 이내로 입력하세요"></textarea>
                              <input readonly class="form-control-plaintext count" style="border: 0; outline:0; text-align:right;">
                           </td>
                       </tr>
                   </table>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary"
                  data-bs-dismiss="modal" onClick="window.location.reload()">취소</button>
               <button type="submit" class="btn btn-primary">신고하기</button>
            </div>
            </form>
         </div>
      </div>
   </div>
   <!-------형주 ----------------- 신고하기 Modal 끝------------------------>
   <script>
      $("#addReply").on("click", function(){
         var re_content = $("#replyContent").val();
         var b_no = ${ board.bno };
         var loginUser_id ='${ loginUser.id}';
         $.ajax({
               url : "${ contextPath }/boardFree/insertReply",
               data : { re_content : re_content, b_no : b_no },
               type : "post",
               dataType : "json",
               success : function(data){
                  console.log(data);
                  
                  tableBody = $("#replyTable tbody");
                  tableBody.html("");
                  var html = '';
               
                  for(i in data){
                      html += '<tr>';
                      html += '<td style="font-size: 22px">'+data[i].user_id+'</td>';
                      html += '<td style="font-size: 15px">'+data[i].create_date+'&nbsp;&nbsp';
                      html += '<input type="hidden" class="re_no" value="'+data[i].re_no+'">';
                      if(loginUser_id == data[i].user_id){
                      html += '<button style=" border: none; margin-bottom:2px;" type="button" class="btn-close" aria-label="Close" onclick="replyDelete(this);"></button>';
                      }
                      html += '</td><td><button style=" border: none;">신고</button></td>';                     
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
    
      /* 형주 ------------- 실시간 글자수 카운팅 -------------*/
      $(".messageContent").on("propertychange change keyup paste input", function() {
         var content = $(this).val();
         $(".count").val("(" + content.length + "/ 200)"); 
         if (content.length > 200) {
            alert("최대 200자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 200));
            $('.count').html("(200 / 최대 200자)");
         }
      });
      /* 형주 ------------- 쪽지보내기 -------------*/
      function setUser(userid, userno){
            if('${ loginUser.id }' != userid) {
             document.getElementById("recipientName").value = userid;
             document.getElementById("recipientNo").value = userno;
             $("#sendMessage").modal("show");
            } else {
               alert("자신에게는 쪽지를 보낼 수 없습니다.");
               return false;
            }
            
       }
      
      /* 형주 ------------- 신고하기 -------------*/
      function userReportBtn(division, userid, userno, postNo){
         
         if('${ loginUser.id }' != userid) {
           document.getElementById("suspenctName").innerText = userid;
         document.getElementById("suspect").value = userno;
         
         if(division == 'board'){   // board에서 들어온 신고일때 게시판 번호
            document.getElementById("boardNo").value = postNo;
            document.getElementById("replyNo").value = 0;
            $("#userReport").modal("show");
            
         } else if(division == 'reply'){ // reply에서 들어온 신고일때 댓글 번호
            document.getElementById("replyNo").value = postNo;
            document.getElementById("boardNo").value = 0;
            $("#userReport").modal("show");
         }
         } else {
            alert("자기 자신은 신고할 수 없습니다.");
           return false;
         }
   }
      /* 댓글 삭제*/
      
        function replyDelete(obj){
          var re_no = $(obj).prev().val();
           var b_no = ${ board.bno };
           var title = $(obj).parent('td').parent('tr');
           var content = $(obj).parent('td').parent('tr').next();
          
           $.ajax({
               url : "${ contextPath }/boardFree/deleteReply",
               data : { re_no : re_no, b_no : b_no },
               type : "post",
               success : function(data){
                  title.remove();
                  content.remove();
               }   
         });                   
    }

 </script>     

</body>
</html>