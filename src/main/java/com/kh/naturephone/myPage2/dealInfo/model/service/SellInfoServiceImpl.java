package com.kh.naturephone.myPage2.dealInfo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.myPage2.dealInfo.model.dao.SellInfoDao;
import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalculateInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;

@Service
public class SellInfoServiceImpl implements SellInfoService{
	@Autowired
	private SellInfoDao siDao;

	// 1. 나의 판매내역 리스트 조회
	@Override
	public List<DealInfo> selectSellInfoList(int userNo) {
		return siDao.selectSellInfoList(userNo);
	}

	// 2. 나의 판매내역 리스트 사진 조회
	
	// 3_1. 나의 판매내역 상세조회(공통정보)
	@Override
	public DealInfo selectSellInfo(int goodsNo) {
		return siDao.selectSellInfo(goodsNo);
	}

	// 3_2. 나의 판매내역 상세조회(배송지정보)
	@Override
	public BuyerInfo selectBuyerInfo(int goodsNo) {
		return siDao.selectBuyerInfo(goodsNo);
	}

	// 3_2_2. 나의 판매내역 상세조회(추가된 배송지정보)
	@Override
	public BuyerInfo selectBuyerModifyInfo(int goodsNo) {
		return siDao.selectBuyerModifyInfo(goodsNo);
	}

	// 3_3. 나의 판매내역 상세조회(결제정보)
	@Override
	public PaymentInfo selectPaymentInfo(int goodsNo) {
		return siDao.selectPaymentInfo(goodsNo);
	}

	// 3_4. 나의 판매내역 상세조회(정산정보)
	@Override
	public CalculateInfo selectCalculateInfo(int goodsNo) {
		return siDao.selectCalculateInfo(goodsNo);
	}

}
