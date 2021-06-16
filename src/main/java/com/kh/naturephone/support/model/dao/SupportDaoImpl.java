package com.kh.naturephone.support.model.dao;

import java.util.ArrayList;
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

	@Override
	public List<Phone> selectCompareInfo(List<Integer> pnos) {
		List<Phone> infoes = new ArrayList<>();
		
		for(Integer pno : pnos) {
			Phone p = sqlSession.selectOne("supportMapper.selectCompareInfo", pno);
			infoes.add(p);
		}
		
		return infoes;
	}
	
}
