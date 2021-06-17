package com.kh.naturephone.boardFree.model.service;

import java.util.List;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

public interface BoardFreeService {
	
	// 1. 게시글 수 카운트
	int selectListCount();
	
	// 2. 페이징 처리 된 게시글 조회
	List<Board_TB> selectList(PageInfo pi);
	
	// 3. 게시글 저장
	int insertBoard(Board_TB board);
	
	// 4. 게시글 첨부파일 저장
	int insertBoardAtt(B_Att_TB att);
	
	// 5. 게시글 조회(조회수 증가 처리 flag)
	Board_TB selectBoard(int bno, boolean flag);

	// 6. 게시글 수정
	int updateBoard(Board_TB board);
	
	// 7. 게시글 수정(파일 교체)
	int updateBoardAtt(B_Att_TB att);
	
	// 8. 첨부파일 조회(삭제 기능 위한)
	B_Att_TB selectBoardAtt(int bno);
	
	// 9. 게시글 삭제
	int deleteBoard(int bno);
	
	// 10. 게시글 당 댓글 리스트 조회
	List<Reply_TB> selectReplyList(int bno);
	
	// 11. 댓글 입력
	List<Reply_TB> insertReply(Reply_TB r);
		
	// 12. 공감
	int recommend(int bno);
	
	// 13. 댓글 삭제
	int deleteReply(Reply_TB r);
	
	// 14. 검색한 리스트 카운트
	int searchListCount(Search search);
	
	// 15. 페이징처리한 리스트 목록 조회
	List<Board_TB> searchList(Search search, PageInfo pi);

	int insertFreeAtt(B_Att_TB att, int bno);


	


	
	

	

	
	
	
	
}



