<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 5.0 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- DatePicker-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script> <!-- 한국어 설정 -->
<script>
	$(function() {
		$.datepicker.setDefaults($.datepicker.regional['ko']); // 한국어 설정
		$('#date1').datepicker({
			dateFormat: "yy/mm/dd"
		});
		$('#date2').datepicker({
			dateFormat: "yy/mm/dd"
		});
	});
</script>
<title>나의 판매내역</title>
<style>
	/* 사이드바 css */
	#Container {
		margin-top: 100px;
	}
	
	.rightSpace a {
		color: rgb(7, 7, 7) !important;
	}
	
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
	.sideBar li {
		background-color: #56CE7C;
		color: #ffffff;
	}
	
	.main-div {
		background: #ffffff none repeat scroll 0 0;
		border-radius: 2px;
		margin: auto;
		padding: 0px 70px 70px 70px;
	}

	/* 내용 css */
	#infoOuter {
		width: 850px;
		font-size: 0.8em;
	}

	#processCategoryTable td {
		border: 2px solid lightgray;
		width: 140px;
		height: 100px;
		text-align: center;
	}
	#processCategoryTable img {
		width: 45px;
		height: 45px;
		margin-left: 10px;
	}
	#processCategoryTable td div:nth-child(1) {
		display: inline-block;
	}
	#processCategoryTable td div:nth-child(2) {
		display: inline-block;
		text-align: center;
		vertical-align: middle;
		font-weight: bold;
		width: 60px;
	}
	#processCategoryTable img, #processCategoryTable td div:nth-child(1), #processCategoryTable td div:nth-child(2) {
		cursor: pointer;
	}

	#selectCategoryArea, #periodButtonArea, #datePickerArea, #date1, #date2, #infoTd2, #infoTd3 {
		display: inline-block;
		vertical-align: middle;
	}
	#infoTd2 {
		margin-left: 10px;
	}
	#infoTd3 {
		width: 65px;
		padding-bottom: 15px;
	}

	#selectCategory {
		width: 125px;		
	}

	#date1, #date2 {
		width: 100px;
	}

	#searchArea {
		width: 200px;
		float: right;		
	}
	
	#selectCategory, #periodButtonArea {
		margin-right: 5px;
	}

	#listTable th, #listTable td:nth-child(1), #listTable td:nth-child(3) {
		text-align: center;
	}
	#listTable td:nth-child(1) {
		width: 150px;
	}
	#listTable td:nth-child(2) {
		width: 500px;
	}
	#listTable td:nth-child(3) {
		width: 200px;
		font-weight: bold;
	}
	#listTable td:nth-child(1), #listTable td:nth-child(2) div, #listTable td:nth-child(3) {
		vertical-align: middle;
	}
	#listTable img {
		width: 150px;
		height: 110px;
	}		
</style>
</head>
<body>
	<!-- 메뉴바 -->
	<jsp:include page="../common/menubar.jsp"/>

	<!-- 사이드바 -->
	<div class="container" id="Container">
		<div class="row">
			<div class="col-md-2 rightSpace">
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">마이페이지</li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">회원 정보</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">나의 게시글</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">나의 댓글</a></li>
					</ul>
				</div>
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">쪽지함</li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">받은 쪽지함</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">보낸 쪽지함</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">보관함</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">휴지통</a></li>
					</ul>
				</div>
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">주문내역</li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">나의 판매내역</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">나의 구매내역</a></li>
						<li><a href="#" class="list-group-item list-group-item-action sideContent">관심상품</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 내용 -->
			<div class="col-md-8 content">
				<div class="main-div">				
					<!-- 작성 부분 -->		
					<div class="outer" id="infoOuter">
						<form action="">
						<div id="processCategoryArea">
							<table id="processCategoryTable">
								<tr>
									<td>
										<div><img src="${contextPath}/resources/images/icon/book.png"></div>
										<div>0<br>전체</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/package.png"></div>
										<div>0<br>배송준비</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/airplane.png"></div>
										<div>0<br>배송중</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/calculator.png"></div>
										<div>0<br>구매결정완료</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/return.png"></div>
										<div>0<br>반품요청중</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/checked.png"></div>
										<div>0<br>거래완료</div>
									</td>
								</tr>
							</table>
						</div>
						<br>
						<div id="filterArea">
							<hr>
							<div id="selectCategoryArea">
								<select class="form-select form-select-sm" id="selectCategory">
									<option>거래상태</option>
									<option>배송준비</option>
								</select>
							</div>
							<div id="periodButtonArea">
								<button type="button" class="btn btn-secondary btn-sm">1개월</button>
								<button type="button" class="btn btn-secondary btn-sm">3개월</button>
								<button type="button" class="btn btn-secondary btn-sm">6개월</button>
							</div>
							<div id="datePickerArea">
								<input type="text" class="form-control form-control-sm" id="date1"> ~
								<input type="text" class="form-control form-control-sm" id="date2">
								<button type="button" class="btn btn-outline-secondary btn-sm">검색</button>
							</div>
							<div id="searchArea" class="input-group mb-3">
								<input type="text" class="form-control form-control-sm" placeholder="물품번호 입력" id="searchInput">
								<button type="button" class="btn btn-outline-secondary btn-sm">검색</button>
							</div>
							<hr>
						</div>
						</form>
						<br>
						<div id="listArea">
							<table id="listTable" class="table">
								<tr>
									<th colspan="2" class="table-secondary">나의 판매내역</th>
									<th class="table-secondary">진행상태</th>
								</tr>
								
								<c:forEach items="${ sellInfoList }" var="si">								
								<tr>
									<td>
										<div>
											물품번호<br>${ si.goodsNo }<br><br>
											<b><fmt:formatNumber value="${ si.price }" groupingUsed="true"/>원</b>																						
										</div>                       
									</td>
									<td>
										<img src="..">
										<div id="infoTd2">
											${ si.gtitle }<br>
											${ si.modelName }<br>
											${ si.createDate }
										</div>                       
									</td>
									<td>
										<div id="infoTd3">
											${ si.progress }
										</div>
										<div>
											<c:if test="${ si.progress == '거래완료' }">
											<button type="button" class="btn btn-secondary btn-sm">내역삭제</button>
											</c:if>											
											<%-- <button type="button" class="btn btn-secondary btn-sm" onclick="selectSellInfo(\'' + ${si.goodsNo} + '\',\'' + ${si.progress} + '\');">상세보기</button> --%>
											<button type="button" class="btn btn-secondary btn-sm" onclick="selectSellInfo(${si.goodsNo});">상세보기</button>											
										</div>                                             
									</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<div id="pagingArea">
							<div>
								페이징 영역 / 더보기
							</div>							
						</div>						
					</div>
					<!-- 내용 end -->				
				</div>
			</div>									
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function selectSellInfo(goodsNo){
			location.href = '${contextPath}/sellInfo/detail?goodsNo=' + goodsNo;
		}
	</script>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>