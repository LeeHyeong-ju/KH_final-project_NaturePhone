package com.kh.naturephone.goods.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.goods.model.dao.GoodsDao;
import com.kh.naturephone.goods.model.vo.Goods;
import com.kh.naturephone.support.model.vo.Phone;

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
		int InsertAttResult = gDao.insertAtt(att);
		
		
		return InsertAttResult;
	}


	@Override
	public List<Phone> productName(String keyword) {
		List<Phone> list = gDao.productName(keyword);
			
		return list;
	}

	@Override
	public Phone selectPFN(String modelName) {
		Phone phoneForName = gDao.selectPFN(modelName);
		return phoneForName;
	}

	// 물품 게시글 갯수 가져오기
	@Override
	public int selectGoodsListCount() {
		
		return gDao.selectGoodsListCount();
	}


	@Override
	public List<Map<String, String>> selectGoodsList(PageInfo pi) {
		
		return gDao.selectGoodsList(pi);
	}


	@Override
	public List<Attachment> selectAttList() {

		return gDao.selectAttList();
	}

	// 물품 게시글 당 제품 이름 알아오기
	@Override
	public Phone selectPhoneNameList(int proNo) {

		return gDao.selectPhoneNameList(proNo);
	}







	





	

	

}
