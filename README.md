# NaturePhone(중고폰 거래 사이트)

## [ 프로젝트 소개 ]
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
- 개발 환경 및 사용 기술
  - 개발 도구 : 
  - 사용 기술 : 
------------

## [ 담당 기능 구현 화면 ]
**1. 로그인 페이지**
> ![로그인](https://user-images.githubusercontent.com/75263831/127144878-53197978-14f4-4993-a89c-b245fbb7c833.png)<br><br>  

**2. 회원가입**
 
> - 회원 가입 1단계 : 약관 동의 페이지
>  
> ![007](https://user-images.githubusercontent.com/75263831/126876033-03ec65a8-a999-4a42-bf65-84ba02dc4350.png)<br><br>  
>
> - 회원 가입 2단계 : 사용자 정보 입력 페이지
>   - Spring Security 라이브러리 사용 : 회원 가입 시 비밀번호를 암호화  
>   - Apache Commons Email 라이브러리 사용 : 회원가입 전 이메일을 인증하기 위해 사용  
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

## [ 패키지별 구현 기능 ]

1. com/kh/naturephone/admin : 관리자가 회원들을 관리(등급 변경, 강제 탈퇴, 게시글 관리)하는 패키지

2. com/kh/naturephone/boardFree : 자유 게시판의 CRUD 기능 패키지

3. com/kh/naturephone/boardMobile : 모바일뉴스 게시판의 CRUD 기능 패키지

4. com/kh/naturephone/boardSurvey : 회원 설문 게시판의 CRUD 기능 패키지

5. com/kh/naturephone/common : 

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
