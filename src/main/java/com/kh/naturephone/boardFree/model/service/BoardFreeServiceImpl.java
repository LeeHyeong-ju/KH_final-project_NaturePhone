package com.kh.naturephone.boardFree.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.boardFree.model.dao.BoardFreeDao;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.boardFree.model.vo.B_Att_TB;
import com.kh.naturephone.boardFree.model.vo.Board_TB;

@Service
public class BoardFreeServiceImpl implements BoardFreeService{
	@Autowired
	private BoardFreeDao bDao;
		
	@Override
	public int selectListCount() {
		return bDao.selectListCount();
	}

	@Override
	public List<Board_TB> selectList(PageInfo pi) {
		
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Board_TB board) {
		
		return bDao.insertBoard(board);
	}

	@Override
	public int insertBoardAtt(B_Att_TB att) {
		
		return bDao.insertBoardAtt(att);
	}

}
