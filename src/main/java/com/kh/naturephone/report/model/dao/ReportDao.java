package com.kh.naturephone.report.model.dao;

import com.kh.naturephone.report.model.vo.Report;

public interface ReportDao {
	
	// 1. 신고 하기
	int reportInsert(Report r);

}
