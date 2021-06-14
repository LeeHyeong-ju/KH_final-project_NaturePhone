package com.kh.naturephone.myPage2.dealInfo.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyInfoDaoImpl implements BuyInfoDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	

}
