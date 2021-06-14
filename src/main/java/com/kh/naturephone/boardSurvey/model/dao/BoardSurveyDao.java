package com.kh.naturephone.boardSurvey.model.dao;

import java.util.List;

import com.kh.naturephone.boardSurvey.model.vo.S_Detail_TB;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

public interface BoardSurveyDao {

	int selectListCount();

	List<Survey_TB> selectList(PageInfo pi);

	int insertBoard(Survey_TB board);

	int insertBoardDetail(S_Detail_TB sDetail);
		
	Survey_TB selectBoard(int s_no);

	List<Reply_TB> selectReplyList(int s_no);
	
	void updateReadCount(int s_no);

	int updateBoard(Survey_TB board);

	int deleteBoard(int s_no);

	void insertReply(Reply_TB r);

	List<Survey_TB> searchList(Search search);


}
