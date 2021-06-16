<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 자바스크립트-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- Font Awesome5 -->
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <title>title</title>
</head>
<style>
  .main-div {
    background: #ffffff none repeat scroll 0 0;
    border-radius: 2px;
    margin: 10px auto 30px;
    width: 1300px;
    padding: 15px 0px 180px 0px;
  }
  /* 내용 */
  .content {
    border: 1px; 
  }
  .col-6 {
    font-size: 11px;
  }
  .carousel-item active {
     width: 80%;
     height: 50px;
     }
</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
  <div class="container">
    <div class="row">
     
      <!-- 내용 -->
      <div class="col-md-12 content">
        <div class="main-div">  
        
        <div  id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div style="width: 100%; height: 260px;" class="carousel-item active" data-bs-interval="4000">
            <img src="${contextPath}/resources/images/s1.jpg" class="d-block w-100" alt="...">
          </div>
          <div style="width: 100%; height: 260px;"class="carousel-item" data-bs-interval="4000">
            <img src="${contextPath}/resources/images/iphone.png" class="d-block w-100" alt="...">
          </div>
          <div style="width: 100%; height: 260px;"class="carousel-item" data-bs-interval="4000">
            <img src="${contextPath}/resources/images/apple.jpg" class="d-block w-100" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
          <br><br>
            <div class="row row-cols-auto" >
              
              <div class="col-6">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col" colspan="2">공지사항</th>                    
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td scope="row">모바일 중고장터 등록 오류 안내</td>
                      <td>21-04-28</td>
                    </tr>
                    <tr>
                      <td scope="row">모바일 중고장터 등록 오류 안내</td>
                      <td>21-04-28</td>
                    </tr>
                    <tr>
                      <td scope="row">모바일 중고장터 등록 오류 안내</td>
                      <td>21-04-28</td>
                    </tr>
                    <tr>
                      <td scope="row">모바일 중고장터 등록 오류 안내</td>
                      <td>21-04-28</td>
                    </tr>
                    <tr>
                      <td scope="row">모바일 중고장터 등록 오류 안내</td>
                      <td>21-04-28</td>
                    </tr>
                  </tbody>
                </table>
              </div>

              <div class="col-6">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col" colspan="4">중고장터 실시간 거래 현황</th>                           
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>60,000</td>
                      <td>7분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>60,000</td>
                      <td>7분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>60,000</td>
                      <td>7분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>60,000</td>
                      <td>7분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>60,000</td>
                      <td>7분 전</td>
                    </tr>
                  </tbody>
                </table>
              </div>
      </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>