package com.kh.naturephone.message.model.service;

import java.util.List;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.vo.Message;

public interface MessageService {

	/*--------------------- 페이징 처리 ---------------------*/
	
	// 1. 게시글 수 카운트
	int selectListCount(Message m);

	
	
	/*--------------------- 기능 구현 ---------------------*/
	// 1. 쪽지함 목록 조회
	List<Message> selectList(Message m, PageInfo pi);
	
	
	// 2. 휴지통에서 쪽지 완전 삭제
	
	// 3. 쪽지 보내기 
	
	// 4. 쪽지 간 이동(update)
	
}
