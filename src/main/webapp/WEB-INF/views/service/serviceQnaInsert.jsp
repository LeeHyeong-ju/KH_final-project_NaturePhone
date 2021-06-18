<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Q&A</title>
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
      .newsClass {
     border: solid 1px black;
     position: relative;
  }
  
   [type=file] {
      display : block;
   }
   
   #contentImgArea {
      display :inline-block;
      margin:15px;
   }
  .main-div h5 {
		font-weight:bold;
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
                      <li><a href="${ contextPath }/notice/list" class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">공지사항</a></li>
                      <li><a href="${ contextPath }/qna/list" class="list-group-item list-group-item-action sideContent">Q&A</a></li>
                  </ul>
              </div>
          </div>
            <!-- 내용 -->
                <div class="col-md-8 content">
        <div class="main-div">
       <form action="${ contextPath }/notice/insert" id="writeForm" method="post" enctype="multipart/form-data">
          <h5>공지사항</h5>
                 
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col" style="text-align: center; width: 20%; background-color:#F4F4F4;">제목</th>
                <td><input type="text" name="btitle" style="width: 70%; border: 1px solid  #C8C8C8;"></td>                            
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row" style="text-align: center; background-color:#F4F4F4;" >작성자</th>
                <td><div style="overflow: hidden;background-color: #ffffff;">
                  <input type="hidden" name="userNo" value="${ loginUser.userNo }">
                  <input type="text" name="writer_id" style="border: none;" value="${ loginUser.name }" onfocus="this.blur();" readonly>
                 </div>
                </td>
              </tr>              
            </tbody>
          </table>
          <textarea name="bcontent" style="width: 100%; height: 200px; border: 1px solid  #C8C8C8;"></textarea>
          <br><br>                  
          <h5 class="board_title">파일 첨부</h5>
			<input type="file" name="uploadFile">		
			<div id="contentImgArea">
				<img id="content1"> 
			</div>
			        
            <hr>
            <button type="button" class="btn btn-secondary btn-sm" style="float: right;" onclick="history.back()">목록으로</button>
            <button type="submit" class="btn btn-success btn-sm">등록</button>            
            <br><br>
          </form>  
        </div>
      </div>     
        </div>
     </div>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>