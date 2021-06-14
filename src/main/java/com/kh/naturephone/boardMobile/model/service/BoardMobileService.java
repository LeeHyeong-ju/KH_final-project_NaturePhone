package com.kh.naturephone.boardMobile.model.service;

import java.util.List;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

public interface BoardMobileService {
	
	// 1. 게시글 수 카운트
	int selectListCount();
	// 2. 페이징 처리 된 게시글 조회
	List<Board_TB> selectList(PageInfo pi);
	
	// 3. 게시글 저장
	int insertBoard(Board_TB board);
	// 4. 게시글 첨부파일 저장
	int insertBoardAtt(B_Att_TB att);
	// 4. 게시글 조회(조회수 증가 처리 flag)
	Board_TB selectBoard(int bno, boolean flag);

	// 5. 게시글 수정
	int updateBoard(Board_TB board);
	
	// 6. 게시글 수정(파일 교체)
	int updateBoardAtt(B_Att_TB att);
	
	// 7. 첨부파일 조회(삭제 기능 위한)
	B_Att_TB selectBoardAtt(int bno);
	
	// 8. 게시글 삭제
	int deleteBoard(int bno);
	
	// 5. 게시글 당 댓글 리스트 조회
	List<Reply_TB> selectReplyList(int bno);
	
	// 9. 댓글 입력
	List<Reply_TB> insertReply(Reply_TB r);
	// 10. 리스트 키워드 검색
	List<Board_TB> searchList(Search search);
	
	

	

	
	
	
	
}



