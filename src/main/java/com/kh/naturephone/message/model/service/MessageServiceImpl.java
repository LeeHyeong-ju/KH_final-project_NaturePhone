package com.kh.naturephone.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.dao.MessageDao;
import com.kh.naturephone.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired
	private MessageDao mDao;
	/*--------------------- 페이징 처리 ---------------------*/
	
	// 1. 게시글 수 카운트
	@Override
	public int selectListCount(Message m) {
		return mDao.selectListCount(m);
	}

	/*--------------------- 기능 구현 ---------------------*/
	@Override
	public List<Message> selectList(Message m, PageInfo pi) {
		return mDao.selectList(m, pi);
	}
	
	
}
