<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
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
            <h2>회원 로그인</h2>
            <hr>
          </div>
          <form id="Login" action="${ contextPath }/member/login" method="post">
    
          <div class="form-group">   
            <input class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요." required>
          </div>
        
          <div class="form-group">
            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요." required>
          </div>
                
          <button type="submit" class="btn btn-primary">Login</button>
          </form>
                
          <button class="btn btn-easyLogin">카카오로 로그인</button>
          <button class="btn btn-easyLogin">네이버로 로그인</button>
            
          <br><br>
          
          <div class="forgot">
          <br>
            <a href="${ contextPath }/member/joinPage">회원가입</a> |
            <a href="" id="searchMemberOpen">아이디/비밀번호 찾기</a>
          </div>

        </div>
      </div>
    </div>
    <script>
    	document.getElementById("searchMemberOpen").onclick = function() {
    		window.open('${ contextPath }/member/searchMemberPage', 'popup2', 'width=800, height=450');
    	}
    
    
    </script>   
</body>
</html>