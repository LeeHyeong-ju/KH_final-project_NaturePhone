<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 자바스크립트-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>스펙 비교</title>
<style>
	.main-div {
	  background: #ffffff none repeat scroll 0 0;
	  border-radius: 2px;
	  margin: 10px auto 30px;
	  max-width: 850px;
	  padding: 50px 70px 70px 71px;
	}
	/*사이드 바*/
	.sideBar {
	  text-align: center;
	}
	.sideTitle {
	  background-color: lightgray;
	  border-color: lightgray;
	  font-size: 14px;
	  font-weight: bold;
	}
	.sideContent {
	  font-size: 13px;
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
	
	#phone-select-table {
	  width : 750px;
	  height : 150px;
	}
	
	#phone-select-table th {
	  text-align : center;
	  width : 20%;
	  height : 100%;
	  border : 1px solid lightgray;
	}
	
	.phone-select-button {
	  width : 100px;
	  height : 100px;
	  text-align : center;
	  background : white;
	  color : gray;
	  border : none;
	  border-radius : 15px;
	}
	
	.phone-select-button > img {
		width : 100%;
		height : auto;
	}
	
	#submit {
	  width : 88px;
	  height : 88px;
	  text-align : center;
	  background : white;
	  border-radius : 15px;
	  color : #56CE7C;
	  border : 1.5px solid #56CE7C;
	}
	
	.popupLayer {
		position: absolute;
		display: none;
		background-color: #ffffff;
		border: solid 2px #56CE7C;
		width: 350px;
		height: 150px;
	}
	.layerTitle {
		height : 45px;
		background : #56CE7C;
		padding: 10px;
	}
	.layerTitle > * {
		display : inline-block;
		color : #ffffff;
	}
	.layerContent {
		width : 100%;
		height : 105px;
		padding : 10px;
		font-size : 13px;
	}
	input[name="radio-type"] {
		margin-left : 20px;
	}
	.radio-area {
		width : 100%;
		height : 40px;
	}
	.select-area {
		width : 100%;
		height : 45px;
	}
	.select-area > select {
		margin-left : 20px;
	}
	.input-area {
		width : 100%;
		height : 45px;
	}
	#list-product {
		width : 100%;
		height : 20px;
		overflow : auto;
		margin-top : 10px;
	}
	.phone-info {
		width : 100%;
		height : 150px;
	}
	.phone-info:hover {
		cursor : pointer;
	}
	.clearBtn {
		width:35%; 
		height:15%; 
		font-size:10px; 
		font-weight:bold;
		display:block; 
		margin:auto;
		border:0.5px solid lightgray;
		border-radius:5px;
		background:#56CE7C;
		color:white;
	}
	.compare-info-view > p {
		font-size:14px;
		font-weight:bold;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="container">
	  <div class="row">
	    <div class="col-md-2 rightSpace" style="margin-top: 100px;">
	      <!-- 사이드바 -->
	      <div class="list-group col-md-10 sideBar">
	        <ul>
	        	<li class="list-group-item sideTitle">편의기능</li>
	        	<li><a href="${ contextPath }/support/compare" class="list-group-item list-group-item-action sideContent">스펙 비교</a></li>
	        	<li><a href="${ contextPath }/support/quote" class="list-group-item list-group-item-action sideContent">중고폰 시세</a></li>
	        </ul>
	      </div>
	    </div>
	    <!-- 내용 -->
	    <div class="col-md-8 content">
	      <div class="main-div">
	        <h5>기종 선택</h5>
	        <table id="phone-select-table">
	          <tr>
	              <th><button class="phone-select-button"><img src="${ contextPath }/resources/images/compareBtn.png"></button></th>
	              <th><button class="phone-select-button"><img src="${ contextPath }/resources/images/compareBtn.png"></button></th>
	              <th><button class="phone-select-button"><img src="${ contextPath }/resources/images/compareBtn.png"></button></th>
	              <th><button class="phone-select-button"><img src="${ contextPath }/resources/images/compareBtn.png"></button></th>
	              <th><button id="submit">비교 결과<br>출력</button></th>
	          </tr>
	        </table>
	        
	        <div class="compare-info-view">
				<p>스펙</p>
				<table>
					<tr>
					<th>이미지</th>
					<c:forEach items="${ clist }" var="c">
						<td><img src="${contextPath}${ c.filePath }/${ c.fileRename }"></td>
					</c:forEach>
					</tr>
					<tr>
					<th>제품명</th>
					<c:forEach items="${ clist }" var="c">
						<td><p>${ c.proname }</p></td>
					</c:forEach>
					</tr>
					<tr>
					<th>모델명</th>
					<c:forEach items="${ clist }" var="c">
						<td><p>${ c.modelname }</p></td>
					</c:forEach>
					</tr>
					<tr>
					<th>제조사</th>
					<c:forEach items="${ clist }" var="c">
						<td><p>${ c.maker }</p></td>
					</c:forEach>
					</tr>
					<tr>
					<th>출시일</th>
					<c:forEach items="${ clist }" var="c">
						<td>${ c.releaseDate }</td>
					</c:forEach>
					</tr>
					<tr>
					<th>출고가</th>
					<c:forEach items="${ clist }" var="c">
						<td>${ c.releasePrice }</td>
					</c:forEach>
					</tr>
					<tr>
					<th>출시 OS</th>
					<c:forEach items="${ clist }" var="c">
						<td>${ c.os }</td>
					</c:forEach>
					</tr>
				</table>
				<p>외형</p>
				<table>
					<tr>
					<th>주요재질</th>
					<c:forEach items="${ clist }" var="c">
						<c:forTokens items="${ c.appearance }" delims="_" var="a" varStatus="status">
							<td><c:if test="${ status.index eq 0 }">${ a }</c:if></td>
						</c:forTokens>
					</c:forEach>
					</tr>
					<tr>
					<th>크기(WxHxD,mm)</th>
					<c:forEach items="${ clist }" var="c">
						<c:forTokens items="${ c.appearance }" delims="_" var="a" varStatus="status">
							<td><c:if test="${ status.index eq 1 }">${ a }</c:if></td>
						</c:forTokens>
					</c:forEach>
					</tr>
					<tr>
					<th>무게</th>
					<c:forEach items="${ clist }" var="c">
						<c:forTokens items="${ c.appearance }" delims="_" var="a" varStatus="status">
							<td><c:if test="${ status.index eq 2 }">${ a }</c:if></td>
						</c:forTokens>
					</c:forEach>
					</tr>
					<tr>
					<th>연결단자</th>
					<c:forEach items="${ clist }" var="c">
						<c:forTokens items="${ c.appearance }" delims="_" var="a" varStatus="status">
							<td><c:if test="${ status.index eq 3 }">${ a }</c:if></td>
						</c:forTokens>
					</c:forEach>
					</tr>
				</table>
				<p>디스플레이</p>
				<table>
					
				</table>
				<p>성능</p>
				<table>
					
				</table>
				<p>카메라</p>
				<table>
					
				</table>
				<p>배터리</p>
				<table>
					
				</table>
				<p>통신</p>
				<table>
					
				</table>
				<p>특징</p>
				<table>
					
				</table>
	  		</div>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="popupLayer">
		<div class="layerTitle">
			<p>휴대폰 검색</p>
			<p onClick="closeLayer(this)" style="cursor:pointer; float:right;" title="닫기">X</p>
		</div>
		<div class="layerContent">	
			<div class="radio-area">
				<input type="radio" name="radio-type" id="radio-select-phone" value="0" checked>
				<label for="radio-select-phone">제품선택</label>
				<input type="radio" name="radio-type" id="radio-input-phone" value="1">
				<label for="radio-input-phone">직접입력</label>
			</div>
			<div class="select-area" style="display : block;">
				<select class="select-product" id="select-maker">
					<option selected>제조사 선택</option>
					<option>삼성전자</option>
					<option>LG전자</option>
					<option>애플</option>
					<option>팬택</option>
					<option>모토로라</option>
					<option>HTC</option>
					<option>KT Tech</option>
					<option>SK 텔레시스</option>
					<option>소니 모바일</option>
					<option>노키아</option>
				</select>
				<select class="select-product" id="select-carrier">
					<option selected>통신사 선택</option>
					<option>SKT</option>
					<option>KT</option>
					<option>LG U+</option>
				</select>
				<div id="list-product"></div>
			</div>
			<div class="input-area" style="display : none;">
				<label style="margin-left : 20px;">모델명</label>
				<input type="text" id="phone-model-name">
				<button id="submit-select-phone" 
				style="border:1px solid lightgray; border-radius:3px; background:#56CE7C; color:white;">선택</button>
			</div>
		</div>	
	</div>
	
	<script>
		var eobj = null;
		var pdata = null;
		
		function closeLayer( obj ) {
			$(obj).parent().parent().hide();
		}
	
		$(function(){
			/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
			$('.phone-select-button').click(function(e)
			{
				eobj = e.currentTarget;
				
				var sWidth = window.innerWidth;
				var sHeight = window.innerHeight;
	
				var oWidth = $('.popupLayer').width();
				var oHeight = $('.popupLayer').height();
	
				// 레이어가 나타날 위치를 셋팅한다.
				var divLeft = e.clientX + 10;
				var divTop = e.clientY + 5;
	
				// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
				if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
				if( divTop + oHeight > sHeight ) divTop -= oHeight;
	
				// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
				if( divLeft < 0 ) divLeft = 0;
				if( divTop < 0 ) divTop = 0;
	
				$('.popupLayer').css({
					"top": divTop,
					"left": divLeft,
					"position": "absolute"
				}).show();
			});
			
			$(document).mouseup(function(e){
				  var popupLayer = $(".popupLayer");
				  if(popupLayer.has(e.target).length === 0){
					  popupLayer.hide();
				  }
			});
	
			$("input[name=radio-type]").click(function(){
				$("input[name=radio-type]").removeAttr("checked");
				$(this).attr("checked", true);
				
				if($("input[name=radio-type]:checked").val() == "0"){
					$(".input-area").css("display", "none");
					$(".select-area").css("display", "block");
				} else if($("input[name=radio-type]:checked").val() == "1"){
					$("#list-product").html("");
					$(".popupLayer").css("height", "150px");
					$("#list-product").css("height", "20px");
					$(".select-area").css("display", "none");
					$(".input-area").css("display", "block");
				}
			});
			
			$(".select-product").on("change", function(){
				$(".popupLayer").css("height", "450px");
				$("#list-product").css("height", "320px");
				var selectMaker = $("#select-maker").val();
				var selectCarrier = $("#select-carrier").val();
				
				$.ajax({
					url : "${contextPath}/support/selectPhone",
					data : {maker : selectMaker, carrname : selectCarrier},
					type : "post",
					dataType : "json",
					success : function(data){
						body = $("#list-product");
						body.html("");
						
						if(!(selectMaker == '제조사 선택' && selectCarrier == '통신사 선택')){
							for(var i in data){
								div = $("<div class='phone-info'>");
								indiv = $("<div class='phone-info-in'>").attr("style", "padding:5px;");
								img = $("<img class='thumbnail'>").attr("src", "${contextPath}/resources/puploadFiles/" + data[i].fileRename)
												.attr("style", "float:left; width:40%; height:100%;");
								proname = $("<p class='proname'>").attr("style", "display:block; font-size:15px; font-weight:bold; margin-top:20px;")
												  .text(data[i].proname);
								modelname = $("<p class='modelname'>").attr("style", "display:block; font-size:14px;")
												    .text(data[i].modelname);
								carrname = $("<p class='carrname'>").attr("style", "display:inline; font-size:14px; color:red;")
												   .text(data[i].carrname);
								maker = $("<p class='maker'>").attr("style", "display:inline; font-size:14px;")
												.text(" / " + data[i].maker);
								prono = $("<input type='hidden' name='prono' class='prono'>").val(data[i].prono);
								
								indiv.append(proname, modelname, carrname, maker, prono);
								div.append(img, indiv);
								body.append(div);
							}
						}						
					},
					error : function(e){
						console.log(e);
					}
				});
			});
			
			$(document).on("click", '.phone-info', function(){
				$(eobj).nextAll().remove();
				
				var thumbnail = $(this).children(".thumbnail").attr("src");
				$(eobj).children('img').attr("src", thumbnail).css({"width" : "80%", "height" : "80%"});
				
				clearBtn = $("<button class='clearBtn'>취소</button>");
				
				prono = $(this).children(".phone-info-in").children(".prono").val();
				selectValue = $("<input type='hidden' name='prono' class='prono'>").val(prono);
				
				$(eobj).parent().append(clearBtn, selectValue);
				$(this).parent().parent().parent().parent().hide();
			});
			
			$(document).on("click", ".clearBtn", function(e){
				var obj = $(e.currentTarget).parent().children().eq(0);
				$(obj).nextAll().remove();
				var img = "${ contextPath }/resources/images/compareBtn.png";
				$(obj).children('img').attr("src", img).css({"width" : "100%", "height" : "auto"});
			});
			
			$(document).on("click", "#submit", function(e){
				var proNums = [];
				var obj = $(e.target).parent().siblings();
				
				for(var i = 0; i < 4; i++){
					var value = obj.eq(i).children('input').val();
					if(value != undefined){
						proNums.push(value);
					}
				}
				
				location.href="${contextPath}/support/compareInfo?proNums=" + proNums;
			});
		});
	</script>
</body>
</html>















