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
	
	b{
		margin-left: 50px;
		font-size: 1.2em;
	}
	
	#searchArea{
		border: 3px solid lightgray;
		border-radius: 10px;
		text-align: center;
		padding: 25px;
		margin-bottom: 50px;
	}
	h6{
		display: inline-block;
		padding: 10px;
	}
	#searchInput{
		width: 280px;
		display: inline-block;
		margin: 10px;
	}
	#insertBtn{
		margin: 10px;
	}
	
	#interestlistTable{
		text-align: center;
		vertical-align: middle;
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
						<form action="" method="get" id="itdInputForm">
						<div id="headerArea">
							<b>관심상품</b>
							<hr>
							<div id="searchArea">
								<h6>모델명</h6>
								<input type="text" class="form-control form-control-sm" placeholder="제품명을 입력해 주세요" id="searchInput" name="">
								<button type="button" class="btn btn-secondary btn-sm" id="insertBtn" onclick="">등록</button>
							</div>
						</div>
						</form>
						<div id="BodyArea">
							<table class="table" id="interestlistTable">
								<tr>
									<th class="table-secondary">제조사</th>
									<th class="table-secondary">통신사</th>
									<th class="table-secondary">제품명</th>
									<th class="table-secondary">모델명</th>
									<th class="table-secondary">등록일</th>
									<th class="table-secondary"></th>
								</tr>
								
								<c:if test="${ itdProdList.isEmpty() }">
								<tr>
									<td colspan="6">지금 관심상품을 등록해 보세요 :)</td>
								</tr>
								</c:if>
								
								<c:forEach items="${ itdProdList }" var="ip">
								<tr>
									<td>${ ip.maker }</td>
									<td>${ ip.carrName }</td>
									<td>${ ip.productName }</td>
									<td>${ ip.modelName }</td>
									<td>${ ip.enrollDate }</td>
									<td>
										<button class="btn btn-secondary btn-sm" onclick="">물품확인</button> &nbsp;&nbsp;
										<button class="btn btn-light btn-sm" onclick="deleteItd(${ip.itdNo})">삭제</button>
									</td>									
								</tr>	
								</c:forEach>						
							</table>
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
		function deleteItd(itdNo){
			var yn = confirm("정말 삭제하시겠습니까?");
			if(yn == true){
				location.href = '${contextPath}/itd/delete?itdNo=' + itdNo;
			}
		}
	</script>	

<!-- 부트스트랩 5.0 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</body>
</html>