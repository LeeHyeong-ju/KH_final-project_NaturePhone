package com.kh.naturephone.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.report.model.dao.ReportDao;
import com.kh.naturephone.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao rDao;

	// 1. 신고 하기
	@Override
	public int reportInsert(Report r) {
		return rDao.reportInsert(r);
	}
}
