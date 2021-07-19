package com.kh.naturephone.member.model.service;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

public interface MemberService {
	
	/*----------------- 회원 관련 -----------------*/
	
	// 1. 회원 로그인 서비스를 위한 메소드
	Member loginMember(Member m);
	
	// 2-1. 아이디 중복 검사 메소드 (Ajax)
	void idOverlapCheck(String id, HttpServletResponse response) throws Exception;
	
	// 2-2. 이메일 중복 검사 메소드 (Ajax)
	void emailOverlapCheck(String email, HttpServletResponse response) throws Exception;

	// 3. 회원가입 (DB insert)
	int insertMember(Member m);
	
	// 4. 회원정보 수정
	int updateMember(Member m);
	
	// 5. 비밀번호 변경
	int pwdUpdate(Member loginUser);

	// 6. 회원 탈퇴 - 비밀번호 확인 (Ajax)
	int deleteMember(Member m);
	
	// 7. 회원 아이디 찾기(Ajax)
	String findIdSendMail(String findIdEmail);

	// 8. 회원 비밀번호 찾기(Ajax) - update
	int findPwdSendEmail(Member m);

	/*----------------- 네아로 관련 -----------------*/
	
	// 네이버 고유 아이디 DB에 존재하는지 확인
	Member searchNEmail(String nEmail);
	
	// 네아로로 가입
	void naverInsert(Member m);
	
	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/

	// 1. 나의 게시글 조회
	List<MyBoard> selectMyBoardList(int userNo, PageInfo pi);
	
	// 1-1. 게시글 페이징 처리 
	int selectListCount(int userNo);
	
	// 2. 나의 댓글 조회
	List<MyReply> selectMyReplyList(int userNo, PageInfo pi);

	// 2-1. 댓글 페이징 처리
	int selectReplyListCount(int userNo);

}
