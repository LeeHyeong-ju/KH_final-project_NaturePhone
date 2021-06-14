package com.kh.naturephone.myPage2.interest.model.dao;

import java.util.List;

import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

public interface ItdProdDao {

	// 관심상품 리스트 조회
	List<ItdProduct> selectItdProdList(int userNo);
	
}
