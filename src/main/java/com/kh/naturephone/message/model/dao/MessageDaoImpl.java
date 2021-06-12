package com.kh.naturephone.message.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.vo.Message;
import com.kh.naturephone.message.model.vo.MessageSearch;

@Repository
public class MessageDaoImpl implements MessageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 1. 게시글 수 카운트
	@Override
	public int selectListCount(Message m) {
		return sqlSession.selectOne("messageMapper.selectListCount", m);
	}
	
	// 2. 쪽지함 목록 조회
	@Override
	public List<Message> selectList(Message m, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("messageMapper.selectList", m, rowBounds);
	}
	// 3. 쪽지함 상세페이지
	@Override
	public Message selectMessage(Message m) {
		return sqlSession.selectOne("messageMapper.selectMessage", m);
	}
	
	// 3-1. 받은 쪽지함일 경우 상세 페이지로 들어갈 때 view_status = "Y"로 update
	@Override
	public void updateViewStatus(Message m) {
		sqlSession.update("messageMapper.updateViewStatus", m);
	}

	// 4. 쪽지함 검색 페이징 처리
	@Override
	public int searchListCount(MessageSearch search) {
		return sqlSession.selectOne("messageMapper.searchListCount", search);
	}
	
	// 4-1. 쪽지함 검색
	@Override
	public List<Message> searchList(MessageSearch search, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("messageMapper.searchList", search, rowBounds);
	}

	// 5. 쪽지 삭제
	@Override
	public int messageDelete(HashMap<String, Object> map) {
		return sqlSession.update("messageMapper.messageDelete", map);
	}

	@Override
	public int messageInsert(Message m) {
		return sqlSession.insert("messageMapper.messageInsert", m);
	}


	
	
	
	
	
	
	
}
