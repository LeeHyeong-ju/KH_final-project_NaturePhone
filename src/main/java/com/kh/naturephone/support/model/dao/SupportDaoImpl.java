package com.kh.naturephone.support.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.support.model.vo.Phone;

@Repository
public class SupportDaoImpl implements SupportDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Phone> selectPhoneList(Phone p) {
		return sqlSession.selectList("supportMapper.selectPhoneList", p);
	}
	
}
