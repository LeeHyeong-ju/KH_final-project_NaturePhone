package com.kh.naturephone.myPage2.interest.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.myPage2.interest.model.dao.ItdProdDao;
import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

@Service
public class ItdProdServiceImpl implements ItdProdService{
	@Autowired
	private ItdProdDao ipDao;

	// 관심상품 리스트 조회
	@Override
	public List<ItdProduct> selectItdProdList(int userNo) {
		return ipDao.selectItdProdList(userNo);
	}

	// 관심상품 내역 삭제
	@Override
	public int deleteInterest(int itdNo) {
		return ipDao.deleteInterest(itdNo);
	}

}
