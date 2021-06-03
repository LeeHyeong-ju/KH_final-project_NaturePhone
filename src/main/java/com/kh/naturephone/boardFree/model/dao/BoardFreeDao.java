package com.kh.naturephone.boardFree.model.dao;

import java.util.List;

import com.kh.naturephone.boardFree.model.vo.B_Att_TB;
import com.kh.naturephone.boardFree.model.vo.Board_TB;
import com.kh.naturephone.boardFree.model.vo.PageInfo;

public interface BoardFreeDao {

	int selectListCount();

	List<Board_TB> selectList(PageInfo pi);

	int insertBoard(Board_TB board);

	int insertBoardAtt(B_Att_TB att);

	

}
