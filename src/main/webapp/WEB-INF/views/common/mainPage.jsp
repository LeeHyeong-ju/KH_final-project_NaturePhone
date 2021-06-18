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
     .bno {
         display : none;
      }
</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
  <div class="container" >
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
              
              <div class="col-5">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col" colspan="2">공지사항</th>                    
                    </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${ list }" var="notice">
                          <tr  onclick="selectBoard(${ notice.bno });" style="cursor: pointer">
                            <th scope="row" class="bno">${ notice.bno }</th>
                            <td>${ notice.btitle }</td>                   
                            <td>${ notice.bcreateDate }</td>
                          </tr>
                          </c:forEach>    
                  </tbody>
                </table>
              </div>
         <div class="col-2" ></div>
              <div class="col-5" >
                <table class="table" >
                  <thead>
                    <tr>
                      <th scope="col" colspan="4">중고장터 실시간 거래 현황</th>                           
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td scope="row">갤럭시 A6 2018</td>
                      <td>SM-A600S</td>
                      <td>160,000</td>
                      <td>1분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">아이폰12</td>
                      <td>A2403</td>
                      <td>320,000</td>
                      <td>9분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 노트10</td>
                      <td>SM-N970</td>
                      <td>370,000</td>
                      <td>17분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">갤럭시 S10</td>
                      <td>SM-G973N</td>
                      <td>600,000</td>
                      <td>37분 전</td>
                    </tr>
                    <tr>
                      <td scope="row">아이폰8</td>
                      <td>A1905</td>
                      <td>60,000</td>
                      <td>45분 전</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
        </div>
      </div>
    </div>
    <c:if test="${ empty list }">
       <script>
      window.onload=function(){
          location.href="${contextPath}/notice/mainList";
      }
      </script>
    </c:if>
    <script>
         function selectBoard(bno){
            location.href = '${contextPath}/notice/detail?bno=' + bno + '&page=${pi.currentPage}';               
            }      
   </script>  
    
  </div>
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>