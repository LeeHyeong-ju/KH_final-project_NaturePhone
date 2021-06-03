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
    
       .table{
        text-align: center;
        font-size:13px;
    }
    td:nth-child(3) {
        text-align: left;
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
                        <h5>회원 설문</h5>
                        <hr>
                    </div>
                    <table class="table table-hover">
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="col-1">번호</th>
                            <th scope="col" class="col-1">분류</th>
                            <th scope="col" class="col-6">제목</th>
                            <th scope="col" class="col-1">작성자</th>
                            <th scope="col" class="col-1">참여자</th>
                            <th scope="col" class="col-1">조회</th>
                            <th scope="col" class="col-1">등록일</th>
                          </tr>
                        </thead>

                        <tbody>
                          <tr>
                            <th scope="row">10</th>
                            <td>대결</td>
                            <td>갤럭시Z폴드2, 수납공간 생기는데...S펜은 별도 구매?</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">9</th>
                            <td>설문</td>
                            <td>보라색 아이폰 12 살까, 아이폰13 기다릴까</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">8</th>
                            <td>설문</td>
                            <td>애플, 개발자용 'ios.아이패드OS 14.6' 베타버전 공개</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">7</th>
                            <td>설문</td>
                            <td>애플이 4월 스페셜 이벤트에서 발표하지 않은 신제품은?</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">6</th>
                            <td>설문</td>
                            <td>[하나뿐인 지구 1]폐휴대폰의 재탄생... 삼성전자의 자원순환 노력</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">5</th>
                            <td>대결</td>
                            <td>노트북도 '갤럭시'미는 삼성... 애플처럼 '연동'생태계 키운다</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">4</th>
                            <td>대결</td>
                            <td>애플 VS 페북 갈등 격화... "아이메시지 강화로 왓츠앱과 경쟁"</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">3</th>
                            <td>대결</td>
                            <td>[영상]360도 접히고 S펜도 탑재...'갤럭시 북' 힘주는 삼성</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">2</th>
                            <td>대결</td>
                            <td>"5G폰 대신 LTE폰 샀어요"... LTE로 탈출하는 '리턴족'</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                          <tr>
                            <th scope="row">1</th>
                            <td>대결</td>
                            <td>삼성.'갤21'로 세계 1위 탈환했지만... '중국 빅3' 거센 추격</td>
                            <td>임경민</td>
                            <td>3</td>
                            <td>30</td>
                            <td>21.04.30</td>
                          </tr>
                        </tbody>
                      </table>

                </div>
            </div>
                    
                    
                    
                    
                    
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>