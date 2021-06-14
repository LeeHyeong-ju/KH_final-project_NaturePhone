package com.kh.naturephone.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.notice.model.vo.Reply;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount");
	}

	@Override
	public List<Board_TB> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	@Override
	public int insertNotice(Board_TB notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	@Override
	public int insertNoticeAtt(B_Att_TB att) {
		return sqlSession.insert("noticeMapper.insertNoticeAtt", att);
	}

	@Override
	public List<Board_TB> searchList(Search search) {
		return sqlSession.selectList("noticeMapper.searchList", search);
	}

	@Override
	public Board_TB selectNotice(int bno) {
		return sqlSession.selectOne("noticeMapper.selectNotice", bno);
	}

	@Override
	public void updateReadCount(int bno) {
		sqlSession.update("noticeMapper.updateReadCount", bno);
	}

	@Override
	public List<Reply> selectReplyList(int bno) {
		return sqlSession.selectList("noticeMapper.selectReplyList", bno);
	}

	@Override
	public B_Att_TB selectNoticeAtt(int bno) {
		return sqlSession.selectOne("noticeMapper.selectNoticeAtt", bno);
	}

	@Override
	public int updateNotice(Board_TB n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	@Override
	public int updateNoticeAtt(B_Att_TB na) {
		return sqlSession.update("noticeMapper.updateNoticeAtt", na);
	}

	@Override
	public int insertNoticeAtt(B_Att_TB na, int bno) {
		na.setBno(bno);
		return sqlSession.insert("noticeMapper.insertNoticeAtt2", na);
	}

	@Override
	public int deleteNotice(int bno) {
		return sqlSession.update("noticeMapper.deleteNotice", bno);
	}

	@Override
	public void deleteNoticeAtt(int bno) {
		sqlSession.update("noticeMapper.deleteNoticeAtt", bno);
	}

	@Override
	public void insertNoticeReply(Reply r) {
		sqlSession.insert("noticeMapper.insertNoticeReply", r);
	}
}
