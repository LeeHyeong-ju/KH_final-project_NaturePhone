package com.kh.naturephone.admin.model.dao;

import java.util.List;

import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.report.model.vo.Report;

public interface AdminDao {

	int selectMemberListCount();

	List<Member> selectMemberList(PageInfo pi);

	int adminQuitMember(int userNo);

	int adminChangeGradeMember(Member m);

	Member adminSelectMember(int userNo);

	int selectBoardListCount(String category);

	List<Board_TB> selectBoardList(String category, PageInfo pi);

	int selectSurveyListCount();

	List<Survey_TB> selectSurveyList(PageInfo pi);

	int selectReportListCount();

	List<Report> selectReportList(PageInfo pi);

}
