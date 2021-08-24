# 🌱 NaturePhone (중고폰 거래 사이트)


## 목차
1. [프로젝트 소개](#프로젝트-소개)
2. [담당 기능 구현 화면](#담당-기능-구현-화면)
3. [패키지별 구현 기능](#패키지별-구현-기능)
4. [기능 구현의 고민점과 해결 과정](#기능-구현의-고민점과-해결-과정)

## 프로젝트 소개
- 기획 의도
> 새 휴대폰을 만드는 과정에서 막대한 자원과 에너지가 들어간다는 것을 알고 계신가요?  
> 부품과 완성품이 이동하는 과정에서 이산화탄소와 미세먼지가 발생하며, 휴대폰 생산에 꼭 필요한 희귀 금속들은 생태계를 위협한다고 합니다.  
> 실례로 휴대폰 부품에 꼭 필요한 희귀금속인 콜탄은, 광산의 위치가 고릴라의 서식지와 거의 겹쳐있기 때문에 이 금속을 채굴하는 과정에서 서식지 파괴나 무분별한 사냥등으로 인해 고릴라가 멸종위기에 처해 있습니다.  
> 따라서 새로운 휴대폰을 구입하기보다 중고폰을 사용하여 휴대폰의 교체시기를 늘리는 것이 여러모로 환경 보호에 도움이 된다고 합니다.
>
> 또한 빠르게 발전했던 스마트폰 성능이 정체기에 접어들면서 사용자가 체감하는 스마트폰 성능과 디자인이 평준화 되었고, 
> 번개장터 · 당근마켓 · 중고나라 등 중고매매 플랫폼이 늘어나면서 중고거래에 대한 인식이
> 개선되어 중고폰 시장이 커지고 있습니다.
>
> 저희는 이와같이 환경적인 부분과 중고폰 시장이 급성장 하고있는 점에서 아이디어를 얻어
> 중고폰 거래 사이트인 네이처폰을 기획하게 되었습니다.  

- 참고 사이트 : 세티즌 https://www.cetizen.com
- ERD : https://www.erdcloud.com/d/TaMuGbzETtf6HtD6z
- 참여 인원 : 5명 (참여도 : 100% / 기여도 : 30%)
- 주요 기능 및 담당 역할(✔)

|✔계정관리|✔마이페이지1|마이페이지2|마켓|커뮤니티|편의기능|서비스|관리자|✔기타|
|---|---|---|---|---|---|---|---|---|
|<pre style="font-size:10px">로그인<br>회원가입<br>아이디찾기<br>비밀번호 찾기</pre>|<pre style="font-size:10px">회원정보 수정<br>비밀번호 변경<br>회원 탈퇴<br>나의 게시글 조회<br>나의 댓글 조회<br>쪽지함</pre>|<pre style="font-size:10px">나의 판매내역<br>나의 구매내역<br>관심상품<br>거래진행상태<br>반품/취소</pre>|<pre style="font-size:10px">물품검색<br>물품등록<br>장바구니</pre>|<pre style="font-size:10px">모바일뉴스<br>자유게시판<br>회원설문</pre>|<pre style="font-size:10px">사양비교</pre>|<pre style="font-size:10px">공지사항</pre>|<pre style="font-size:10px">회원관리<br>게시글관리<br>신고관리</pre>|<pre style="font-size:10px">쪽지보내기<br>신고하기</pre>|

- 개발 일정 : 2021년 5월 21일 ~ 6월 18일
- 개발 환경
  - Language : Java 8, HTML5, CSS, JavaScript
  - OS : Window 10
  - IDE : Eclipse, SQL developer, Visual Studio Code
  - Framework : Spring Tool Suite(STS), MyBatis, JDBC 8.0
  - SDK : JDK 1.8, JSP
  - RDBMS : Oracle
  - Server : Apache Tomcat 8.5
  - Library : jQuery, Ajax, Bootstrap 5, Scribe OpenSource OAuth Java Library, Spring Security, Apache Commons-Email
  - API : 다음 주소 API
  - 협업 도구 : GitHub, Slack
------------

## 담당 기능 구현 화면
**1. 로그인 페이지**
> ![로그인](https://user-images.githubusercontent.com/75263831/127144878-53197978-14f4-4993-a89c-b245fbb7c833.png)<br><br>  

**2. 회원가입** 
 
> - 회원 가입 1단계 : 약관 동의 페이지
>  
> ![007](https://user-images.githubusercontent.com/75263831/126876033-03ec65a8-a999-4a42-bf65-84ba02dc4350.png)<br><br>  
>
> - 회원 가입 2단계 : 사용자 정보 입력 페이지
>   - Spring Security 라이브러리 사용 : 회원 가입 시 비밀번호를 암호화  
>   - Apache Commons Email 라이브러리 사용 : 회원 가입 중 이메일을 인증하기 위해 사용  
>  
> ![008](https://user-images.githubusercontent.com/75263831/126876036-3bb45395-ab0e-4c79-a055-ab868118ce3a.png)<br><br>  


**3. 아이디 찾기 / 비밀번호 찾기 페이지**
> ![아이디,비밀번호 찾기](https://user-images.githubusercontent.com/75263831/127117195-7a36db3e-6e16-4853-8947-c31eb1a6a60d.png)<br><br>  

**4. 회원정보 페이지**
> ![회원정보](https://user-images.githubusercontent.com/75263831/127156355-d92e42d8-ea13-40ef-aa22-08f1c4bb9acf.png)
> - 비밀번호 변경
> ![비밀번호 변경](https://user-images.githubusercontent.com/75263831/127156382-422406bd-ec58-4376-bf5b-359447b53982.png)
> - 회원 탈퇴
> ![탈퇴하기](https://user-images.githubusercontent.com/75263831/127156394-fb36736d-eab9-4156-a3e3-4c3d5afe5926.png)

**5. 나의 게시글 / 나의 댓글 페이지**
> ![나의게시글나의댓글](https://user-images.githubusercontent.com/75263831/127359611-f52afeec-31b0-44cd-ac3b-5252d7ade0e8.png)<br><br>  

**6. 쪽지 기능**
> - 쪽지보내기
> ![쪽지보내기](https://user-images.githubusercontent.com/75263831/127359693-863f7f39-8c90-424e-a984-d339574253f4.png)
> - 보낸 쪽지함
> ![보낸쪽지함](https://user-images.githubusercontent.com/75263831/127359730-225f6a83-7d09-439b-8116-f80e51295406.png)  
> - 받은 쪽지함
> ![받은 쪽지함](https://user-images.githubusercontent.com/75263831/127359718-efa43aea-5710-4a54-83ea-5666b68f1ba5.png)


**7. 신고하기**
>![신고하기](https://user-images.githubusercontent.com/75263831/127026503-5f33ca0d-c1f6-4edb-812f-5918bc1dd004.png)<br><br>  


------------

## 패키지별 구현 기능  

1. com/kh/naturephone/admin : 관리자가 회원들을 관리(등급 변경, 강제 탈퇴, 게시글 관리)하는 패키지

2. com/kh/naturephone/boardFree : 자유 게시판의 CRUD 기능 패키지

3. com/kh/naturephone/boardMobile : 모바일뉴스 게시판의 CRUD 기능 패키지

4. com/kh/naturephone/boardSurvey : 회원 설문 게시판의 CRUD 기능 패키지

5. com/kh/naturephone/common : 공통 페이징 처리와 검색 기능 패키지

6. com/kh/naturephone/goods : 상품을 등록, 검색, 구매, 장바구니에 넣기 기능 패키지

7. **[com/kh/naturephone/member : 회원정보의 CRUD 관리와 사용자가 적은 게시글/댓글 조회 기능을 관리하는 패키지](./src/main/java/com/kh/naturephone/member)**
> - 로그인
>   - 사이트 자체 로그인
>   - 네이버 간편 로그인
> - 회원가입
>   - 아이디 중복 확인
>   - 이메일 중복 확인
>   - 이메일 인증, 이메일 인증키 입력 확인
> - 아이디 찾기(이메일 전송)
> - 비밀번호 찾기(이메일 전송)
> - 마이페이지
>   - 회원 정보 수정
>   - 비밀번호 변경
>   - 회원 탈퇴
>   - 나의 게시글 조회
>   - 나의 댓글 조회


8. **[com/kh/naturephone/message : 보낸 쪽지함과 받은 쪽지함, 쪽지 보내기와 쪽지 삭제를 관리하는 패키지](./src/main/java/com/kh/naturephone/message)**
> - 쪽지함
>   - 쪽지 상세
>   - 받은 쪽지함과 보낸 쪽지함의 페이징 처리
>   - 쪽지함 검색 (제목, 내용, 아이디), 키워드로 검색한 리스트의 페이징 처리
> - 쪽지 보내기
> - 쪽지 삭제


9. com/kh/naturephone/myPage2 : 사용자의 판매내역, 구매내역, 관심상품, 거래진행 상태, 반품/취소를 관리하는 패키지

10. com/kh/naturephone/notice : 공지사항 게시판의 CRUD 기능 패키지

11. **[com/kh/naturephone/report : 신고하기 기능을 관리하는 패키지](./src/main/java/com/kh/naturephone/report)**
> - 신고하기

12. com/kh/naturephone/support : 휴대폰 성능을 비교하는 기능을 관리하는 패키지

------------
## 기능 구현의 고민점과 해결 과정
<details markdown="1">
<summary>접기/펼치기</summary>  
<br>

**🚩 회원가입 중 이메일 인증**

회원가입 중 이메일 인증을 어떻게 접근해야 할지 고민하는 시간이 길어졌고, 구현 기간의 초반이여서 다른 기능들이 많이 남아있었다.  
따라서 일단 회원가입 후 인증할 수 있게 완성을 해두고 우선순위에 따라 다른 중요 기능들을 구현한 다음, 코드를 수정하여 기간 내에 기획했던대로 기능을 완성했다.


- 변경 전 : 회원가입 완료 → 이메일 발송 → 확인 버튼을 클릭하여 인증 →  로그인
> 
> 회원가입 후 이메일이 보내지고 인증 이메일 안의 확인 버튼을 누르면 memberApproval 메소드를 호출하여   
> 회원 인증상태인 APPROVAL_STATUS 컬럼을 'Y'로 update 하기.  
> 로그인 할 때 APPROVAL_STATUS 상태를 확인한 후 'N'가 아니라면 로그인이 가능. 
 
```java

@RequestMapping("/member")
public String memberLogin(@ModelAttribute Member m, Model model) {
  if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {

			if(loginUser.getApprovalStatus().equals("N")) {
				model.addAttribute("msg", "이메일 인증을 하신 후 로그인해주세요.");
				return "member/loginPage";
			} else {
				model.addAttribute("loginUser", loginUser);
				return "redirect:/";
			}
      
  } else {
		model.addAttribute("msg", "로그인에 실패하였습니다.");
		return "member/loginPage";
  }
}
```

- 변경 후 : 이메일 발송 → 인증키 입력 → 회원가입 완료 → 로그인
> controller에서 메일 인증을 요청 받으면 먼저 KeyPublish객체로 인증키를 생성하고 그 인증키를 session에 담음.  
> MailUtil 클래스의 sendMail 메소드를 호출하여 사용자가 입력한 이메일주소와 메일 제목, 내용을 매개변수에 대입하여 이메일을 보냄.  
> 메일을 확인하여 인증키를 입력하고, 그 값을 session값과 비교해서 일치하면 인증이 완료.

```java

// 3-1. 메일 인증 메소드 (Ajax)
@RequestMapping(value = "/joinSendMail", method = RequestMethod.POST)
@ResponseBody
public void joinSendMail(@ModelAttribute Member m, HttpSession session) throws Exception {
    
    // 인증키 생성
		String keyCode = KeyPublish.createKey();

		session.setAttribute("keyCode", keyCode);

		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "Nature Phone 회원가입 인증 코드입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<div style='font-size: 130%'>";
		msg += "회원가입 페이지에서 인증코드 <strong>";
		msg += keyCode + "</strong> 를 입력해 주세요.</div><br/>";

		MailUtil.sendMail(m.getEmail(), subject, msg);

}

// 3-2. 메일 인증키 확인 메소드(Ajax)
@RequestMapping(value = "/keyCheck", method = RequestMethod.POST)
@ResponseBody
public String keyCheck(@RequestParam("modalInput") String key, 
						   @SessionAttribute("keyCode") String keyCode) {
		
		if (key != null && key.equals(keyCode)) {
			return "success";
		} else {
			return "false";
		}
}
  
```


**🚩 쪽지 선택 삭제**

Q. 선택 된 쪽지들을 view단에서 어떻게 처리해서 controller단으로 넘길까?  
→ each() 메서드를 이용해 체크 된 값들을 찾아 차례로 배열에 담아 Ajax 통신으로 넘긴다.  

```java
// view
/*---------------- 삭제버튼 눌렀을 때 ----------------*/
		function deleteMessage(){
    		var type = "${ message.type }";	
    		var ckArr = [];					
        	$("input[name=checkRow]:checked").each(function(){
        		var chk = $(this).val();
        		ckArr.push(chk);
        	})
        		
        	// 쪽지가 선택 되지 않았을 때
        	if(ckArr.length == 0){
        		alert("삭제할 쪽지를 선택해주세요.");
        	
        	// 쪽지가 선택 되었다면
        	} else{
        		// 정말 삭제할 것인지 확인
	        	if(confirm("선택 된 쪽지를 삭제하시겠습니까?") == true) {
	        		$.ajax({
	        			type : 'POST',
	        			url : "${ contextPath }/message/delete",
	        			data:{ "ckArr" : ckArr, "type" : type },
	        			dataType: "text",
	                    success: function(data) {
	                    	if(data == 'success'){
	                    		location.reload();
	                        	alert("삭제가 완료되었습니다.");
	                    	} else {
	                    		alert("삭제 실패.");
	                    	}
	                    },
	                    error: function(e){
	                        alert("error code : " + e.status + "\n"
	                                + "message : " + e.responseText);
	                    }        
	        		});
	        	
	        	// 취소 버튼 눌렀을 때	페이지 reload
	        	} else {	
	        		location.reload(true);
	        	}
        	}
    	}
```


Q. controller로 들어온 배열을 어떻게 받아서 처리 해야할까?  
→ 배열은 @RequestParam(value="parameter이름[]")List&lt;String&gt; 형식으로 받아와야 한다.  
→ 여기서 배열에 들어있는 데이터는 쪽지고유번호, 즉 int형이므로 List&lt;Integer&gt;형으로 받아 왔다.  
→ ArrayList를 하나 선언하고(deleteArray) for문을 돌려서 받아온 쪽지고유번호를 하나하나 담는다.

```

// controller
// 4. 쪽지 삭제(Ajax)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody String messageDelete(@RequestParam(value="ckArr[]") List<Integer> deleteList,
											  @RequestParam(value="type") String type) {
		
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0; i < deleteList.size(); i++) {
			deleteArray.add(deleteList.get(i));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("deleteArray", deleteArray);
		
		int result = mService.messageDelete(map);
		
		if(result > 0) {
			return "success";
		} else {
			return "error";
		}
	}

```

Q. controller에서 전달한 여러개의 쪽지들을 DB에서 어떻게 삭제할까?  
→ 동적쿼리를 사용하기(Mybatis의 foreach문 사용).    
1. 먼저 리스트/배열 변수 값을 collection에 넣어주고, item이라는 설정으로 별칭 설정을 해준다.

2. 리스트/배열의 값이 시작하기 전 open="(" 이 설정돼있으므로'(' (열린 괄호)가 열리게 되고

3. 리스트/배열의 값이 한 번씩 반복문을 거칠 때마다 separator 옵션에 있는 ', '(콤마)가 찍히게 된다.

4. 반복이 끝나면 close=")" 설정이 있으므로 ')' (닫힌 괄호)가 쓰인다.
	
```
// Mapper
<!-- 5. 쪽지 삭제 -->
	<update id="messageDelete" parameterType="hashmap">
	<choose>
		<when test="type == '받은 쪽지함'">
		UPDATE		MESSAGE_TB
		SET 		SENDER_STATUS = 'N'
		WHERE 		MSG_NO IN
		<foreach collection="deleteArray" item="item" index="index" separator="," open="(" close=")">
		 #{ item }
		</foreach>
		</when>
		
		<when test="type == '보낸 쪽지함'">
		UPDATE		MESSAGE_TB
		SET 		RECIPIENT_STATUS = 'N'
		WHERE 		MSG_NO IN
		<foreach collection="deleteArray" item="item" index="index" separator="," open="(" close=")">
		 #{ item }
		</foreach>
		</when>
	</choose>
	</update>

```
	
</details>
