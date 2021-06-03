package com.kh.naturephone.goods.model.service;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.goods.model.vo.Goods;

public interface GoodsService {
	// 물품 등록
	int insertGoods(Goods g);
	
	int insertAtt(Attachment att);



	

}
