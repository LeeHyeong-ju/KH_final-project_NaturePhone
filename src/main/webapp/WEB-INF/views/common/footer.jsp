<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
	.footerArea {
		padding-bottom: 50px;
	}

	#footerHeader {
		background: #F2F2F2;
	}
	
	#footerHeaderTable, #footerContentTable {
		margin: auto;
		text-align: center;
	}
	
	#footerHeaderTable td {
		cursor: pointer;
		font-size: 0.9em;
		padding: 8px 15px 8px 15px;
		font-weight: bold;
		color: rgb(80, 80, 80);
	}
	
	#footerContentTable {
		font-size: 0.8em;
		margin-top: 20px;
	}
	#footerContentTable td {
		padding: 0px 10px 3px 10px;
	}
</style>
</head>
<body>
	<div class="footerArea">
		<div id="footerHeader">
			<table id="footerHeaderTable">
				<tr>
					<td>이용약관</td>
					<td>개인정보처리방침</td>
					<td>영상정보처리기기방침</td>
					<td>이메일무단수집거부</td>
				</tr>
			</table>
		</div>
		<div>
			<table id="footerContentTable">
				<tr>
					<td>NATURE PHONE</td>
					<td>대표 : 우별림</td>
					<td>고객센터 : 1544-9970 (평일 09:00~12:00/13:00~17:30)</td>
				</tr>
				<tr>
					<td colspan="2">사업자등록번호 : 128-00-00000</td>
					<td>서울특별시 강남구 테헤란로 10길 9 그랑프리빌딩 7F</td>
				</tr>
				<tr>
					<td colspan="3">Copyright ⓒ 1989-2021 NaturePhone All Right Reserved</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>