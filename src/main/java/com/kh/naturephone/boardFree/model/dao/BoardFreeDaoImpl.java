package com.kh.naturephone.boardFree.model.dao;

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
public class BoardFreeDaoImpl implements BoardFreeDao{

	@Autowired
	   private SqlSessionTemplate sqlSession;

	   @Override
	   public int selectListCount() {

		   return sqlSession.selectOne("boardFreeMapper.selectListCount");
	   }

	   @Override
	   public List<Board_TB> selectList(PageInfo pi) {
		   int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return sqlSession.selectList("boardFreeMapper.selectList", null, rowBounds);
	   }

	@Override
	public int insertBoard(Board_TB board) {
		
		return sqlSession.insert("boardFreeMapper.insertBoard", board);
	}

	@Override
	public int insertBoardAtt(B_Att_TB att) {
		
		return sqlSession.insert("boardFreeMapper.insertBoardAtt", att);
		
	}

	@Override
	public Board_TB selectBoard(int bno) {
		
		return sqlSession.selectOne("boardFreeMapper.selectBoard", bno);
	}

	
	@Override
	public void updateReadCount(int bno) {
		sqlSession.update("boardFreeMapper.updateReadCount", bno);
		
	}

	@Override
	public int updateBoard(Board_TB board) {
		
		return sqlSession.update("boardFreeMapper.updateBoard", board);
	}

	@Override
	public int updateBoardAtt(B_Att_TB att) {
		
		return sqlSession.update("boardFreeMapper.updateBoardAtt", att);
	}

	@Override
	public B_Att_TB selectBoardAtt(int bno) {
	
		return sqlSession.selectOne("boardFreeMapper.selectBoardAtt", bno);
	}

	@Override
	public int deleteBoard(int bno) {
		
		return sqlSession.update("boardFreeMapper.deleteBoard", bno);
	}

	@Override
	public void deleteBoardAtt(int bno) {
		
		sqlSession.update("boardFreeMapper.deleteBoardAtt", bno);		
	}

	@Override
	public List<Reply_TB> selectReplyList(int bno) {
		
		return sqlSession.selectList("boardFreeMapper.selectReplyList", bno);
	}

	@Override
	public void insertReply(Reply_TB r) {
		
		sqlSession.insert("boardFreeMapper.insertReply", r);
		
	}

	@Override
	public List<Board_TB> searchList(Search search) {
		
		return sqlSession.selectList("boardFreeMapper.searchList", search);

	}

	
	
	
}


