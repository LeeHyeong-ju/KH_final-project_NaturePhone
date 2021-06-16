package com.kh.naturephone.myPage2.interest.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

@Repository
public class ItdProdDaoImpl implements ItdProdDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 관심상품 리스트 조회
	@Override
	public List<ItdProduct> selectItdProdList(int userNo) {
		return sqlSession.selectList("itdProductMapper.selectItdProdList", userNo);
	}

	// 관심상품 내역 삭제
	@Override
	public int deleteInterest(int itdNo) {
		return sqlSession.update("itdProductMapper.deleteInterest", itdNo);
	}	

}
