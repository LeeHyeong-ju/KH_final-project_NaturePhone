<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <title>장바구니</title>
    <jsp:include page="../common/menubar.jsp"/>
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

        .cartTtitle {
          
          font-weight: 500;
        }

        .totalPrice {
            float: right;
        }

        .priceP {
            font-size: 20px;
        }

        .selectedPay {
            float: right;
        }
        
        .cartTh{
        	text-align : center;
        }
    </style>
    
    
    
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-2 rightSpace">
            <div class="list-group col-md-10 sideBar">
                    <ul>
                        <li class="list-group-item sideTitle">Market</li>
                        <li><a href="${ contextPath }/goods/list" class="list-group-item list-group-item-action sideContent">물품 검색</a></li>
                        <li><a href="${ contextPath }/goods/ginsertpage" class="list-group-item list-group-item-action sideContent">물품 등록</a></li>
                        <li><a href="${ contextPath }/goods/cartPage" class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">장바구니</a></li>
                    </ul>
                </div>         
        </div>

            <!-- 내용 -->
            <div class="col-md-8 content">
                <div class="main-div">
                   <div class="cartTtitle">
                        <h5>장바구니</h5>
                   </div>
                   <br>  
                    <hr>
                    <br>                      
                    <br>
                    <table class="table cartTable">
                        <thead>
						    <tr class="cartTh">
						      <th scope="col">선택</th>
						      <th scope="col">제품명</th>
						      <th scope="col">제목</th>
						      <th scope="col">가격</th>
						      <th scope="col">판매자</th>
						      <th scope="col">등록날짜</th>
						    </tr>
						 </thead>
                        	  <c:forEach items="${ cList }" var="c" varStatus="status">
	                        	  	<tr class="cartTh">
			                            <td scope="row"><input class="cartCk" type="checkbox"></td>
			                            <td>${ p[status.index].modelname }</td>
			                            <td>${ g[status.index].goodsTitle }</td>
			                            <td class="priceTd">${ g[status.index].price + g[status.index].deliveryFee }</td>
			                            <td>id</td>
			                            <td>${ g[status.index].createDate }</td>
		                          </tr>
                        	  </c:forEach>                     
                      </table>
                        <br>
                      <div class="totalPrice">
                          <p class="priceP">선택한 물품 총액 : <span id="numPrice" class="numPrice"></span>원 </p> 
                      </div>
                      <br><br>
                      <div class="btnDiv">
                        <button type="button" class="btn btn-secondary" onclick="allSeleted();">전체선택</button>
                        &nbsp;
                        <button type="button" class="btn btn-secondary" onclick="allDeseleted();">전체취소</button>
                        &nbsp;
                        <button type="button" class="btn btn-secondary" onclick="selectedUnck();">선택 삭제</button>
                            <span class="selectedPay"><button type="button" class="btn btn-success" >선택 물품 결제</button></span>
                      </div>


                </div>
            </div>
        </div>
    </div>

    <script>

        function allSeleted() {
            $(".cartTable").find("input").prop("checked", true);
        }

        function allDeseleted() {
            
            $(".cartTable").find("input").prop("checked", false);
        }

         function selectedUnck() {
                $('input[type="checkbox"]:checked').each(function(index) {
                                       
                    $(this).parents("tr").remove();
					
                    
                 });
           
            
         }

    </script>

    <script>
        $(function(){
            var total = 0;
            var sum1;
           
           
        
            $('input[type="checkbox"]').change(function(){
                var total = 0;
                var sum1 = 0;

                if($('input[type="checkbox"]').is("checked") == false) {
                    $("#numPrice").text(0);
                }

                $('input[type="checkbox"]:checked').each(function(index) {                                               
                    sum1 = parseInt($(this).parents("td").siblings(".priceTd").text());

                    total = total + sum1;

                    $("#numPrice").text(total);

                });

            });

            });
    </script>
</body>
</html>