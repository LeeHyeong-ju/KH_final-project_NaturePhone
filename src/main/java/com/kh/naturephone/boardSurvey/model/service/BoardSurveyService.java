package com.kh.naturephone.boardSurvey.model.service;

import java.util.List;

import com.kh.naturephone.boardSurvey.model.vo.S_Detail_TB;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

public interface BoardSurveyService {
	
	// 1. 게시글 수 카운트
	int selectListCount();
	// 2. 페이징 처리 된 게시글 조회
	List<Survey_TB> selectList(PageInfo pi);
	
	// 3. 게시글 저장
	int insertBoard(Survey_TB board);

	int insertBoardDetail(S_Detail_TB sDetail);

	// 4. 게시글 조회(조회수 증가 처리 flag)
	Survey_TB selectBoard(int s_no, boolean flag);

	// 5. 게시글 수정
	int updateBoard(Survey_TB board);

	// 8. 게시글 삭제
	int deleteBoard(int s_no);
	
	// 5. 게시글 당 댓글 리스트 조회
	List<Reply_TB> selectReplyList(int s_no);
	
	// 9. 댓글 입력
	List<Reply_TB> insertReply(Reply_TB r);
	// 10. 리스트 키워드 검색
	List<Survey_TB> searchList(Search search);
	// 11. 디테일 받아오기
	List<S_Detail_TB> selectBoardDetail(int s_no);





	
	

	

	
	
	
	
}



