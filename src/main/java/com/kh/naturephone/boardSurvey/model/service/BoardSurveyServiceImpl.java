package com.kh.naturephone.boardSurvey.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.naturephone.boardSurvey.model.dao.BoardSurveyDao;
import com.kh.naturephone.boardSurvey.model.vo.S_Detail_TB;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;


@Service
public class BoardSurveyServiceImpl implements BoardSurveyService{
	@Autowired
	private BoardSurveyDao bDao;
		
	@Override
	public int selectListCount() {
		return bDao.selectListCount();
	}

	@Override
	public List<Survey_TB> selectList(PageInfo pi) {
		
		return bDao.selectList(pi);
	}

	@Override
	public int insertBoard(Survey_TB board) {
		
		return bDao.insertBoard(board);
	}

	@Override
	public int insertBoardDetail(S_Detail_TB sDetail) {
		
		return bDao.insertBoardDetail(sDetail);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Survey_TB selectBoard(int s_no, boolean flag) {
		if(flag) bDao.updateReadCount(s_no);
		return bDao.selectBoard(s_no);
	}


	@Override
	public int updateBoard(Survey_TB board) {
		
		return bDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int s_no) {
		
		return bDao.deleteBoard(s_no);
	}

	@Override
	public List<Reply_TB> selectReplyList(int s_no) {
	
		return bDao.selectReplyList(s_no);
	}
		
	@Override
	public List<Reply_TB> insertReply(Reply_TB r) {
		
		bDao.insertReply(r);		
		return bDao.selectReplyList(r.getS_no());
	}

	@Override
	public List<Survey_TB> searchList(Search search) {
		
		return bDao.searchList(search);
	}

	@Override
	public List<S_Detail_TB> selectBoardDetail(int s_no) {
	
		return bDao.selectBoardDetail(s_no);
	}

	@Override
	public int surveyVote(int de_s_no) {
		
		return bDao.surveyVote(de_s_no);
	}

	@Override
	public List<S_Detail_TB> selectDetail(int de_s_no) {
		
		return bDao.selectDetail(de_s_no);
	}



}
