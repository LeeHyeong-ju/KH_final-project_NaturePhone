package com.kh.naturephone.boardFree.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.boardFree.model.vo.B_Att_TB;
import com.kh.naturephone.boardFree.model.vo.Board_TB;
import com.kh.naturephone.boardFree.model.vo.PageInfo;

@Repository
public class BoardFreeDaoImpl implements BoardFreeDao{

	@Autowired
	   private SqlSessionTemplate sqlSession;

	   @Override
	   public int selectListCount() {

		   return sqlSession.selectOne("boardMapper.selectListCount");
	   }

	   @Override
	   public List<Board_TB> selectList(PageInfo pi) {
		   int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		   RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		   return sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	   }

	@Override
	public int insertBoard(Board_TB board) {
		
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	@Override
	public int insertBoardAtt(B_Att_TB att) {
		
		return sqlSession.insert("boardMapper.insertBoardAtt", att);
		
	}

}



















