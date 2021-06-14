package com.kh.naturephone.member.model.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.member.model.dao.MemberDao;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDao mDao;
	
	/*----------------- 회원 관련 -----------------*/
	
	@Override
	public Member loginMember(Member m) {
		return mDao.selectMember(m);
	}

	@Override
	public void idOverlapCheck(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mDao.idOverlapCheck(id));
		out.flush();
		out.close();
	}
	
	@Override
	public void emailOverlapCheck(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mDao.emailOverlapCheck(email));
		out.flush();
		out.close();		
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int pwdUpdate(Member loginUser) {
		return mDao.pwdUpdate(loginUser);
	}
	
	@Override
	public int deleteMember(Member m) {
		return mDao.deleteMember(m);
	}

	

	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/
	
	@Override
	public List<MyBoard> selectMyBoardList(int userNo, PageInfo pi) {
		return mDao.selectMyBoardList(userNo, pi);
	}
	
	@Override
	public int selectListCount(int userNo) {
		return mDao.selectListCount(userNo);
	}

	@Override
	public List<MyReply> selectMyReplyList() {
		return mDao.selectMyReplyList();
	}

	

	


	

	
}
