package com.kh.naturephone.admin.model.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;

public interface AdminService {

	int selectMemberListCount();

	List<Member> selectMemberList(PageInfo pi);

	int adminQuitMember(int userNo);

	void adminChangeGradeMember(Member m, HttpServletResponse response) throws IOException;

	Member adminSelectMember(int userNo);

	int selectBoardListCount(String category);

	List<Board_TB> selectBoardList(String category, PageInfo pi);

	int selectSurveyListCount();

	List<Survey_TB> selectSurveyList(PageInfo pi);

}
