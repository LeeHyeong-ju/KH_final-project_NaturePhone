package com.kh.naturephone.myPage2.dealInfo.model.dao;

import java.util.List;

import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalculateInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;

public interface SellInfoDao {

	// 1. 나의 판매내역 리스트 조회
	List<DealInfo> selectSellInfoList(int userNo);
	
	// 2. 나의 판매내역 리스트 사진 조회
	
	// 3_1. 나의 판매내역 상세조회(공통정보)
	DealInfo selectSellInfo(int goodsNo);

	// 3_2. 나의 판매내역 상세조회(배송지정보)
	BuyerInfo selectBuyerInfo(int goodsNo);

	// 3_2_2. 나의 판매내역 상세조회(추가된 배송지정보)
	BuyerInfo selectBuyerModifyInfo(int goodsNo);

	// 3_3. 나의 판매내역 상세조회(결제정보)
	PaymentInfo selectPaymentInfo(int goodsNo);

	// 3_4. 나의 판매내역 상세조회(정산정보)
	CalculateInfo selectCalculateInfo(int goodsNo);	
	
}
