<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<jsp:include page="../common/menubar.jsp"/>
    <!-- 자바스크립트-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- Font Awesome5 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <title>메뉴바</title>
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

    .marketTitle {
        font-size: 30px;
        font-weight: 700;
    }

    .priceBound {
        display: inline-block;
    }

    .priceDiv {
        width: 350px;

    }

    .price1{
        padding: 10px;      
        margin: 10px;
        height: 30px;
        font-size: 13px;
        
    }

    .pricep{
        padding-top: 0px;
        margin: auto;
       
    }

    .searchDiv {
        padding: 0px;

    }
    
    .category {
        padding-left: 60px;
    }

    .caColor {
        border: 1px solid #56CE7C;
        color: black;
    }
    
    .goodsTable {
    	font-family: 'Noto Sans KR', sans-serif;
    	font-weight: 500;
    }
    
    .listTr {
    	height: 150px;
    }
    
    .thumbnail {
    	width: 200px;
    	height: 150px;
    }
    
    .pagingTd{
    	text-align: center;
    	padding: 30px;
    }
    
    .pagingbar {
    	height: 50px;
    	border-bottom: none 0px white;
    	padding: 30px;
    }
   
   .textTd {
	   text-align: center;
	   margin : 10px;
	   display: inline-block;
	   
   }
   
   .price { 
   		display: inline-block;
   		float: right;
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
                        <li><a href="${ contextPath }/goods/list" class="list-group-item list-group-item-action sideContent" style="background-color:#f1f3f5;">물품 검색</a></li>
                        <li><a href="${ contextPath }/goods/ginsertpage" class="list-group-item list-group-item-action sideContent">물품 등록</a></li>
                        <li><a href="${ contextPath }/goods/cartPage" class="list-group-item list-group-item-action sideContent">장바구니</a></li>
                    </ul>
                </div>
            </div>
            <!-- 내용 -->
            <div class="col-md-8 content">
                <div class="main-div">
                    <!-- Market-->
                    <div class="goodsListTitle">
                        <p class="marketTitle">Market</p>
                        <br><hr><br>
                    </div>
                    <div class="category">
                        <button type="button" class="btn btn-outline-success seeAll">ALL</button>
                        &nbsp;
                        <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                            <input type="checkbox" class="btn-check caBtn" id="com1" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="com1">삼성</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="com2" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="com2">애플</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="com3" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="com3">기타</label>
                          </div>
                          &nbsp;
                          <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                            <input type="checkbox" class="btn-check caBtn" id="tel1" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="tel1">SKT</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="tel2" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="tel2">KT</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="tel3" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="tel3">LGU+</label>
                          </div>
                          &nbsp;
                          <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                            <input type="checkbox" class="btn-check caBtn" id="sta1" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="sta1">상태 상</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="sta2" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="sta2">상태 중</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="sta3" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="sta3">상태 하</label>
                          </div>
                          
                          <br><br>
                          &nbsp;
                          <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                            <input type="checkbox" class="btn-check caBtn" id="pri1" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="pri1">~30만</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="pri2" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="pri2">30만~50만</label>
                          
                            <input type="checkbox" class="btn-check caBtn" id="pri3" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="pri3">50만~80만</label>

                            <input type="checkbox" class="btn-check caBtn" id="pri4" autocomplete="off">
                            <label class="btn btn-outline-success caColor" for="pri4">80만~</label>
                          </div>
                          &nbsp;&nbsp;
                         <div class="priceBound">
                            <div class="input-group mb-3 searchDiv">
                                <input type="text" class="form-control caColor" aria-label="Recipient's username" aria-describedby="button-addon2">
                                <button class="btn btn-outline-success caColor" type="button" id="button-addon2">검색</button>
                            </div>
                        </div>
                    </div>
					<br><hr><br>
                    <div class="listArea">
                        <div class="table-responsive">
							  <table class="table align-top goodsTable">
							    <thead>
							      <tr>
							       	<th colspan="6">총 물품 수 : ${ pi.listCount }건 </th>
							      </tr>
							    </thead>
							    <tbody>
							    	<c:forEach items="${ list }" var="g" varStatus="status">
							    		<c:forEach items="${ attList }" var="a">
							    			<c:if test="${ g.goodsNo eq a.goodsNo && a.gaOrder eq 1}">
							    				 <tr class="listTr" onclick="goodsDatail(${ g.goodsNo });">
											      	<td class="align-bottom" colspan="2"><img src="${ contextPath }/resources/guploadFiles/${ a.gaRename }" class="thumbnail"></td>
											        <td class="align-middle" colspan="2" width="100%">
											         	<div class="textTd">${ g.goodsTitle }</div>
											         	<br>
											         	<div class="textTd">${ phoneNameList[status.index].proname } ${ phoneNameList[status.index].modelname }</div>

											         	<div class="textTd price">${ g.condition } &nbsp; ${ g.component }</div>
											         	<br>		
											         	<div class="textTd price">${ g.price }원</div>
											         	<div class="textTd">${ g.createDate }</div>																		        
											        </td>
											     </tr>
											     
											     
							    			 </c:if>
							    		</c:forEach>
								     	
									</c:forEach>
							      		<!-- 페이징 바 구간 -->
							      		
										<tr class="pagingbar">
										
											<td colspan="6" class="pagingTd">
											<!-- [이전] -->
											<c:if test="${ pi.currentPage <= 1 }">
												[이전] &nbsp;
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="/goods/list">
													<c:param name="page" value="${ pi.currentPage - 1 }"/>
												</c:url>
												<a href="${ before }">[이전]</a> &nbsp;
											</c:if>
											<!-- 페이지 숫자 -->
											<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												<c:if test="${ p eq pi.currentPage }">
													<font color="red" size="4"><b>[ ${ p } ]</b></font>
												</c:if>
												<c:if test="${ p ne pi.currentPage }">
													<c:url var="pagination" value="/goods/list">
														<c:param name="page" value="${ p }"/>
													</c:url>
													<a href="${ pagination }">${ p }</a> &nbsp;
												</c:if>
											</c:forEach>
											<!-- [다음] -->	
											<c:if test="${ pi.currentPage >= pi.maxPage }">
												[다음]
											</c:if>
											<c:if test="${ pi.currentPage < pi.maxPage }">
												<c:url var="after" value="/goods/list">
													<c:param name="page" value="${ pi.currentPage + 1 }"/>
												</c:url>
												<a href="${ after }">[다음]</a>
											</c:if>
											</td>
										</tr>
							    </tbody>
							  </table>
							</div>
                    </div>
                        
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            
            $(".seeAll").click(function(){
                $(".category").find("input").prop("checked", false);
            });

           
            
        });
        
        function goodsDatail(goodsNo){
        	location.href = '${contextPath}/goods/detail?goodsNo=' + goodsNo + '&page=${ pi.currentPage }';
        }
        
        

    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>