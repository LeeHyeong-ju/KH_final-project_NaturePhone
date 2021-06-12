package com.kh.naturephone.member.model.service;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
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

	// 4. 회원가입 (DB insert)
	int insertMember(Member m);
	
	// 4-1. 인증 키 생성
	String create_key() throws Exception;
	
	// 4-2. 이메일 발송
	public void sendEmail(Member m) throws Exception;
	
	// 4-3. 메일인증
	void approval_member(Member m, HttpServletResponse response) throws Exception;
	
	// 5. 회원정보 수정
	int updateMember(Member m);
	
	// 6. 비밀번호 변경
	int pwdUpdate(Member loginUser);

	// 7. 회원 탈퇴 - 비밀번호 확인 (Ajax)
	int deleteMember(Member m);
	
	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/

	// 1. 나의 게시글 조회
	List<MyBoard> selectMyBoardList(int userNo, PageInfo pi);
	
	// 1-1. 페이징 처리 
	int selectListCount(int userNo);
	
	// 2. 나의 댓글 조회
	List<MyReply> selectMyReplyList();

	
	



}
