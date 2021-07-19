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
<title>로그인</title>
<style>
.form-heading { color:#fff; font-size:23px;}
.panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
.panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
.login-form .form-control {
  background: #f7f7f7 none repeat scroll 0 0;
  border: 1px solid #d4d4d4;
  border-radius: 4px;
  font-size: 14px;
  height: 50px;
  line-height: 50px;
}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 10px auto 30px;
  max-width: 38%;
  padding: 50px 70px 70px 71px;
}

.login-form .form-group {
  margin-bottom:10px;
}
.login-form{ text-align:center;}
.forgot a {
  color: #777777;
  font-size: 14px;
  text-decoration:none;
}
.login-form  .btn.btn-primary {
  background: #198754 none repeat scroll 0 0;
  border-color: #198754;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}
.login-form  .btn.btn-easyLogin {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 50%;
  height: 50px;
  line-height: 50px;
  margin-top: 10px;
  padding: 0;
  float: left;
}
.forgot {
  text-align: center;   
}

.login-form .btn.btn-primary.reset {
  background: #ff9900 none repeat scroll 0 0;
}
.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="container">
      <div class="login-form">
        <div class="main-div">
          <div class="panel">
            <h2><b>회원 로그인</b></h2>
            <hr>
          </div>
          <form id="Login" action="${ contextPath }/member/login" method="post">
    
          <div class="form-group">   
            <input class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요." required>
          </div>
        
          <div class="form-group">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요." required>
          </div>
                
          <button type="submit" class="btn btn-primary">로그인 하기</button>
          </form>
          <div id="naver_id_login" class="form-group" style="margin-top: 10px; background-color:#03C75A;" onclick="loginWithNaver();">
    	      	<img id="naver_id_login" src="${ contextPath }/resources/images/btnG_완성형.png" style="width: 70%; cursor: pointer;">
          </div>
                
          <div class="forgot">
            <a href="${ contextPath }/member/joinPage">회원가입</a> |
            <a href="" id="searchMemberOpen">아이디/비밀번호 찾기</a>
          </div>

        </div>
      </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	document.getElementById("searchMemberOpen").onclick = function() {
    		window.open('${ contextPath }/member/searchMemberPage', 'popup2', 'width=800, height=450');
    	}
    	
    	// 네이버 로그인 버튼 클릭
        function loginWithNaver() {
            $.ajax({
                url: '${ contextPath }/member/getNaverAuthUrl',
                type: 'get',
                async: false,
                dataType: 'text',
                success: function (res) {
                    location.href = res;
                }
            });
        }
    	
    	
    	/* document.getElementById("naver_id_login").onclick = function() {
    		console.log('${url}');
    		window.open('${url}', 'popup2', 'width=800, height=450');
    	} */
    </script>   
</body>
</html>