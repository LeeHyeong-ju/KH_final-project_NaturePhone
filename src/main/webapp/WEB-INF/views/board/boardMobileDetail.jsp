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
     .cal {
        color: grey;
    }
</style>
<body>
    <div class="container">
      <div class="row">
          <div class="col-md-2 rightSpace" style="margin-top: 100px;">
              <div class="list-group col-md-10 sideBar">
                  <ul>
                      <li class="list-group-item sideTitle">커뮤니티</li>
                      <li><a href="#" class="list-group-item list-group-item-action sideContent">모바일 뉴스</a></li>
                      <li><a href="#" class="list-group-item list-group-item-action sideContent">자유게시판</a></li>
                      <li><a href="#" class="list-group-item list-group-item-action sideContent">회원 설문</a></li>
                  </ul>
              </div>
          </div>
            <!-- 내용 -->
         
          <div class="col-md-8 content">
          <div class="main-div">
             <div class="panel">
             <h5>모바일뉴스</h5>                        
             </div>
             <div style="border-bottom: 1px #C8C8C8 solid; border-top: 1.5px #C8C8C8 solid; padding: 10px 0px 10px 0px; margin-bottom: 3px;">
                      	갤럭시Z폴드3, 수납 공간 생기는데...S펜은 별도 구매?</div>
                <span class="topContent">작성자 : 관리자</span>&nbsp;&nbsp;&nbsp;
                <span class="topContent">등록일 : 2012.04.23</span>&nbsp;&nbsp;&nbsp;
                <span class="topContent"> 조회 : 14</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br><br>
                <div>동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
                                       무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세 남산 위에 저 소나무 철갑을 두른듯 바람서리 불변함은 우리 기상일세
                                       무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세 가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세
                                       무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세 이 기상과 이 마음으로 충성을 다하여 괴로우나 즐거우나 나라사랑하세
                                       무궁화 삼천리 화려 강산 대한사람 대한으로 길이 보전하세</div>
                <br><br>
                <div style="text-align: center;">
                <button type="button" class="btn btn-outline-secondary" 
                                      style="text-align: center;">공감 3</button>
                </div>
                <hr>               
                <span class="topContent"><button>목록으로</button></span>
                <br><br>                   
            <!-- 댓글-->
                <div style="margin-top:10px;padding: 10px 0px 10px 0px;border-bottom: 1px solid #C8C8C8;">                     
                   <div style="float: left;width: 15%; overflow: hidden;text-align: left;">
                <br>
                     <span class="topContent">KH정보교육원</span>
                <br>
                     <span class="topContent cal">21.05.31 21:00</span>
                   </div>                      
                   <div style="float: left;width: 85%; overflow: hidden;text-align: left;">
                      <div style="width: 100%; margin-top :25px; ">
                          <div style="width: 88%; float: left; "> 안녕하세요!!!</div>
                      </div>           
                   </div>                       
                </div>                     
                    <div style="clear: both; margin-top:10px;padding: 10px 0px 10px 0px;border-bottom: 1px solid #C8C8C8;">
                        <div style="float: left;width: 15%; overflow: hidden;text-align: left;">
                        <br>
                        <span class="topContent">KH정보교육원</span>
                        <br>
                        <span class="topContent cal">21.05.31 21:00</span>
                        </div>                      
                        <div style="float: left;width: 85%; overflow: hidden;text-align: left;">
                            <div style="width: 100%; margin-top :25px; ">
                              <div style="width: 88%; float: left; "> 안녕하세요!!!</div>
                            </div>           
                        </div>          
                    </div>   

                    <div style="margin-top:60px;padding: 10px 0px 10px 0px;">                     
                        <div style="float: left;width: 15%; overflow: hidden;text-align: left;">
                        <br>
                        <span class="topContent">KH정보교육원</span>
                        <br>
                        <span class="topContent cal">21.05.31 21:00</span>
                        </div>                      
                        <div style="float: left;width: 85%; overflow: hidden;text-align: left;">
                            <div style="width: 100%; margin-top :25px; ">
                                <textarea style="width: 88%; float: left; "></textarea>
                                <span><button style="height: 53px; float: right;">등록</button></span>
                            </div>           
                        </div>                       
                    </div>
                   <br><br>

                    </div>
                </div>    
        </div>
     </div>
</body>
</html>