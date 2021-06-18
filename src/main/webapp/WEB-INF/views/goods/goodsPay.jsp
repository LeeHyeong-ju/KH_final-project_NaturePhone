<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>

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

        .phoneTh {
            width : 150px;
        }

        .totalPrice{
            float: right;
        }

        .doPay {
            margin-left: 270px;
        }
        
        .request {
        	resize : none;
        	width : 500px;
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
                        <li><a href="${ contextPath }/goods/cartPage" class="list-group-item list-group-item-action sideContent">장바구니</a></li>
                    </ul>
                </div>         
        </div>

            <!-- 내용 -->
            <div class="col-md-8 content">
                <div class="main-div">
                    <div class="orderTitle">
                        <h5><b>물품 주문</b></h5>
                    </div>
                    <br><br>
                    <div class="orderGoods">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="5">
                                        	<b>구매물품</b>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>                            
                                <tr>
                                    <td>
                                      	${ p.modelname } 
                                    </td>
                                    <td>
                                       	${ p.proname }
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                    	<c:if test="${ !empty g.deliveryFee }">
                                    		 ${ g.deliveryFee }원(배송비)
                                    	</c:if>
                                    	<c:if test="${ empty g.deliveryFee }">
                                    		 배송비 없음
                                    	</c:if>
                                       
                                    </td>
                                    <td>
                                        ${ g.price }원
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <br><br>
                    
                    <form method="post" action="${ contextPath }/goods/dealInsert">
                    <div class="buyerInfo">
                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col" colspan="2">구매자 정보</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row" class="phoneTh">핸드폰 번호</th>
                                <td><input type="text" name="phone" value="${ loginUser.phone }"> &nbsp; - 없이</td>
                              </tr>
                              <tr>
                                <th scope="row">이메일 주소</th>
                                <td><input type="text" name="email" value="${ loginUser.email }"></td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                    <br><br>
                    
                    <div class="deliveryInfo">
                    	
                        <table class="table">
                            <thead>
                              <tr>
                                <th scope="col" colspan="2">배송지 정보</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row" class="phoneTh">수령자명</th>
                                <td>${ loginUser.name }<input type="hidden" name="buyerNo" value="${ loginUser.userNo }"></td>
                              </tr>
                              <tr>
                                <th scope="row">휴대폰 번호</th>
                                <td>${ loginUser.phone }<input type="hidden" value="${ loginUser.phone }"></td>
                              </tr>
                              <tr>
                                <th scope="row">배송지 정보</th>
                                <td>${ loginUser.address }<input type="hidden" name="address" value="${ loginUser.address }"></td>
                              </tr>
                              <tr>
                                <th scope="row">배송 요청사항</th>
                                <td><textarea class="request" name="request"></textarea></td>
                              </tr>
                            </tbody>
                          </table>
                          
                    </div>
                    <br><br>
                    <div class="accountDiv">
                        <table class="table">
                            <thead>
                            </thead>
                            <tbody>
                              <tr>
                                <th scope="row" class="phoneTh">환불계좌</th>
                                <td>은행명 : <input type="text" name="bbank"></td><td>계좌번호: <input type="text" name="baccount"></td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                    <div class="totalPrice">
                    	<span>결제 계좌 : KH은행 123-456789-012</span>
                        <span>결재금액 : </span>
                        <span class="totalPriceSpan">${ g.price + g.deliveryFee }
                        	<input type="hidden" name="totalPrice" value="${ g.price + g.deliveryFee }">
                        	<input type="hidden" name="goodsNo" value="${ g.goodsNo }">
                        </span>
                        <span class="totalPriceSpan">원</span>
                    </div>
                    <br>
                    <br>
                    
                    <div>
                        <button type="submit" class="btn btn-success doPay">구매 신청</button>
                    </div>
					</form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>