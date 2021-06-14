package com.kh.naturephone.notice.model.dao;

import java.util.List;

import com.kh.naturephone.boardFree.model.vo.B_Att_TB;
import com.kh.naturephone.boardFree.model.vo.Board_TB;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.notice.model.vo.Reply_TB;
import com.kh.naturephone.notice.model.vo.Search;

public interface NoticeDao {

	int selectListCount();

	List<Board_TB> selectList(PageInfo pi);

	int insertNotice(Board_TB notice);

	int insertNoticeAtt(B_Att_TB att);

	List<Board_TB> searchList(Search search);
	
	Board_TB selectNotice(int bno);

	void updateReadCount(int bno);

	List<Reply_TB> selectReplyList(int bno);

	B_Att_TB selectNoticeAtt(int bno);

	int updateNotice(Board_TB n);

	int updateNoticeAtt(B_Att_TB na);

	int insertNoticeAtt(B_Att_TB na, int bno);
	
}
