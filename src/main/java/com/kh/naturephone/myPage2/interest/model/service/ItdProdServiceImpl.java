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

	// 선택한 상품 정보 조회
	@Override
	public ItdProduct selectItdProd(String keyword) {
		return ipDao.selectItdProd(keyword);
	}

	// 조회된 상품 등록
	@Override
	public int insertInterestProd(ItdProduct p) {
		return ipDao.insertInterestProd(p);
	}

	// 검색한 상품 리스트 조회
	@Override
	public List<ItdProduct> selectSearchProdList(String keyword) {
		return ipDao.selectSearchProdList(keyword);
	}

}
