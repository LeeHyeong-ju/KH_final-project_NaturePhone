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
	
	.table {
		text-align: center;
	}
	.table td {
		height: 80px;
		vertical-align: middle;
	}
	
	b {
		margin-left: 50px;
		font-size: 1.1em;
	}
	
	#selectDelCompany {
		width: 170px;
		margin-left: 20px;
	}
	#inputInvoiceNo {
		width: 270px;
		margin-left: 10px;
	}
	#selectDelCompany, #inputInvoiceNo {
		display: inline-block;
	}
	#delInfoButtonArea {
		float: right;
		margin-right: 20px;
	}
	
	#paymentInfoArea {
		margin-bottom: 80px;
	}
	
	#toListArea {
		text-align: center;
	}
	#toListBtn {
		width: 70px;
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
						<div id="saleInfoArea">
							<b>판매상세정보</b>
							<hr>
							<table class="table" id="sellInfoTable">
								<tr>
									<th class="table-secondary">물품번호</th>
									<th class="table-secondary">게시글 제목</th>
									<th class="table-secondary">제품명</th>
									<th class="table-secondary">금액</th>
									<th class="table-secondary">판매방식</th>
									<th class="table-secondary">진행상태</th>
								</tr>
								<tr>
									<td>${ sellInfo.goodsNo }</td>
									<td>${ sellInfo.gtitle }</td>
									<td>${ sellInfo.modelName }</td>
									<td><fmt:formatNumber value="${ sellInfo.price }" groupingUsed="true"/>원</td>
									<td>${ sellInfo.dealWay }</td>
									<td>${ sellInfo.progress }</td>
								</tr>               
							</table>
						</div>
						<br><br><br>
						<div id="buyerInfoArea">
							<b>수령인 배송지정보</b>
							<hr>
							<table class="table" id="buyerInfoTable">
								<tr>
									<th class="table-secondary">받으시는 분</th>
									<th class="table-secondary">연락처</th>
									<th class="table-secondary">주소</th>
									<th class="table-secondary">배송 시 요청사항</th>
								</tr>
								<tr>
									<td>${ buyerInfo.userName }</td>									
									<c:choose>
										<c:when test="${ buyerMdfInfo.phone != null }">
										<td>${ buyerMdfInfo.phone }</td>
										</c:when>
										<c:otherwise>
										<td>${ buyerInfo.phone }</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${ buyerMdfInfo.address != null }">
										<td>${ buyerMdfInfo.address }</td>
										</c:when>
										<c:otherwise>
										<td>${ buyerInfo.address }</td>
										</c:otherwise>
									</c:choose>
									<td>${ buyerInfo.dealRequest }</td>
								</tr>               
							</table>
						</div>
						<br><br><br>
						<form action="">
						<div id="inputDeliveryInfoArea">
							<b>배송 정보 입력</b>
							<hr>
							<select class="form-select" id="selectDelCompany" name="delInfoCategory" style="font-size:1.1em;">
								<option style="display:none;">배송업체 선택</option>
								<option value="">CJ대한통운</option>
								<option value="">우체국택배</option>
								<option value="">로젠택배</option>
								<option value="">한진택배</option>
								<option value="">롯데택배</option>
								<option value="">편의점택배</option>
							</select>
							<input type="text" class="form-control" placeholder="송장번호를 입력해 주세요" id="inputInvoiceNo" name="inputInvoiceNo" style="font-size:1.1em;" required>
							<div id="delInfoButtonArea">
								<button type="button" class="btn btn-secondary btn-sm">발송완료</button> &nbsp;
								<button type="button" class="btn btn-secondary btn-sm">직거래완료</button>
							</div>
						</div>
						</form>
						<hr><br><br><br>
						<div id="paymentInfoArea">
							<b>결제정보</b>
							<hr>
							<table class="table">
								<tr>
									<th class="table-secondary">제품금액</th>
									<th class="table-secondary">거래방식</th>
									<th class="table-secondary">결제유형</th>
									<th class="table-secondary">배송비</th>
									<th class="table-secondary">최종 결제금액</th>
								</tr>
								<tr>
									<td><fmt:formatNumber value="${ payInfo.price }" groupingUsed="true"/>원</td>
									<td>${ payInfo.dealWay }</td>
									<td>카드결제</td>
									<td><fmt:formatNumber value="${ payInfo.deliveryFee }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${ payInfo.price + payInfo.deliveryFee }" groupingUsed="true"/>원</td>
								</tr>               
							</table>
						</div>
						<div id="toListArea">
							<button type="button" class="btn btn-secondary btn-sm" id="toListBtn">목록</button>
						</div>       
					</div>
					<!-- 내용 end -->				
				</div>
			</div>									
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>