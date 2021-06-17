<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 등록</title>
	<jsp:include page="../common/menubar.jsp"/>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Sunflower:wght@300&display=swap" rel="stylesheet">

	<!-- 카카오 map API -->	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ccb7bcb96a393aea481ee6d70af017ce"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	ccb7bcb96a393aea481ee6d70af017ce&libraries=services"></script>
    <style>
        body {
          font-family: 'Noto Sans KR', sans-serif;
        }

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

        #inputArea {
            padding-top: 50px;
        }

        .imgBtn {
            margin: 10px;
            height: 150px;
            width: 150px;
            ;
        }

        .imgP{
          display: inline;
        }
        
        .imgP1 {
          color:blue;
        }

        .titleP {
          float: right;
          font-size: 17px;
          margin: 0px;
          padding-left: 10px;
          line-height: 50px;
        }

        .goodsName {
          margin-right: 30px;
          width: 400px;
        }

        #goodsName {
          display: inline-block;
        }

        .dealChoose {
          margin-left: 30px;
        }

        .price{
          text-align: right;
          width: 430px;
        }

        #won {
          font-size: 20px;
          padding-top: 10px;
        }

        #regPageTitle {
          padding-bottom: 10px;
        }

        #regPageTitle h2{
          font-family: 'Sunflower', sans-serif;
          font-weight: 700;
        }

        .colorLabel {
          background-color: #56CE7C;
          font-family: 'Noto Sans KR', sans-serif;
          color: white;
         
        }

        .imgDiv {
          border: #56CE7C 2px solid;
        }

        .noBorder {
          border: 0px;
        }

        .borCol {
          border: #56CE7C 2px solid;
        }

        .total {
          font-size: 20px;
        }
        
        .tip {
          padding-bottom: 7px;
        }
    
       .form-select {
        width: 180px;
       }

       .openDate {
         display: inline-block;
       }

       .dateBox {
        width: 670px;
        border: 2px solid #56CE7C;
        padding-top: 12px;
        padding-left: 12px;
        padding-bottom: 28px;
        background-color: #56CE7C;;
       }

       .dateLabel {
         color: white;
         font-weight: 400;
         font-size: 18px;
       }

       #dateCheck{
         color: white;
         float: right;
         padding-right: 35px;
       }

       .status {
         border: #56CE7C 2px solid;
       }

       .statusTitle{
         font-size: 20px;
       }

       #exampleFormControlTextarea1 {
         margin-top: -15px;
         height: 200px;
         border: 2px solid #56CE7C;
         resize: none;
       }

       #notice {
         padding-top: 10px;
         padding-left: 20px;
         padding-right: 10px;
         padding-bottom: 20px;
         font-size: 5px;
         background-color:rgb(220, 241, 214);
       }

       .size {
         font-size: 13px;
       }

       .color {
         color: blue;
       }

       #btn {
        padding-left: 270px;
       }

       input[type="number"]::-webkit-outer-spin-button,
       input[type="number"]::-webkit-inner-spin-button {
          -webkit-appearance: none;
          margin: 0;
        }

        #stop {
          line-height: 60px;
          color: blue;
        }
        
        #telecomArea {
        	display: inline-block;
        }
        
        #telecomArea label {
        	margin-right: 10px;
        	margin-bottom: 8px;
        }
        
        #dealWayp {
        	font-size: 23px;
        	margin-bottom: 20px;
        }
        
        .dealWayLabel{
        	width: 100px;
        	height: 50px;
        	line-height: 35px;
        	margin-right: 20px;
        }
        
        .accountDiv {
        	
        	width: 300px;
        }
        
        #accountArea {
        	display: inline-block;
        }
        
        .accnumDiv {
        	width: 300px;
        	

        }
        
        #accnumArea {
        	display: inline-block;
        }
        
        .accountLabel {
        	background : #56CE7C;
        	color : white;
        	border: 2px solid #56CE7C;
        }
        
        .accountSel {
        	border: 2px solid #56CE7C;
        }
        
        .accnumInput {
        	border: 2px solid #56CE7C;
        }
        
        .autoComplete {
          border : 1px black solid;
          cursor: pointer;
         
        }
        
        .autop {
        	display: inline-block;
        	position: relative;
        }
        
        .name1 {
        	top: -30px;
        	left: 20px;       	
        }
        
        .name2 {
        	left: -10px;      	
        }
        
        .name3 {
        	left: -55px;
        	top: 30px;
        	      	
        }
        #autoArea {
        	margin-left: 95px;
        	z-index: 100;
        	position: absolute;
        	background: white;
        }
        
        .autoImg {
        	width: 70px; 
        	height:100px;
        }
        
            .map_wrap {position:relative;width:100%;height:350px;}
		    .title {font-weight:bold;display:block;}
		    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
		    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
		    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		    #clickLatlng{display:none;}
        
        #dealp{
         font-size: 22px;
         background: #56CE7C;
         color : white;
         padding: 10px;
         border-radius : 8px;
         font-family: 'Noto Sans KR', sans-serif;
         padding-top: 5px;
        }
        
        #map{
        	border:2px solid #56CE7C;
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
                        <li><a href="${ contextPath }/goods/ginsertpage" class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">물품 등록</a></li>
                        <li><a href="${ contextPath }/goods/cartPage" class="list-group-item list-group-item-action sideContent">장바구니</a></li>
                    </ul>
                </div>         
        </div>

          <!-- 내용 -->
          <div class="col-md-8 content">
            <div class="main-div">
                <!-- 타이틀 -->
                <div id="regPageTitle"><h5>&nbsp;물품 등록</h5></div>
                <hr>
                <!-- 입력 부분 -->
                <div id="inputArea">
                <form action="${ contextPath }/goods/insert" id="insertForm" method="post" enctype="multipart/form-data">
                    <div class="img">
                        <div class="regImg">
                          <div class="input-group mb-3 imgDiv">
                            <label class="input-group-text colorLabel noBorder" for="inputGroupFile01">물품 이미지</label>
                            <input type="file" class="form-control noBorder" id="inputGroupFile01" name="att" accept="image/jpeg, .png" multiple required>
                          </div>
	                          <div id="imgDiv">
	                          </div>
                            <br>
                            <p class="imgP imgP1">하자부분(스크래치,잔상,파손부위 등)</p><p class="imgP imgP2">은 필히 실제판매제품의 사진과 함께 내용에 명시해야 하며, 제품상태 미고지(글/사진) 또는 내용과 제품상태 불일치 시 판매자 과실로 인정되오니 주의 바랍니다.</p>
                            <br>
                            <p class="imgP imgP2">이미지는 물품등록 시 <p class="imgP imgP1">정사각형</p>으로 짤려서 등록됩니다. <br> 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.
                            최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.<p class= "imgP imgP1">(개당 이미지 최대 10M)</p>
                        <br>
                     </div>
                 </div>

                 <hr><br>
					
                <div id="infoInput">   
                <input type="hidden" name="userNo" value="${ loginUser.userNo }">           
                  <div class="input-group input-group-lg">
                    <span class="input-group-text colorLabel borCol" id="inputGroup-sizing-lg">제 목</span>
                    <input id="goodsTitle" type="text" class="form-control borCol" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" maxlength="39" name="goodsTitle" required>&nbsp;                               
                  </div>
                  <span class="titleP">/ 40</span><span class="titleP titleSpan">0</span> 
                  <span id="stop"></span>
                  <br><hr><br>
                  <div id="goodsName">
	                  <div class="input-group input-group-lg goodsName">
	                    <span class="input-group-text colorLabel borCol" id="inputGroup-sizing-lg">제품명</span>
	                    <input type="text" class="form-control borCol" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="gphone" id="productName" autocomplete="off" required> 
	                  </div>
	                  
                  </div>
                  <div id="telecomArea">
					<input type="radio" class="btn-check" name="carrNo" id="SKT" autocomplete="off" value="1">
					<label class="btn btn-outline-success" for="SKT">SKT</label>
					
					<input type="radio" class="btn-check" name="carrNo" id="KT" autocomplete="off" value="2">
					<label class="btn btn-outline-success" for="KT">KT</label>
					
					<input type="radio" class="btn-check" name="carrNo" id="LGU" autocomplete="off" value="3">
					<label class="btn btn-outline-success" for="LGU">LGU+</label>
				  </div>
				  <div id="autoArea">
				
		          
	               </div>   
				  
				  <br><br><hr>
				  
				  
				  <div id="dealWayArea">
				  
				  <p id="dealWayp">거래 방식</p>
				  
				  <input type="radio" class="btn-check dealWayInput" name="dealWay" id="way1" autocomplete="off" value="안전거래" checked>
				  <label class="btn btn-outline-success dealWayLabel" for="way1">안전거래</label>
						
				  <input type="radio" class="btn-check dealWayInput" name="dealWay" id="way2" autocomplete="off" value="직거래">
				  <label class="btn btn-outline-success dealWayLabel" for="way2">직거래</label>
				  </div>
				  
                  <br><hr><br>
   
                  <div class="input-group mb-3 price">
                    <span class="input-group-text colorLabel borCol">물품 가격</span>
                    <input id="goodsPrice" type="number" class="form-control price borCol" aria-label="Dollar amount (with dot and two decimal places)" name="price" required>
                    &nbsp; &nbsp;<span id="won">원</span> 
                  </div>     
                  
                  <div class="input-group mb-3 price deliveryArea">
                    <span class="input-group-text colorLabel borCol">배송비</span>
                    <input id="deliveryFee" type="number" class="form-control price borCol" aria-label="Dollar amount (with dot and two decimal places)" name="deliveryFee">
                    &nbsp; &nbsp;<span id="won">원</span>
                  </div>
                  <br>
                  <span class="total fee1">거래 가격 : <span id="totalPrice"></span>&nbsp; &nbsp;</span><img src="${ contextPath }/resources/images/tip.png" class="tip fee1" title="물품가 + 배송비">
                  <br>
                  <span class="total fee2">안전거래 수수료 : <span id="safeFee"></span>&nbsp; &nbsp;</span><img src="${ contextPath }/resources/images/tip.png" class="tip fee2" title="물품가의 5%">
                  <br><hr><br>
                  
                <div class="mapArea">
                <span id="dealp">거래 희망 위치</span>
				<div id="map" style="width:100%;height:350px;"></div>
				<p><em>지도를 클릭해주세요!</em></p> 
				<div id="clickLatlng"></div>
				<input type="hidden" name="dealAdd" id="dealAdd">
                </div>
                 
                  
                  <br class="mapLine"><hr class="mapLine"><br class="mapLine">
                  
                  <div id="accountArea" class="accountZone az1">                 	
                  	<div class="input-group mb-3 accountDiv">
	                  	  <label class="input-group-text accountLabel" for="inputGroupSelect01">입금 계좌</label>
						  <select class="form-select accountSel" id="inputGroupSelect01" name="sbank">
						    <option selected>은행</option>
						    <option value="신한">신한</option>
						    <option value="국민">국민</option>
						    <option value="우리">우리</option>
						    <option value="농협">농협</option>
						    <option value="카카오뱅크">카카오뱅크</option>
						    <option value="신협">신협</option>
						    <option value="하나">하나</option>
						    <option value="기업">기업</option>
						    <option value="새마을금고">새마을금고</option>
						  </select>
					</div>								
                  </div>
                  
                  &nbsp;
                  
                  <div id="accnumArea" class="accountZone az1">                 
	                  <div class="input-group mb-3 accnumDiv">
							<input type="text" class="form-control accnumInput" placeholder="계좌번호 " aria-label="Username" aria-describedby="basic-addon1" name="saccount">
					  </div>                           
                  </div>
   
                  <br class="accountZone az3"><hr class="accountZone az3"><br class="accountZone az3">
                  <div class="dateBox">
                    <p class="openDate dateLabel">개통일</p>&nbsp; &nbsp;
                    <select id="year" class="form-select openDate" aria-label="Default select example" name="year">
                      <option value="미확인">미확인</option>
                      <option value="2021년">2021년</option>
                      <option value="2020년">2020년</option>
                      <option value="2019년">2019년</option>
                      <option value="2018년">2018년</option>
                      <option value="2017년">2017년</option>
                    </select>&nbsp;
                    <select id="month" class="form-select openDate" aria-label="Default select example" name="month" disabled>
                      <option value="1월">1월</option>
                      <option value="2월">2월</option>
                      <option value="3월">3월</option>
                      <option value="4월">4월</option>
                      <option value="5월">5월</option>
                      <option value="6월">6월</option>
                      <option value="7월">7월</option>
                      <option value="8월">8월</option>
                      <option value="9월">9월</option>
                      <option value="10월">10월</option>
                      <option value="11월">11월</option>
                      <option value="12월">12월</option>
                    </select>&nbsp;
                    <select  id="day" class="form-select openDate" aria-label="Default select example" name="day" disabled>
                      <option value="1일">1일</option>
                      <option value="2일">2일</option>
                      <option value="3일">3일</option>
                      <option value="4일">4일</option>
                      <option value="5일">5일</option>
                      <option value="6일">6일</option>
                      <option value="7일">7일</option>
                      <option value="8일">8일</option>
                      <option value="9일">9일</option>
                      <option value="10일">10일</option>
                      <option value="11일">11일</option>
                      <option value="12일">12일</option>
                      <option value="13일">13일</option>
                      <option value="14일">14일</option>
                      <option value="15일">15일</option>
                      <option value="16일">16일</option>
                      <option value="17일">17일</option>
                      <option value="18일">18일</option>
                      <option value="19일">19일</option>
                      <option value="20일">20일</option>
                      <option value="21일">21일</option>
                      <option value="22일">22일</option>
                      <option value="23일">23일</option>
                      <option value="24일">24일</option>
                      <option value="25일">25일</option>
                      <option value="26일">26일</option>
                      <option value="27일">27일</option>
                      <option value="28일">28일</option>
                      <option value="29일">29일</option>
                      <option value="30일">30일</option>
                      <option value="31일">31일</option>
                    </select>
                    <a href="#" id="dateCheck">개통일자 확인 방법</a>
                  </div>
                  <br><hr><br>
                    <div id="statusBox">
                      <p class="statusTitle">제품상태</p>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="condition" id="status1" value="미사용" checked>
                        <label class="form-check-label" for="status1">미사용</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="condition" id="status2" value="상">
                        <label class="form-check-label" for="status2">상 (새제품 수준/무흠집)</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="condition" id="status3" value="중">
                        <label class="form-check-label" for="status3">중 (생활흠집 외 양호)</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="condition" id="status4" value="하">
                        <label class="form-check-label" for="status4">하 (번인/잔상/파손)</label>
                      </div>
                    </div>
                    <br><hr><br>
                    <div id="statusBox">
                      <p class="statusTitle">구성품</p>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="component" id="component1" value="단품" checked>
                        <label class="form-check-label" for="component1">단품</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="component" id="component2" value="누락">
                        <label class="form-check-label" for="component2">일부 구성품 누락 및 교체</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input status" type="radio" name="component" id="component3" value="풀박스">
                        <label class="form-check-label" for="component3">풀박스 (구입당시 박스와 구성품)</label>
                      </div>
                    </div>
                    <br><hr><br>
                      <div id="goodsContent">
                        <div class="mb-3">
                          <label for="exampleFormControlTextarea1" class="form-label statusTitle">제품 설명</label>
                          <br><br>
                          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content" required></textarea>
                        </div>
                        <br><hr>
                        <div id="notice"><p class="size">주의사항</p>
                           판매등록 시 안전거래정책에 동의하는 것으로 간주하며, 아래 사항을 준수하지 않는 경우 사전동의없이 임의 삭제/경고처리 될수 있습니다.   <br>
                          - <span class="color">하나의 판매글 당 1개의 제품 판매</span>해야 합니다.<br>
                          - 안전거래 시 직거래/타사이트 유도(직거래글 포함) 및 카카오톡/이메일/전화번호 등 <span class="color">연락처는 기재하실 수 없습니다.</span><br>
                          - 위 제품정보에 <span class="color">선택한 내용과 실제품이 다른 경우 모든 책임은 판매자</span>에게 있으며, 반품시 <span class="color">제품 개봉 등에 따른 차액 보상을 구매자에게 요구 할수 없습니다.</span><br>
                          - <span class="color">실판매물품의 사진</span>과 함께 A/S(사설수리 포함)/불량/구성품/부품교체/비정품 등 누락없이 상세히 기재해야하며, <span class="color">설명부족 등으로 인한 책임은 판매자에게 있습니다.</span><br>
                          - 비정품 부품(중국산 등) 수리/교체), <span class="color">정상개통 및 사용이 불가능한 제품</span>(분실,파손,체납 등), 휴대폰 부품, 가입조건부판매 등은 거래불가합니다.<br>
                          - 물품은 <span class="color">14일간 노출</span>되며, 재등록기능을 이용하여 최신글로 등록/수정하실 수 있습니다. (등록된 글은 검색엔진에 노출될 수 있습니다)<br>
                        </div>
                      </div>
                      
   
                      <br>
                      <div id="btn">
                      <button type="submit" class="btn btn-success">안전거래 판매등록</button>
                      </div>  
                  </div>
                  </form>
                </div>
            </div>                      
          </div>          
        </div>
    </div>
    
    <script>  
    	var count = 0;
    
      $(function(){
    	  
        // 금액 계산
        goodsPrice = 0;
        delivery = 0;
        total = 0;
         $("#goodsPrice").change(function(){
           
          goodsPrice = $(this).val();

          $("#deliveryFee").change(function(){
            delivery = $(this).val();
            total = parseInt(goodsPrice) + parseInt(delivery);
            if($.isNumeric(total)) {
              const result = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
              $("#totalPrice").text(result + "원");
            } else {
              $("#totalPrice").text("0원")
            }
            
          });

            total = parseInt(goodsPrice) + parseInt(delivery);  
            if($.isNumeric(total)) {

              const result = total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
              $("#totalPrice").text(result + "원");
            }  else {
              $("#totalPrice").text("0원")
            }

            const result2 =  parseInt(goodsPrice / 20);
            const result3 = result2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
            $("#safeFee").text(result3 + "원");
       });

       // 개통일
       $("#year").change(function(){
          if($("#year option:selected").text() != "미확인") {
            $("#month").removeAttr("disabled");
            $("#day").removeAttr("disabled");
        } else {
          $("#month").attr("disabled", true);
          $("#day").attr("disabled", true);
        }
       });

       // 글자수
       $("#goodsTitle").keyup(function(){
        	let inputLength = $(this).val().length;  

        	$(".titleSpan").html(inputLength);

        	if(inputLength == 40){
          		$("#stop").html("최대 40자까지 입력 가능합니다.");
       		} else {
         		 $("#stop").html("");
       		 }
       });
       
       // 사진 업로드      
       $("#inputGroupFile01").change(function(){
    	   loadImg(this);	  
       });

       // 끝     
    });
      
      
   	  // 다중 이미지 파일 업로드
      function loadImg(element){
    	  var imgList = element.files;
    	  $("#imgDiv").empty();
  
    	
		for(var i = 0; i < imgList.length; i++) {
		
			if(imgList && imgList[i]){		
				var reader  = new FileReader();
				reader.readAsDataURL(imgList[i]);
				 
				 reader.onload = function(e){					 				 
					 var size = {width : "150px", height: "150px", margin: "10px"};
					
					 $("#imgDiv").append('<img class="preview" src="' + e.target.result + '" style="width:150px; height:150px; border:1px solid black; margin:10px;">' )
					  var imgs = $("#imgDiv").children('img');
					 			 
	     		 };
	     		
	     		 
	     	 };		
		};

      };   
      
      $("#productName").keyup(function(){
          let keyword = $("#productName").val();
          $(".autoComplete").remove();
          $.ajax({
  					url : "${ contextPath }/goods/productName",
            data : {keyword : keyword},
  					type : "get",
  					success : function(list){						
  						
  						$.each(list, function(index, value){ 							
  							
  								$("#autoArea").append("<div class='autoComplete'>"
											+ "<img src='${ contextPath }/resources/puploadFiles/" + "20210521000000_2.jpg" + "' class='autoImg'> <p class='autop name1'>" + value.proname + "</p>"
											+ "<p class='autop name2'>" + value.modelname + "</p>"
											+ "<p class='autop name3'>" + value.maker + "</p></div>");  						
  							
  						});
  										
  						 $(".autoComplete").click(function(){
  				        	 	var productName = $(this).find("p.name2").html();
  				        	 	$("#productName").val(productName);
  				        	 	$(".autoComplete").remove();
  				        	 	
  				          });
  												
  					},
  					error : function(e){
  						$(".autoComplete").remove();
  					}
  				})
        });
      
      // 카카오 맵
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.498472, 127.032556), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로W 옮깁니다
		    marker.setPosition(latlng);
		    
		    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    
		    document.getElementById('dealAdd').value = latlng.getLat() + "," + latlng.getLng();
		    console.log($("#dealAdd").val());
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		});
		
		
		$(function(){
			
				if($("input[name=dealWay]:checked").val() == "안전거래"){
					console.log("안전거래")
					$(".mapArea").css({"display" : "none"});
					$(".mapLine").css({"display" : "none"});
				} 
				
				$("input[name=dealWay]").change(function(){
					if($("input[name=dealWay]:checked").val() == "직거래"){
						console.log("직거래")
						$(".mapArea").css({"display" : "block"});
						$(".mapLine").css({"display" : "block"});
						$(".deliveryArea").css({"display" : "none"});
						$(".fee2").css({"display" : "none"});
						$(".accountZone").css({"display" : "none"});
					
					} else {
						$(".mapArea").css({"display" : "none"});
						$(".mapLine").css({"display" : "none"});
						$(".deliveryArea").css({"display" : "flex"});
						$(".fee2").css({"display" : "inline"});
						$(".az1").css({"display" : "inline-block"});
						$(".az2").css({"display" : "inline-block"});
						$(".az3").css({"display" : "block"});
					}
				});
			
			
			
			
			
			
			
		});
		
		
		
		
		
    </script>
    
  
    <jsp:include page="../common/footer.jsp"/>


</body>
</html>