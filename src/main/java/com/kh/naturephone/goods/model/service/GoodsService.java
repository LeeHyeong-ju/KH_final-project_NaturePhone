package com.kh.naturephone.goods.model.service;

import java.util.List;
import java.util.Map;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.goods.model.vo.Goods;
import com.kh.naturephone.support.model.vo.Phone;

public interface GoodsService {
	// 물품 등록
	int insertGoods(Goods g);
	
	int insertAtt(Attachment att);

	List<Phone> productName(String keyword);

	Phone selectPFN(String modelName);
	
	int selectGoodsListCount();

	List<Map<String, String>> selectGoodsList(PageInfo pi);

	List<Attachment> selectAttList();

	Phone selectPhoneNameList(int proNo);

	




	

}
