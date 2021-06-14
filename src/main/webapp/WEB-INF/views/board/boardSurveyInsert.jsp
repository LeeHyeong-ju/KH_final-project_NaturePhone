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
      .newsClass {
     border: solid 1px black;
     position: relative;
  }
</style>
<body>
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
        <form action="${ contextPath }/boardSurvey/insert" id="writeForm" method="post">
       
          <h5>회원 설문</h5>
                 
            <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col" style="text-align: center; width: 20%; background-color:#F4F4F4;">설문 방식</th>
                <td scope="col">
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="option1" id="option1" value="option1" checked>
                    <label class="form-check-label" for="option1">설문</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="option2" id="option2" value="option2">
                    <label class="form-check-label" for="option2">대결</label>
                  </div>              
                </td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row" style="text-align: center; background-color:#F4F4F4; border: 1px solid  #C8C8C8;" >제목</th>
                <td><input type="text" name="stitle" style="width: 70%;"></td>
              </tr>              
            </tbody>
          </table>
         <textarea name="scontent" style="width: 100%; height: 200px; border: 1px solid  #C8C8C8;"></textarea>
          <br><br>
                  
         
          <table class="table table-bordered">
            <thead>
              <tr>
                <th scope="col" rowspan="3" style=" padding-bottom: 50px; text-align: center; width: 20%; background-color:#F4F4F4;">설문 항목</th>
                <td scope="col">
                  <input type="text" name="surveytext1" style="width: 70%; margin-bottom: 10px;">
                  <input type="text" name="surveytext2" style="width: 70%; margin-bottom: 10px;">
                  <input type="text" name="surveytext3" style="width: 70%;">
                </td>
              </tr>
            </thead>
          </table> 
     
            <hr>            
            <button type="submit" class="btn btn-secondary" style="float: right;">등록</button>      
            </form>
           <button style="background-color: #C8C8C8;"class="btn btn-secondary" onclick="location.href='${ contextPath }/boardSurvey/list'">목록으로</button>
             
        </div>
      </div>
      
      
      
      
      
      
      
        </div>
     </div> 
</body>
</html>