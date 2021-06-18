package com.kh.naturephone.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.report.model.vo.Report;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectMemberListCount() {
		return sqlSession.selectOne("adminMapper.selectMemberListCount");
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

	@Override
	public int adminQuitMember(int userNo) {
		return sqlSession.update("adminMapper.quitMember", userNo);
	}

	@Override
	public int adminChangeGradeMember(Member m) {
		return sqlSession.update("adminMapper.updateMemberGrade", m);
	}

	@Override
	public Member adminSelectMember(int userNo) {
		return sqlSession.selectOne("adminMapper.selectMemberInfo", userNo);
	}

	@Override
	public int selectBoardListCount(String category) {
		return sqlSession.selectOne("adminMapper.selectBoardListCount", category);
	}

	@Override
	public List<Board_TB> selectBoardList(String category, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectBoardList", category, rowBounds);
	}

	@Override
	public int selectSurveyListCount() {
		return sqlSession.selectOne("adminMapper.selectSurveyListCount");
	}

	@Override
	public List<Survey_TB> selectSurveyList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectSurveyList", null, rowBounds);
	}

	@Override
	public int selectReportListCount() {
		return sqlSession.selectOne("adminMapper.selectReportListCount");
	}

	@Override
	public List<Report> selectReportList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectReportList", null, rowBounds);
	}

}
