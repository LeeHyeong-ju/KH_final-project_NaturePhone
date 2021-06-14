package com.kh.naturephone.boardMobile.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

@Repository
public class BoardMobileDaoImpl implements BoardMobileDao{

	@Autowired
	   private SqlSessionTemplate sqlSession;

	   @Override
	   public int selectListCount() {

		   return sqlSession.selectOne("boardMobileMapper.selectListCount");
	   }

	   @Override
	   public List<Board_TB> selectList(PageInfo pi) {
		   int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return sqlSession.selectList("boardMobileMapper.selectList", null, rowBounds);
	   }

	@Override
	public int insertBoard(Board_TB board) {
		
		return sqlSession.insert("boardMobileMapper.insertBoard", board);
	}

	@Override
	public int insertBoardAtt(B_Att_TB att) {
		
		return sqlSession.insert("boardMobileMapper.insertBoardAtt", att);
		
	}

	@Override
	public Board_TB selectBoard(int bno) {
		
		return sqlSession.selectOne("boardMobileMapper.selectBoard", bno);
	}

	
	@Override
	public void updateReadCount(int bno) {
		sqlSession.update("boardMobileMapper.updateReadCount", bno);
		
	}

	@Override
	public int updateBoard(Board_TB board) {
		
		return sqlSession.update("boardMobileMapper.updateBoard", board);
	}

	@Override
	public int updateBoardAtt(B_Att_TB att) {
		
		return sqlSession.update("boardMobileMapper.updateBoardAtt", att);
	}

	@Override
	public B_Att_TB selectBoardAtt(int bno) {
	
		return sqlSession.selectOne("boardMobileMapper.selectBoardAtt", bno);
	}

	@Override
	public int deleteBoard(int bno) {
		
		return sqlSession.update("boardMobileMapper.deleteBoard", bno);
	}

	@Override
	public void deleteBoardAtt(int bno) {
		
		sqlSession.update("boardMobileMapper.deleteBoardAtt", bno);		
	}

	@Override
	public List<Reply_TB> selectReplyList(int bno) {
		
		return sqlSession.selectList("boardMobileMapper.selectReplyList", bno);
	}

	@Override
	public void insertReply(Reply_TB r) {
		
		sqlSession.insert("boardMobileMapper.insertReply", r);
		
	}

	@Override
	public List<Board_TB> searchList(Search search) {
		
		return sqlSession.selectList("boardMobileMapper.searchList", search);

	}

	
	
	
}


