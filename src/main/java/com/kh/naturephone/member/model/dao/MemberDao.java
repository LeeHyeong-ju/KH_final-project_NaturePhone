package com.kh.naturephone.member.model.dao;

import java.util.List;

import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

public interface MemberDao {
	
	// 1. 회원 로그인 서비스를 위한 메소드
	Member selectMember(Member m);

	// 2-1. 아이디 중복 검사 메소드 (Ajax)
	int idOverlapCheck(String id);
	
	// 2-2. 이메일 중복 검사 메소드 (Ajax)
	int emailOverlapCheck(String email);

	// 4. 회원가입 (DB insert)
	int insertMember(Member m);
	
	// 5. 회원정보 수정
	int updateMember(Member m);
	
	// 6. 비밀번호 변경
	int pwdUpdate(Member loginUser);
	
	// 7. 회원 탈퇴 - 비밀번호 확인 (Ajax)
	int deleteMember(Member m);

	// 8. 회원 아이디 찾기(Ajax)
	String findIdSendMail(String findIdEmail);
	
	// 9. 회원 비밀번호 찾기(Ajax) - 인증키로 비밀번호 update
	int findPwdSendEmail(Member m);
	
	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/
	
	// 1. 나의 게시글 조회
	List<MyBoard> selectMyBoardList(int userNo, PageInfo pi);
	
	// 1-1. 페이징 처리
	int selectListCount(int userNo);
	
	// 2. 나의 게시글 조회
	List<MyReply> selectMyReplyList();







}
