package com.kh.naturephone.notice.model.service;

import java.util.List;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.notice.model.vo.Reply;

public interface NoticeService {

	int selectListCount();

	List<Board_TB> selectList(PageInfo pi);

	int insertNotice(Board_TB notice);

	int insertNoticeAtt(B_Att_TB att);

	List<Board_TB> searchList(Search search);
	
	Board_TB selectNotice(int bno, boolean flag);

	List<Reply> selectReplyList(int bno);

	B_Att_TB selectNoticeAtt(int bno);

	int updateNotice(Board_TB n);

	int updateNoticeAtt(B_Att_TB na);

	int insertNoticeAtt(B_Att_TB na, int bno);
	
}
