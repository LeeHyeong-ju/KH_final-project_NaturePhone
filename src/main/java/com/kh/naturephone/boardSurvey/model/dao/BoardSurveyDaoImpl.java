package com.kh.naturephone.boardSurvey.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.boardSurvey.model.vo.S_Detail_TB;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

@Repository
public class BoardSurveyDaoImpl implements BoardSurveyDao{

	@Autowired
	   private SqlSessionTemplate sqlSession;

	   @Override
	   public int selectListCount() {

		   return sqlSession.selectOne("boardSurveyMapper.selectListCount");
	   }

	   @Override
	   public List<Survey_TB> selectList(PageInfo pi) {
		   int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return sqlSession.selectList("boardSurveyMapper.selectList", null, rowBounds);
	   }

	@Override
	public int insertBoard(Survey_TB board) {

		return sqlSession.insert("boardSurveyMapper.insertBoard", board);
	}

	@Override
	public int insertBoardDetail(S_Detail_TB sDetail) {

		return sqlSession.insert("boardSurveyMapper.insertBoardDetail", sDetail);
	}
	

	@Override
	public Survey_TB selectBoard(int s_no) {
		
		return sqlSession.selectOne("boardSurveyMapper.selectBoard", s_no);
	}

	
	@Override
	public void updateReadCount(int s_no) {
		sqlSession.update("boardSurveyMapper.updateReadCount", s_no);
		
	}

	@Override
	public int updateBoard(Survey_TB board) {
		
		return sqlSession.update("boardSurveyMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int s_no) {
		
		return sqlSession.update("boardSurveyMapper.deleteBoard", s_no);
	}

	@Override
	public List<Reply_TB> selectReplyList(int s_no) {
		
		return sqlSession.selectList("boardSurveyMapper.selectReplyList", s_no);
	}

	@Override
	public void insertReply(Reply_TB r) {
		
		sqlSession.insert("boardSurveyMapper.insertReply", r);
		
	}

	@Override
	public List<Survey_TB> searchList(Search search) {
		
		return sqlSession.selectList("boardSurveyMapper.searchList", search);

	}

	@Override
	public void insertBoardDetail(String surveytext1) {
		
		sqlSession.insert("boardSurveyMapper.insertBoardDetail", surveytext1);
		
	}

	@Override
	public List<S_Detail_TB> selectBoardDetail(int s_no) {
	
		
		return sqlSession.selectList("boardSurveyMapper.selectBoardDetail", s_no);
	}




	}

	
	
	



