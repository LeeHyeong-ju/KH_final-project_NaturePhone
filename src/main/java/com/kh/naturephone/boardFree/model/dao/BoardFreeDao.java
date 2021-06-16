package com.kh.naturephone.boardFree.model.dao;

import java.util.List;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;

public interface BoardFreeDao {

	int selectListCount();

	List<Board_TB> selectList(PageInfo pi);

	int insertBoard(Board_TB board);

	int insertBoardAtt(B_Att_TB att);

	Board_TB selectBoard(int bno);

	List<Reply_TB> selectReplyList(int bno);
	
	void updateReadCount(int bno);

	int updateBoard(Board_TB board);

	int updateBoardAtt(B_Att_TB att);

	B_Att_TB selectBoardAtt(int bno);

	int deleteBoard(int bno);

	void deleteBoardAtt(int bno);

	void insertReply(Reply_TB r);

	List<Board_TB> searchList(Search search);

	int recommend(int bno);

	int deleteReply(Reply_TB r);

	

}
