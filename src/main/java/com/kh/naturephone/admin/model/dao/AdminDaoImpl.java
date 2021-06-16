package com.kh.naturephone.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectMemberListCount() {
		return sqlSession.selectOne("adminMapper.selectMemberListCount");
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

}
