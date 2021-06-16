package com.kh.naturephone.myPage2.interest.model.service;

import java.util.List;

import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

public interface ItdProdService {

	// 관심상품 리스트 조회
	List<ItdProduct> selectItdProdList(int userNo);

	// 관심상품 내역 삭제
	int deleteInterest(int itdNo);

}
