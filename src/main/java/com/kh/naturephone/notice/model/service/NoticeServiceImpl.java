package com.kh.naturephone.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.notice.model.dao.NoticeDao;
import com.kh.naturephone.notice.model.vo.Reply;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao nDao;

	@Override
	public int selectListCount() {
		return nDao.selectListCount();
	}

	@Override
	public List<Board_TB> selectList(PageInfo pi) {
		return nDao.selectList(pi);
	}

	@Override
	public int insertNotice(Board_TB notice) {
		return nDao.insertNotice(notice);
	}

	@Override
	public int insertNoticeAtt(B_Att_TB att) {
		return nDao.insertNoticeAtt(att);
	}

	@Override
	public List<Board_TB> searchList(Search search) {
		return nDao.searchList(search);
	}

	@Override
	public Board_TB selectNotice(int bno, boolean flag) {
		if(flag) nDao.updateReadCount(bno);
		
		return nDao.selectNotice(bno);
	}

	@Override
	public List<Reply> selectReplyList(int bno) {
		return nDao.selectReplyList(bno);
	}

	@Override
	public B_Att_TB selectNoticeAtt(int bno) {
		return nDao.selectNoticeAtt(bno);
	}

	@Override
	public int updateNotice(Board_TB n) {
		return nDao.updateNotice(n);
	}

	@Override
	public int updateNoticeAtt(B_Att_TB na) {
		return nDao.updateNoticeAtt(na);
	}

	@Override
	public int insertNoticeAtt(B_Att_TB na, int bno) {
		return nDao.insertNoticeAtt(na, bno);
	}
}
