package com.kh.naturephone.boardFree.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.naturephone.boardFree.model.dao.BoardFreeDao;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;

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

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Board_TB selectBoard(int bno, boolean flag) {
		if(flag) bDao.updateReadCount(bno);
		return bDao.selectBoard(bno);
	}


	@Override
	public int updateBoard(Board_TB board) {
		
		return bDao.updateBoard(board);
	}

	@Override
	public int updateBoardAtt(B_Att_TB att) {
		
		return bDao.updateBoardAtt(att);
	}

	@Override
	public B_Att_TB selectBoardAtt(int bno) {
		
		return bDao.selectBoardAtt(bno);
	}

	@Override
	public int deleteBoard(int bno) {
		bDao.deleteBoardAtt(bno);
		
		return bDao.deleteBoard(bno);
	}

	@Override
	public List<Reply_TB> selectReplyList(int bno) {
	
		return bDao.selectReplyList(bno);
	}
		
	@Override
	public List<Reply_TB> insertReply(Reply_TB r) {
		
		bDao.insertReply(r);		
		return bDao.selectReplyList(r.getB_no());
	}

	@Override
	public int recommend(int bno) {
		
		return bDao.recommend(bno);
	}

	@Override
	public int deleteReply(Reply_TB r) {
		
		return bDao.deleteReply(r);
	}

	@Override
	public int searchListCount(Search search) {
		
		return bDao.searchListCount(search);
	}

	@Override
	public List<Board_TB> searchList(Search search, PageInfo pi) {
	
		return bDao.searchList(search, pi);
	}



	@Override
	public int insertFreeAtt(B_Att_TB att, int bno) {
		
		return bDao.insertFreeAtt(att, bno);
	}

	@Override
	public List<B_Att_TB> selectAttList(int bno) {
		
		return bDao.selectAttList(bno);
	}

}
