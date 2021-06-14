package com.kh.naturephone.goods.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.goods.model.dao.GoodsDao;
import com.kh.naturephone.goods.model.vo.Goods;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDao gDao;
	
	@Override
	public int insertGoods(Goods g) {

		int insertResult = gDao.insertGoods(g);
		
		return insertResult;
	}
	
	
	@Override
	public int insertAtt(Attachment att) {
		
		return 0;
	}


	

	

}
