package com.kh.naturephone.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 1. 신고 하기
	@Override
	public int reportInsert(Report r) {
		return sqlSession.insert("reportMapper.reportInsert", r);
	}

}
