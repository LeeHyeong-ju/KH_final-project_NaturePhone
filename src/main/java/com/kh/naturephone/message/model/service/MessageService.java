package com.kh.naturephone.message.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.message.model.vo.Message;
import com.kh.naturephone.message.model.vo.MessageSearch;

public interface MessageService {

	// 1. 게시글 수 카운트
	int selectListCount(Message m);

	// 2. 쪽지함 목록 조회
	List<Message> selectList(Message m, PageInfo pi);

	// 3. 쪽지함 상세페이지
	Message selectMessage(Message m);
	
	// 4. 쪽지함 검색 페이징 처리
	int searchListCount(MessageSearch search);
	
	// 4-1. 쪽지함 검색
	List<Message> searchList(MessageSearch search, PageInfo pi);

	// 5. 쪽지 삭제
	int messageDelete(HashMap<String, Object> map);

	// 6. 쪽지 보내기 
	int messageInsert(Message m);

	
	// 2. 휴지통에서 쪽지 완전 삭제
	
	
	
}
