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
	
	#toListArea, #returnBtnArea {
		text-align: center;
	}
	#toListBtn {
		width: 100px;
		margin-bottom: 50px;
	}
	
	#calInfoTable {
		width: 65%;
		height: 340px;
		margin: auto;
	}
	#calInfoTable th, #calInfoTable td {
		vertical-align: middle;
	}
	#calInfoTable th {
		width: 40%;
	}
	
	#updateCalInfoBtn {
		float: right;
		margin-right: 20px;
	}	
	
	/* modal */
	#modalHeader {
		height: 80px;
	}
	#staticBackdropLabel {
		font-weight: bold;
		margin-left: 160px;
	}
	
	h5 {
		display: inline-block;
	}
	
	#modalArea {
		font-size: 0.9em;
	}
	
	#insertCalInfoTable {
		width: 80%;
		margin: auto;
	}
	#insertCalInfoTable th, #expectedPayment {
		text-align: center;
		vertical-align: middle;
	}
	
	#insertCalInfoTable th {
		width: 35%;
	}
	
	#modalBtnArea {
		display: inline-block;
		margin-left: 170px;
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
						<li><a href="${ contextPath }/member/myPage" class="list-group-item list-group-item-action sideContent">회원 정보</a></li>
						<li><a href="${ contextPath }/member/myBoardList" class="list-group-item list-group-item-action sideContent">나의 게시글</a></li>
						<li><a href="${ contextPath }/member/myReplyList" class="list-group-item list-group-item-action sideContent">나의 댓글</a></li>
					</ul>
				</div>
				<div class="list-group col-md-10 sideBar">
					<ul>
						<li class="list-group-item sideTitle">쪽지함</li>
						<li><a href="${ contextPath }/message/selectList?type=받은 쪽지함" class="list-group-item list-group-item-action sideContent">받은 쪽지함</a></li>
						<li><a href="${ contextPath }/message/selectList?type=보낸 쪽지함" class="list-group-item list-group-item-action sideContent">보낸 쪽지함</a></li>
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
						<br>
						
						<c:if test="${ sellInfo.progress == '반품요청' }">
						<div id="returnBtnArea">
							<button type="button" class="btn btn-secondary btn-sm" onclick="returnApproval(${sellInfo.dealNo});">반품승인</button> &nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" onclick="returnRefusal(${sellInfo.dealNo})">반품거부</button>
						</div>	
						</c:if>						
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
						
						<c:choose>
							<c:when test="${ delInfo != null }">
								<c:choose>
									<c:when test="${sellInfo.progress eq '배송준비(결제완료)' or sellInfo.progress eq '배송'}">
									<form action="${ contextPath }/sellInfo/delUpdate" method="post" id="inputDeliveryForm">
									<div id="inputDeliveryInfoArea">
										<b>배송 정보 수정</b>
										<hr>
										<select class="form-select" id="selectDelCompany" name="company" style="font-size:1.1em;" required="required">
											<option value="CJ대한통운" ${delInfo.company eq "CJ대한통운" ? "selected":""}>CJ대한통운</option>
											<option value="우체국택배" ${delInfo.company eq "우체국택배" ? "selected":""}>우체국택배</option>
											<option value="로젠택배" ${delInfo.company eq "로젠택배" ? "selected":""}>로젠택배</option>
											<option value="한진택배" ${delInfo.company eq "한진택배" ? "selected":""}>한진택배</option>
											<option value="롯데택배" ${delInfo.company eq "롯데택배" ? "selected":""}>롯데택배</option>
											<option value="편의점택배" ${delInfo.company eq "편의점택배" ? "selected":""}>편의점택배</option>
										</select>
										<input type="text" class="form-control" id="inputInvoiceNo" name="invoice" style="font-size:1.1em;" value="${ delInfo.invoice }" required>
										<input type="hidden" name="delNo" value="${ delInfo.delNo }">
										<input type="hidden" name="goodsNo" value="${ sellInfo.goodsNo }">
										<div id="delInfoButtonArea">
											<button type="submit" class="btn btn-secondary btn-sm">수정완료</button>
										</div>
									</div>
									</form>
									<hr><br><br><br>
									</c:when>
									<c:otherwise>
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
									</c:otherwise>
								</c:choose>							
							</c:when>
							<c:otherwise>							
							<form action="${ contextPath }/sellInfo/delInsert" method="post" id="inputDeliveryForm">
							<div id="inputDeliveryInfoArea">
								<b>배송 정보 입력</b>
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
								<input type="hidden" name="dealNo" value="${ sellInfo.dealNo }">
								<input type="hidden" name="goodsNo" value="${ sellInfo.goodsNo }">
								<input type="hidden" name="type" value="판매">
								<div id="delInfoButtonArea">
									<button type="submit" class="btn btn-secondary btn-sm">발송완료</button>
								</div>
							</div>
							</form>
							<hr><br><br><br>
							</c:otherwise>
						</c:choose>												
						
						<c:if test="${sellInfo.progress eq '반품요청' or sellInfo.progress eq '환불예정'}">
							<c:choose>
								<c:when test="${ reDelInfo == null }">
								<div>
									<b>반품 배송 정보</b><hr>
									<p style="font-size: 1em; text-align: center;">아직 택배가 출발하지 않았어요. 조금만 기다려 주세요.</p>
								</div><hr><br><br><br>
								</c:when>
								<c:otherwise>
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
								</c:otherwise>
							</c:choose>													
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
									<td>계좌이체</td>
									<td><fmt:formatNumber value="${ payInfo.deliveryFee }" groupingUsed="true"/>원</td>
									<td><fmt:formatNumber value="${ payInfo.price + payInfo.deliveryFee }" groupingUsed="true"/>원</td>
								</tr>               
							</table>
						</div>
						<br><br><br><br>
						
						<c:if test="${ sellInfo.progress == '구매결정완료' }">
						<div id="calInfoArea">
							<b>정산정보</b>						
							<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="updateCalInfoBtn">
							 	정산정보수정
							</button>
							<hr><br>
							<table class="table" id="calInfoTable">
								<tr>
									<th class="table-secondary">예금주명</th>
									<td>${ calInfo.userName }</td>
								</tr>
								<tr>
									<th class="table-secondary">연락처</th>
									<td>${ calInfo.phone }</td>
								</tr>
								<tr>
									<th class="table-secondary">입금은행</th>
									<td>${ calInfo.sbank }</td>
								</tr>
								<tr>
									<th class="table-secondary">계좌번호</th>
									<td>${ calInfo.saccount }</td>
								</tr>
								<tr>
									<th class="table-secondary">판매 금액</th>
									<td><fmt:formatNumber value="${ calInfo.price }" groupingUsed="true"/>원</td>
								</tr>
								<tr>
									<th class="table-secondary">수수료</th>
									<td><fmt:formatNumber value="${ calInfo.price * 0.05 }" groupingUsed="true"/>원</td>
								</tr>
								<tr>
									<th class="table-secondary">입금 예정 금액</th>
									<td><fmt:formatNumber value="${ calInfo.price - calInfo.price * 0.05 }" groupingUsed="true"/>원</td>
								</tr>
							</table>							
						</div>
						<br><br><br>
						</c:if>
						<c:if test="${ sellInfo.progress == '거래완료' }">
						<div id="calInfoArea">
							<b>정산정보</b>
							<hr><br>
							<table class="table" id="calInfoTable">
								<tr>
									<th class="table-secondary">예금주명</th>
									<td>${ calInfo.userName }</td>
								</tr>
								<tr>
									<th class="table-secondary">연락처</th>
									<td>${ calInfo.phone }</td>
								</tr>
								<tr>
									<th class="table-secondary">입금은행</th>
									<td>${ calInfo.sbank }</td>
								</tr>
								<tr>
									<th class="table-secondary">계좌번호</th>
									<td>${ calInfo.saccount }</td>
								</tr>
								<tr>
									<th class="table-secondary">판매 금액</th>
									<td><fmt:formatNumber value="${ calInfo.price }" groupingUsed="true"/>원</td>
								</tr>
								<tr>
									<th class="table-secondary">수수료</th>
									<td><fmt:formatNumber value="${ calInfo.price * 0.05 }" groupingUsed="true"/>원</td>
								</tr>
								<tr>
									<th class="table-secondary">정산 금액</th>
									<td><fmt:formatNumber value="${ calInfo.price - calInfo.price * 0.05 }" groupingUsed="true"/>원</td>
								</tr>
							</table>							
						</div>
						<br><br><br>
						</c:if>
						
						<div id="toListArea">
							<button type="button" class="btn btn-success btn-sm" id="toListBtn" onclick="location.href='${ contextPath }/sellInfo/list'">목록</button>
						</div>       
					</div>
					
					<!-- modal -->
					<div id="modalArea">
						<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header" id="modalHeader">
										<h5 class="modal-title" id="staticBackdropLabel">정산 정보 수정</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<br>
									<form action="${ contextPath }/sellInfo/calUpdate" method="post">
									<div class="modal-body">
										<ul>
											<li>구매자가 물품 확인 후 구매결정을 하면 판매 대금이 지급됩니다.</li>
											<li>기타 궁금한 점이 있으면 문의해 주세요.</li>
										</ul><hr><br>
										<table class="table" id="insertCalInfoTable">
											<tr>
												<th class="table-secondary">예금주명</th>
												<td>${ calInfo.userName }</td>
											</tr>
											<tr>
												<th class="table-secondary">연락처</th>
												<td>${ calInfo.phone }</td>
											</tr>			
											<tr>
												<th class="table-secondary">입금은행</th>
												<td>
													<select class="form-select form-select-sm" required="required" name="sbank">
														<option value="국민은행" ${calInfo.sbank eq "국민은행" ? "selected":""}>국민은행</option>
														<option value="신한은행" ${calInfo.sbank eq "신한은행" ? "selected":""}>신한은행</option>
														<option value="기업은행" ${calInfo.sbank eq "기업은행" ? "selected":""}>기업은행</option>
														<option value="우리은행" ${calInfo.sbank eq "우리은행" ? "selected":""}>우리은행</option>
														<option value="하나은행" ${calInfo.sbank eq "하나은행" ? "selected":""}>하나은행</option>
														<option value="NH농협" ${calInfo.sbank eq "NH농협" ? "selected":""}>NH농협</option>
														<option value="카카오뱅크" ${calInfo.sbank eq "카카오뱅크" ? "selected":""}>카카오뱅크</option>
														<option value="케이뱅크" ${calInfo.sbank eq "케이뱅크" ? "selected":""}>케이뱅크</option>
													</select>
												</td>
											</tr>
											<tr>
												<th class="table-secondary">계좌번호</th>
												<td><input type="text" class="form-control form-control-sm" value="${ calInfo.saccount }" name="saccount"></td>
											</tr>					
											<tr>
												<th class="table-secondary">판매 금액</th>
												<td><fmt:formatNumber value="${ calInfo.price }" groupingUsed="true"/>원</td>
											</tr>
											<tr>
												<th class="table-secondary">수수료</th>
												<td><fmt:formatNumber value="${ calInfo.price * 0.05 }" groupingUsed="true"/>원</td>
											</tr>
										</table>
										<input type="hidden" value="${ calInfo.goodsNo }" name="goodsNo">
										<br><hr><br>
										<div id="expectedPayment">
											입금 예정 금액&nbsp;&nbsp;&nbsp;<h5><fmt:formatNumber value="${ calInfo.price - calInfo.price * 0.05 }" groupingUsed="true"/>원</h5>
										</div>
										<br>
									</div>                    
									<div class="modal-footer" id="modalBtnArea">
										<button type="submit" class="btn btn-secondary btn-sm">확인</button> &nbsp;&nbsp;
										<button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>                       
									</div>																	
									<br><br>
									</form>
								</div>
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
		function returnApproval(dealNo){
			var yn = confirm("반품 승인 시 자동으로 환불이 진행됩니다.\n승인하시겠습니까?");
			if(yn == true){
				location.href = '${contextPath}/sellInfo/refundUpdate?dealNo=' + dealNo + '&goodsNo=${sellInfo.goodsNo}';
			}
		}
	</script>
	
	<script>
		function returnRefusal(dealNo){
			var yn = confirm("반품 거부를 진행하시겠습니까?");
			if(yn == true){
				location.href = '${contextPath}/sellInfo/holdUpdate?dealNo=' + dealNo + '&goodsNo=${sellInfo.goodsNo}';
			}
		}
	</script>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>