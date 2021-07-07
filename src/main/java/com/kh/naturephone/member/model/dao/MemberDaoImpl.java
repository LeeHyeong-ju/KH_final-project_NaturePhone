package com.kh.naturephone.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.KeyPublish;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	@Override
	public int idOverlapCheck(String id) {
		return sqlSession.selectOne("memberMapper.idOverlapCheck", id);
	}

	@Override
	public int emailOverlapCheck(String email) {
		System.out.println("dad : " + email);
		return sqlSession.selectOne("memberMapper.emailOverlapCheck", email);
	}

	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	@Override
	public int pwdUpdate(Member loginUser) {
		return sqlSession.update("memberMapper.pwdUpdate", loginUser);
	}

	@Override
	public int deleteMember(Member m) {
		return sqlSession.update("memberMapper.deleteMember", m);
	}
	
	@Override
	public String findIdSendMail(String findIdEmail) {
		return sqlSession.selectOne("memberMapper.findIdSendMail", findIdEmail);
	}
	
	@Override
	public int findPwdSendEmail(Member m) {
		return sqlSession.update("memberMapper.findPwdSendEmail", m);
	}
	
	@Override
	public Member searchNEmail(String nEmail) {
		return sqlSession.selectOne("memberMapper.searchNEmail", nEmail);
	}

	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/

	@Override
	public List<MyBoard> selectMyBoardList(int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("myListMapper.selectMyBoardList", userNo, rowBounds);
	}

	@Override
	public int selectListCount(int userNo) {
		return sqlSession.selectOne("myListMapper.selectListCount", userNo);
	}

	@Override
	public List<MyReply> selectMyReplyList(int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("myListMapper.selectMyReplyList", userNo, rowBounds);
	}

	@Override
	public int selectReplyListCount(int userNo) {
		return sqlSession.selectOne("myListMapper.selectReplyListCount", userNo);
	}

	@Override
	public void naverInsert(Member m) {
		String nId = "NAVER"+KeyPublish.createId();
		int result = sqlSession.selectOne("memberMapper.searchNId", nId);
		while(result < 0) {
			nId = "NAVER"+KeyPublish.createId();
		}
		m.setId(nId);
		
		sqlSession.insert("memberMapper.naverInsert", m);
	}

	

	
	

	
	
}
