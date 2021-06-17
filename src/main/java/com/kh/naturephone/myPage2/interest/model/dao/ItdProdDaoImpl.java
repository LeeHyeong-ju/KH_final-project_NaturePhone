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

	// 선택한 상품 정보 조회
	@Override
	public ItdProduct selectItdProd(String keyword) {
		return sqlSession.selectOne("itdProductMapper.selectItdProd", keyword);
	}

	// 조회된 상품 등록
	@Override
	public int insertInterestProd(ItdProduct p) {
		return sqlSession.insert("itdProductMapper.insertInterestProd", p);
	}

	// 검색한 상품 리스트 조회
	@Override
	public List<ItdProduct> selectSearchProdList(String keyword) {
		return sqlSession.selectList("itdProductMapper.selectSearchProdList", keyword);
	}	

}
