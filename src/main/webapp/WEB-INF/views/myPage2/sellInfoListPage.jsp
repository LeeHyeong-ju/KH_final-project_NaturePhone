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
			dateFormat: "yy/mm/dd",
			maxDate: "0"
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
		font-size: 0.9em;
	}

	#processCategoryTable td {
		border: 2px solid lightgray;
		width: 140px;
		height: 110px;
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
		margin-left: 20px;
	}
	#infoTd3 {
		width: 70px;
		padding-bottom: 15px;
	}

	#selectCategory {
		width: 130px;		
	}

	#date1, #date2 {
		width: 100px;
	}
	
	#searchForm {
		display: inline-block;
		float: right;
	}
	#searchArea {
		width: 200px;				
	}
	
	#selectCategory, #periodButtonArea {
		margin-right: 5px;
	}

	#listTable th, #listTable td:nth-child(1), #listTable td:nth-child(3), #pagingArea {
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
	#listTable td:nth-child(1), #listTable td:nth-child(2), #listTable td:nth-child(3) {
		vertical-align: middle;
	}
	#listTable img {
		width: 170px;
		height: 130px;
		border-radius: 10px;
		margin: 8px 0px 8px 0px;
	}
	#listTable tr {
		display: none;
	}
	
	#moreBtn {
		display: none;
		width: 100px;
		margin: 20px 0px 50px 0px;
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
					</ul>
				</div>
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">주문내역</li>
						<li><a href="${ contextPath }/sellInfo/list" class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">나의 판매내역</a></li>
						<li><a href="${ contextPath }/buyInfo/list" class="list-group-item list-group-item-action sideContent">나의 구매내역</a></li>
						<li><a href="${ contextPath }/itd/list" class="list-group-item list-group-item-action sideContent">관심상품</a></li>
					</ul>
				</div>
			</div>
			
			<!-- 내용 -->
			<div class="col-md-8 content">
				<div class="main-div">									
					<!-- 작성 부분 -->		
					<div class="outer" id="infoOuter">
						<div id="processCategoryArea">
							<table id="processCategoryTable">
								<tr>
									<td>
										<div><img src="${contextPath}/resources/images/icon/book.png" onclick="location.href='${contextPath}/sellInfo/list'"></div>
										<div onclick="location.href='${contextPath}/sellInfo/list'">${ allCnt }<br>전체</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/package.png" onclick="sortList('배송준비(결제완료)');"></div>
										<div onclick="sortList('배송준비(결제완료)');">${ preparedCnt }<br>배송준비</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/airplane.png" onclick="sortList('배송');"></div>
										<div onclick="sortList('배송');">${ deliveryCnt }<br>배송중</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/calculator.png" onclick="sortList('구매결정완료');"></div>
										<div onclick="sortList('구매결정완료');">${ decisionCnt }<br>구매결정완료</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/return.png" onclick="sortList('반품요청');"></div>
										<div onclick="sortList('반품요청');">${ returnCnt }<br>반품요청</div>
									</td>
									<td>
										<div><img src="${contextPath}/resources/images/icon/checked.png" onclick="sortList('거래완료');"></div>
										<div onclick="sortList('거래완료');">${ finishedCnt }<br>거래완료</div>
									</td>
								</tr>	
							</table>
						</div>
						<br>
						
						<div id="filterArea">
							<hr>
							<div id="selectCategoryArea">
								<form action="" method="get" id="categoryForm">
								<select class="form-select form-select-sm" id="selectCategory" name="category">
									<option value="전체보기" ${cateInfo.category eq "전체보기" ? "selected":""}>전체보기</option>
									<option value="배송준비(결제완료)" ${cateInfo.category eq "배송준비(결제완료)" ? "selected":""}>배송준비</option>
									<option value="배송" ${cateInfo.category eq "배송" ? "selected":""}>배송</option>
									<option value="반품요청" ${cateInfo.category eq "반품요청" ? "selected":""}>반품요청</option>
									<option value="환불예정" ${cateInfo.category eq "환불예정" ? "selected":""}>환불예정</option>
									<option value="반품보류" ${cateInfo.category eq "반품보류" ? "selected":""}>반품보류</option>
									<option value="구매결정완료" ${cateInfo.category eq "구매결정완료" ? "selected":""}>구매결정완료</option>
									<option value="거래완료" ${cateInfo.category eq "거래완료" ? "selected":""}>거래완료</option>
								</select>
								</form>
							</div>
							<div id="periodButtonArea">
								<button type="button" class="btn btn-secondary btn-sm" onclick="monthsBtnList(1);">1개월</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="monthsBtnList(3);">3개월</button>
								<button type="button" class="btn btn-secondary btn-sm" onclick="monthsBtnList(6);">6개월</button>
							</div>							
							<div id="datePickerArea">
								<form action="" method="get" id="datePickerForm">
								<input type="text" class="form-control form-control-sm" id="date1" name="date1"> ~
								<input type="text" class="form-control form-control-sm" id="date2" name="date2">
								<button type="button" class="btn btn-outline-secondary btn-sm" id="datePickerBtn">검색</button>
								</form>
							</div>
							<form action="${ contextPath }/sellInfo/searchList" method="get" id="searchForm">													
							<div id="searchArea" class="input-group mb-3">			
								<input type="text" class="form-control form-control-sm" placeholder="제목으로 검색" id="searchInput" name="keyword" required>
								<button type="submit" class="btn btn-outline-secondary btn-sm">검색</button>							
							</div>
							</form>							
							<hr>
						</div>
						<br>
						
						<div id="listArea">
							<table id="listTable" class="table">
								<tr>
									<th colspan="2" class="table-secondary">나의 판매내역</th>
									<th class="table-secondary">진행상태</th>
								</tr>
								
								<c:if test="${ sellInfoList.isEmpty() }">
								<tr>
									<td colspan="3">지금 거래를 시작해 보세요 :)</td>
								</tr>									
								</c:if>
								<c:forEach items="${ sellInfoList }" var="si">								
								<tr>
									<td>
										<div>
											물품번호<br>${ si.goodsNo }<br><br>
											<b><fmt:formatNumber value="${ si.price }" groupingUsed="true"/>원</b>																						
										</div>                       
									</td>
									<td>
										<c:forEach items="${ attList }" var="att">
										<c:if test="${ si.goodsNo == att.goodsNo }">
											<img src="${ contextPath }/resources/guploadFiles/${ att.changeName }" onclick="toGoodsDetail(${si.goodsNo});">
										</c:if>
										</c:forEach>										
										<div id="infoTd2">
											<b id="goodsTitle" onclick="toGoodsDetail(${si.goodsNo});">${ si.gtitle }</b><br><br>
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
											<button type="button" class="btn btn-secondary btn-sm" onclick="deleteSellInfo(${si.dealNo});">내역삭제</button>
											</c:if>
											<button type="button" class="btn btn-secondary btn-sm" onclick="selectSellInfo(${si.goodsNo});">상세보기</button>											
										</div>                                             
									</td>
								</tr>
								</c:forEach>
							</table>
						</div>
						<br><br>
						
						<div id="pagingArea">
							<div>
								<button type="button" class="btn btn-success btn-sm" id="moreBtn">더보기</button>
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
	
	<script>
		$(function(){
			if($("#listTable tr").length > 3){
				$("#moreBtn").css("display", "inline-block");
			}
			$("#listTable tr").slice(0, 3).show();
			$("#moreBtn").click(function(e){
				e.preventDefault();
				$("#listTable tr:hidden").slice(0, 3).show();
				if($("#listTable tr:hidden").length == 0){
					$("#moreBtn").css("display", "none");
				}
			});
		});
	</script>
	
	<script>
		$(function(){
			$("select[name='category']").change(function(){
				$("#categoryForm").attr("action", "${ contextPath }/sellInfo/sortList");
				$("#categoryForm").submit();
			});
		});
	</script>
	
	<script>
		function sortList(processCategory){
			location.href = '${contextPath}/sellInfo/sortList?category=' + processCategory;
		}
	</script>
	
	<script>
		function monthsBtnList(monthBtnNo){
			location.href = '${contextPath}/sellInfo/months?m=' + monthBtnNo;
		}
	</script>
	
	<script>
		$(function(){
			$('#datePickerBtn').click(function(){				
				if($('#date1').datepicker("getDate") == null || $('#date2').datepicker("getDate") == null){
					alert("날짜를 선택해 주세요.");
				} else{
					$("#datePickerForm").attr("action", "${ contextPath }/sellInfo/calendar");
					$("#datePickerForm").submit();
				}
			});
		});
	</script>
	
	<script>
		$(function(){
			$("#listTable img, #goodsTitle").mouseenter(function(){
				$(this).css({cursor:"pointer", opacity:"0.5", transition:"all 0.5s"});
			}).mouseleave(function(){
				$(this).css({opacity:"1", transition:"all 1s"});
			});
		});
	</script>
	
	<script>
		function toGoodsDetail(goodsNo){
			location.href = '${contextPath}/goods/detail?goodsNo=' + goodsNo;
		}
	</script>
	
	<script>
		function deleteSellInfo(dealNo){
			var yn = confirm("삭제 이후 복구가 불가능합니다.\n정말 삭제하시겠습니까?");
			if(yn == true){
				location.href = '${contextPath}/sellInfo/delete?dealNo=' + dealNo;
			}			
		}
	</script>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>