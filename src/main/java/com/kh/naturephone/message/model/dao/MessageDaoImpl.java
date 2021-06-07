package com.kh.naturephone.message.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*--------------------- 페이징 처리 ---------------------*/
	
	// 1. 게시글 수 카운트
	@Override
	public int selectListCount(Message m) {
		return sqlSession.selectOne("messageMapper.selectListCount", m);
	}

	/*--------------------- 기능 구현 ---------------------*/
	@Override
	public List<Message> selectList(Message m, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("messageMapper.selectList", m, rowBounds);
	}

	
	
	
	
	
	
	
}
