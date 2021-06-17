package com.kh.naturephone.myPage2.interest.model.dao;

import java.util.List;

import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

public interface ItdProdDao {

	// 관심상품 리스트 조회
	List<ItdProduct> selectItdProdList(int userNo);

	// 관심상품 내역 삭제
	int deleteInterest(int itdNo);

	// 선택한 상품 정보 조회
	ItdProduct selectItdProd(String keyword);

	// 조회된 상품 등록
	int insertInterestProd(ItdProduct p);

	// 검색한 상품 리스트 조회
	List<ItdProduct> selectSearchProdList(String keyword);
	
}
