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
    <title>물품 상세</title>
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

        .infoZone{
            border: 1px solid rgb(211, 211, 211);
            height: 300px;
        }
        
        

        .goodsImg{
            height: 297px;
            width: 200px;
        }

        .ImgDiv {
            display: inline-block;
            float: left;
        }

        .textInfo {
            display: inline-block;
            padding-left : 100px;
        }
        .sellerInfo {
            border: 1px solid rgb(211, 211, 211);
            height: 100px;
            padding : 10px 20px 20px 10px;
            
        }
        
        .buttonDiv {
            float: right;
        }

        .imgContent{
            margin-left: 20px;
            width: 95%;
            height: 400px;
        }

        .choosableImg {
            margin-left: 20px;
            width : 150px;
            height: 100px;
        }

        .textContent {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .headline{
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 500;
        }

        .replyText {
            resize: none;
        }
	
		.textInfo {
			margin: 30px;
			display: inline-block;
		}
		
		.info {
			margin-top : 10px;
		}

		.report {
			float : right;
			margin: 0px 10px 20px 0pxs;
		}
        
    </style>
    
</head>
<body>
	
	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>
		
		
		
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
                    <div class="goodsInfo">
                    <!-- 신고 신고 신고 신고 신고 신고 신고 신고 신고 버튼 버튼 버튼 버튼 버튼 버튼 버튼 버튼 -->
                       <button type="button" class="btn btn-warning report" onclick="">신고</button><br>
                        <h5 class="headline">제품정보</h5>
                        
                        <div class="infoZone">
                            <div class="ImgDiv">
                                <img src="${ contextPath }/resources/puploadFiles/${ p.fileRename }" class="goodsImg">
                            </div>
                            <div class="textInfo">
                                <div class="nameArea info">제품명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ p.proname }</div>
                                <div class="telecomArea info">통신사 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ p.carrname }</div>
                                
                                <div class="price info">판매가 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ g.price }</div>
                                <div class="delivery info">배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ g.deliveryFee }</div>
                                
                                <div class="way info">판매방식 &nbsp;&nbsp; ${ g.dealWay }</div>
                                <div class="condition info">제품상태 &nbsp;&nbsp; ${ g.condition }</div>
                                <div class="component info">구성품 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${ g.component }</div>
                            </div>
                        </div>
                        <div class="sellerInfo">
                            <h6 class="headline">판매자 정보</h6>
                            <div class="sellerDiv">${ m.id } &nbsp;/ ${ m.grade } / 가입일&nbsp;:&nbsp; ${ m.createDate }</div>
                        </div>
                    </div>
                    <br>
                    
                    <div class="buttonDiv">
                        <button type="button" class="btn btn-success" onclick="insertCart(${ g.goodsNo });">장바구니 담기</button>
                        &nbsp;
                        <button type="button" class="btn btn-success" onclick="orderPage(${ g.goodsNo });">구매하기</button>
                        
                    </div>

                    <br><br><br>

                    <div class="contentDiv">
                        <img src="${ contextPath }/resources/guploadFiles/${ aList[0].gaRename }" class="img-thumbnail imgContent" alt="...">
                        <br><br>
                        <div class="imgs">
                        	<c:forEach items="${ aList }" var="a">
                        		<img src="${ contextPath }/resources/guploadFiles/${ a.gaRename }" class="img-thumbnail choosableImg" alt="...">
                        	</c:forEach>  
                        </div>
                    </div>
                    <br><br>
                    <div class="textContent">
                       <pre class="contentInput">${ g.content }</pre>
                    </div>
                    <br><br><hr><br><br>
                    <div class="replyDiv">
                        <div class="input-group">
                            <span class="input-group-text replySpan">${ m.id }</span>
                            <textarea class="form-control replyText" aria-label="With textarea"></textarea>
                        </div>
                    </div>
                    <br><br><hr><br><br>
                    <div class="buttonDiv2">
                        <button type="button" class="btn btn-success">장바구니 담기</button>
                        &nbsp;
                        <button type="button" class="btn btn-success">구매하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>

    	function orderPage(goodsNo){
    		location.href = '${contextPath}/goods/order?goodsNo=' + goodsNo;   		
    	}
    	
    	function insertCart(goodsNo){
    		location.href = '${contextPath}/goods/insertCart?goodsNo=' + goodsNo;
    	}
    	
    	
    	
    	
    </script>
    
    
</body>
</html>