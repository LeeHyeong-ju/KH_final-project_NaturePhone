package com.kh.naturephone.goods.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.naturephone.goods.model.vo.Goods;

@Repository
public class GoodsDaoImpl implements GoodsDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertGoods(Goods g) {
		
		return sqlSession.insert("goodsMapper.insertGoods", g);
	}

}
