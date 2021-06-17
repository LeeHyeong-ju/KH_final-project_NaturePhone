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
<title>나의 구매내역</title>
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
	#sellInfoTable td, #buyerInfoTable td, #paymentInfoTable td {
		height: 80px;
		vertical-align: middle;
	}
	
	b {
		margin-left: 50px;
		font-size: 1.2em;
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
	
	#sellerInfoTable {
		width: 80%;
		margin: auto;
	}
	#sellerInfoTable th, #sellerInfoTable td {
		height: 50px;
		vertical-align: middle;
	}	
	
	#toListArea, #decisionBtnArea {
		text-align: center;
	}
	#toListBtn {
		width: 100px;
		margin-bottom: 50px;
	}
	
	/* modal */	
	#modalHeader {
		height: 80px;
	}
		
	#modalArea {
		font-size: 0.9em;
	}
	
	#staticBackdropLabel {
		font-weight: bold;
		margin-left: 185px;
	}
	
	h6 {
		text-align: center;
		font-weight: bold;
	}
	
	#selectReasonArea {
		width: 60%;
		margin: auto;
	}
	
	#reasonTextArea {
		resize: none;
	}
	
	#selectDelOptionArea {
		width: 170px;
		margin: auto;
	}

	#expectedPayment {
		text-align: center;
	}	
	#payment {
		display: inline-block;
	}
	
	#modalBtnArea {
		margin: auto;
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
						<li><a href="${ contextPath }/sellInfo/list" class="list-group-item list-group-item-action sideContent">나의 판매내역</a></li>
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
						<div id="saleInfoArea">
							<b>구매상세정보</b>
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
									<td>${ buyInfo.goodsNo }</td>
									<td>${ buyInfo.gtitle }</td>
									<td>${ buyInfo.modelName }</td>
									<td><fmt:formatNumber value="${ buyInfo.price }" groupingUsed="true"/>원</td>
									<td>${ buyInfo.dealWay }</td>
									<td>${ buyInfo.progress }</td>
								</tr>               
							</table>
						</div>
						<br>
						
						<c:if test="${ buyInfo.progress == '배송' }">
						<div id="decisionBtnArea">
							<button type="button" class="btn btn-secondary btn-sm" onclick="purchaseDecision(${buyInfo.dealNo})">구매확정</button> &nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop">반품신청</button>
						</div>	
						</c:if>						
						<br><br><br>																		
						
						<div id="buyerInfoArea">
							<b>나의 배송지정보</b>
							<hr>
							<table class="table" id="buyerInfoTable">
								<tr>
									<th class="table-secondary">이름</th>
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
						
						<c:choose>
							<c:when test="${ delInfo != null }">
							<div id="inputDeliveryInfoArea">
								<b>배송 정보</b>
								<hr>
								<select class="form-select" id="selectDelCompany" name="company" style="font-size:1.1em;" disabled="disabled">
									<option value="CJ대한통운" ${delInfo.company eq "CJ대한통운" ? "selected":""}>CJ대한통운</option>
									<option value="우체국택배" ${delInfo.company eq "우체국택배" ? "selected":""}>우체국택배</option>
									<option value="로젠택배" ${delInfo.company eq "로젠택배" ? "selected":""}>로젠택배</option>
									<option value="한진택배" ${delInfo.company eq "한진택배" ? "selected":""}>한진택배</option>
									<option value="롯데택배" ${delInfo.company eq "롯데택배" ? "selected":""}>롯데택배</option>
									<option value="편의점택배" ${delInfo.company eq "편의점택배" ? "selected":""}>편의점택배</option>
								</select>
								<input type="text" class="form-control" id="inputInvoiceNo" name="invoice" style="font-size:1.1em;" value="${ delInfo.invoice }" readonly>
							</div>
							<hr><br><br><br>						
							</c:when>
							<c:otherwise>							
							<div>
								<b>배송 정보</b><hr>
								<p style="font-size: 1em; text-align: center;">아직 택배가 출발하지 않았어요. 조금만 기다려 주세요.</p>
							</div>						
							<hr><br><br><br>
							</c:otherwise>
						</c:choose>
						
						<c:if test="${buyInfo.progress eq '반품요청'}">
						<div id="sellerInfoArea">
							<b>판매자 정보</b>
							<hr>
							<table class="table" id="sellerInfoTable">
								<tr>
									<th class="table-secondary">이름</th>
									<td>${ sellerInfo.name }</td>
									<th class="table-secondary">이메일</th>
									<td>${ sellerInfo.email }</td>
								</tr>
								<tr>
									<th class="table-secondary">연락처</th>
									<td>${ sellerInfo.phone }</td>
									<th class="table-secondary">가입일</th>
									<td>${ sellerInfo.createDate }</td>
								</tr>
								<tr>
									<th class="table-secondary">주소</th>
									<td colspan="3">${ sellerInfo.address }</td>
								</tr>
							</table>
						</div>
						<br><br><br>						
						</c:if>												
						
						<c:if test="${buyInfo.progress eq '반품요청'}">
							<c:choose>
								<c:when test="${ reDelInfo == null }">
								<form action="${ contextPath }/buyInfo/reDelInsert" method="post" id="inputReDeliveryForm">
								<div id="inputReDeliveryInfoArea">
									<b>반품 배송 정보 입력</b>
									<hr>
									<select class="form-select" id="selectDelCompany" name="company" style="font-size:1.1em;" required="required">
										<option style="display:none;" value="">배송업체 선택</option>
										<option value="CJ대한통운">CJ대한통운</option>
										<option value="우체국택배">우체국택배</option>
										<option value="로젠택배">로젠택배</option>
										<option value="한진택배">한진택배</option>
										<option value="롯데택배">롯데택배</option>
										<option value="편의점택배">편의점택배</option>								
									</select>
									<input type="text" class="form-control" placeholder="송장번호를 입력해 주세요" id="inputInvoiceNo" name="invoice" style="font-size:1.1em;" required>
									<input type="hidden" name="dealNo" value="${ buyInfo.dealNo }">
									<input type="hidden" name="goodsNo" value="${ buyInfo.goodsNo }">
									<input type="hidden" name="type" value="반품">
									<div id="delInfoButtonArea">
										<button type="submit" class="btn btn-secondary btn-sm">발송완료</button>
									</div>
								</div>
								</form>								
								<hr><br><br><br>
								</c:when>
								<c:otherwise>
								<form action="${ contextPath }/buyInfo/reDelUpdate" method="post" id="inputDeliveryForm">
									<div id="inputDeliveryInfoArea">
										<b>반품 배송 정보 수정</b>
										<hr>
										<select class="form-select" id="selectDelCompany" name="company" style="font-size:1.1em;" required="required">
											<option value="CJ대한통운" ${reDelInfo.company eq "CJ대한통운" ? "selected":""}>CJ대한통운</option>
											<option value="우체국택배" ${reDelInfo.company eq "우체국택배" ? "selected":""}>우체국택배</option>
											<option value="로젠택배" ${reDelInfo.company eq "로젠택배" ? "selected":""}>로젠택배</option>
											<option value="한진택배" ${reDelInfo.company eq "한진택배" ? "selected":""}>한진택배</option>
											<option value="롯데택배" ${reDelInfo.company eq "롯데택배" ? "selected":""}>롯데택배</option>
											<option value="편의점택배" ${reDelInfo.company eq "편의점택배" ? "selected":""}>편의점택배</option>
										</select>
										<input type="text" class="form-control" id="inputInvoiceNo" name="invoice" style="font-size:1.1em;" value="${ reDelInfo.invoice }" required>
										<input type="hidden" name="delNo" value="${ reDelInfo.delNo }">
										<input type="hidden" name="goodsNo" value="${ buyInfo.goodsNo }">
										<div id="delInfoButtonArea">
											<button type="submit" class="btn btn-secondary btn-sm">수정완료</button>
										</div>
									</div>
								</form>								
								<hr><br><br><br>
								</c:otherwise>
							</c:choose>													
						</c:if>
						<c:if test="${buyInfo.progress eq '환불예정'}">
						<div id="inputDeliveryInfoArea">
							<b>반품 배송 정보</b>
							<hr>
								<select class="form-select" id="selectDelCompany" style="font-size:1.1em;" disabled="disabled">
									<option value="CJ대한통운" ${reDelInfo.company eq "CJ대한통운" ? "selected":""}>CJ대한통운</option>
									<option value="우체국택배" ${reDelInfo.company eq "우체국택배" ? "selected":""}>우체국택배</option>
									<option value="로젠택배" ${reDelInfo.company eq "로젠택배" ? "selected":""}>로젠택배</option>
									<option value="한진택배" ${reDelInfo.company eq "한진택배" ? "selected":""}>한진택배</option>
									<option value="롯데택배" ${reDelInfo.company eq "롯데택배" ? "selected":""}>롯데택배</option>
									<option value="편의점택배" ${reDelInfo.company eq "편의점택배" ? "selected":""}>편의점택배</option>
								</select>
							<input type="text" class="form-control" id="inputInvoiceNo" style="font-size:1.1em;" value="${ reDelInfo.invoice }" readonly>
						</div>
						<hr><br><br><br>
						</c:if>																	
						
						<div id="paymentInfoArea">
							<b>결제정보</b>
							<hr>
							<table class="table" id="paymentInfoTable">
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
						<br><br><br><br>
						
						<div id="toListArea">
							<button type="button" class="btn btn-success btn-sm" id="toListBtn" onclick="location.href='${ contextPath }/buyInfo/list'">목록</button>
						</div>       
					</div>
					
					<!-- modal -->
					<form action="${ contextPath }/buyInfo/returnInsert" method="post">
					<div id="modalArea">
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" id="modalHeader">
										<h5 class="modal-title" id="staticBackdropLabel">반품 신청</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<br>
									<div class="modal-body">
										<ul>
											<li>판매자와 사전 협의 없이 반품할 경우 환불 처리가 지연될 수 있습니다.</li>
											<li>물품은 판매자 정보를 확인 후 발송해 주세요.</li>
											<li>기타 궁금한 점이 있으면 문의해 주세요.</li>
										</ul><hr><br>
										<h6>반품 사유를 선택해 주세요.</h6>
										<br>
										<div id="selectReasonArea">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="content" id="omission" value="구성품, 제품 누락" checked>
												<label class="form-check-label" for="omission">구성품, 제품 누락</label>                                                       
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="content" id="breakage" value="제품 하자, 파손">
												<label class="form-check-label" for="breakage">제품 하자, 파손</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="content" id="misdelivery" value="오배송">
												<label class="form-check-label" for="misdelivery">오배송</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="content" id="changeofmind" value="변심">
												<label class="form-check-label" for="changeofmind">변심</label>
											</div>
											<div class="form-check">
												<input class="form-check-input" type="radio" name="content" id="etc" value="기타">
												<label class="form-check-label" for="etc">기타</label>
											</div>
											<div>
												<textarea class="form-control" id="reasonTextArea" name="dcontent"></textarea>				
											</div>
											<br>
										</div>
										<hr><br>
										<h6>발송 방법을 선택해 주세요.</h6>
										<br>
										<div id="selectDelOptionArea">
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="delType" id="safetyTransaction" value="안전거래" checked>
												<label class="form-check-label" for="safetyTransaction">안전거래</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="delType" id="directTransaction" value="직거래">
												<label class="form-check-label" for="directTransaction">직거래</label>
											</div>
										</div>
										<hr><br>
										<div id="expectedPayment">
											환불 예정 금액&nbsp;&nbsp;&nbsp;<h5 id="payment"><fmt:formatNumber value="${ payInfo.price }" groupingUsed="true"/>원</h5>
										</div>                                                                                                                  
									</div>
								<br>
								<div class="modal-footer" id="modalBtnArea">
									<button type="submit" class="btn btn-secondary btn-sm">신청</button> &nbsp;&nbsp;
									<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>                       
								</div>
								<br>
								<input type="hidden" value="${ buyInfo.goodsNo }" name="goodsNo">
								<input type="hidden" value="${ buyInfo.dealNo }" name="dealNo">
								</div>
							</div>
						</div>
					</div>
					</form>															
					<!-- 내용 end -->				
				</div>
			</div>									
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function purchaseDecision(dealNo){
			var yn = confirm("구매확정 이후에는 반품이 불가하므로 반드시 상품을 받으신 후 진행해 주세요.\n\n구매확정을 진행하시겠습니까?");
			if(yn == true){
				location.href = '${contextPath}/buyInfo/decisionUpdate?dealNo=' + dealNo + '&goodsNo=${buyInfo.goodsNo}';
			}
		}
	</script>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>