package com.kh.naturephone.message.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.dao.MessageDao;
import com.kh.naturephone.message.model.vo.Message;
import com.kh.naturephone.message.model.vo.MessageSearch;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao mDao;
	
	// 1. 게시글 수 카운트
	@Override
	public int selectListCount(Message m) {
		return mDao.selectListCount(m);
	}
	
	// 2. 쪽지함 목록 조회
	@Override
	public List<Message> selectList(Message m, PageInfo pi) {
		return mDao.selectList(m, pi);
	}

	// 3. 쪽지함 상세 조회 (받은 쪽지함일 경우 상세 페이지로 들어갈 때 view_status = "Y"로 update)
	@Override
	public Message selectMessage(Message m) {
		
		if(m.getType().equals("받은 쪽지함")) {
			mDao.updateViewStatus(m);
		}
		
		return mDao.selectMessage(m);
	}
	// 4. 쪽지함 검색 페이징 처리
	@Override
	public int searchListCount(MessageSearch search) {
		return mDao.searchListCount(search);
	}
	// 4-1. 쪽지함 검색
	@Override
	public List<Message> searchList(MessageSearch search, PageInfo pi) {
		return mDao.searchList(search, pi);
	}

	// 5. 쪽지 삭제
	@Override
	public int messageDelete(HashMap<String, Object> map) {
		return mDao.messageDelete(map);
	}

	@Override
	public int messageInsert(Message m) {
		return mDao.messageInsert(m);
	}
	
	
}
