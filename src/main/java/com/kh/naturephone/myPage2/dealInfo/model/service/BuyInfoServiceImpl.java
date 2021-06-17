package com.kh.naturephone.myPage2.dealInfo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.myPage2.dealInfo.model.dao.BuyInfoDao;
import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalendarInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CategoryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DeliveryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.GoodsAtt;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PeriodInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.ReturnInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.SearchKeyword;

@Service
public class BuyInfoServiceImpl implements BuyInfoService{
	@Autowired
	private BuyInfoDao biDao;

	// 나의 구매내역 리스트 조회
	@Override
	public List<DealInfo> selectBuyInfoList(int userNo) {
		return biDao.selectBuyInfoList(userNo);
	}

	// 나의 구매내역 리스트 사진 조회
	@Override
	public List<GoodsAtt> selectAttList() {
		return biDao.selectAttList();
	}

	// 나의 구매내역 상세조회(구매정보)
	@Override
	public DealInfo selectBuyInfo(int goodsNo) {
		return biDao.selectBuyInfo(goodsNo);
	}

	// 나의 구매내역 상세조회(배송지정보)
	@Override
	public BuyerInfo selectBuyerInfo(int goodsNo) {
		return biDao.selectBuyerInfo(goodsNo);
	}

	// 나의 구매내역 상세조회(추가된 배송지정보)
	@Override
	public BuyerInfo selectBuyerModifyInfo(int goodsNo) {
		return biDao.selectBuyerModifyInfo(goodsNo);
	}

	// 나의 구매내역 상세조회(결제정보)
	@Override
	public PaymentInfo selectPaymentInfo(int goodsNo) {
		return biDao.selectPaymentInfo(goodsNo);
	}

	// 나의 구매내역 상세조회(택배정보)
	@Override
	public DeliveryInfo selectDeliveryInfo(int dealNo) {
		return biDao.selectDeliveryInfo(dealNo);
	}

	// 나의 구매내역 상세조회(반품 택배정보)
	@Override
	public DeliveryInfo selectReDeliveryInfo(int dealNo) {
		return biDao.selectReDeliveryInfo(dealNo);
	}
	
	// 나의 구매내역 상세조회(판매자정보)
	@Override
	public Member selectSellerInfo(int goodsNo) {
		return biDao.selectSellerInfo(goodsNo);
	}

	// 나의 구매내역 카테고리별 리스트 조회
	@Override
	public List<DealInfo> selectCategoryList(CategoryInfo category) {
		return biDao.selectCategoryList(category);
	}

	// 나의 구매내역 기간별 리스트 조회 (1, 3, 6개월)
	@Override
	public List<DealInfo> selectMonthsList(PeriodInfo period) {
		return biDao.selectMonthsList(period);
	}

	// 나의 구매내역 기간별 리스트 조회 (datePicker)
	@Override
	public List<DealInfo> selectCalendarList(CalendarInfo calendar) {
		return biDao.selectCalendarList(calendar);
	}

	// 검색한 게시글 리스트 조회
	@Override
	public List<DealInfo> selectSearchList(SearchKeyword word) {
		return biDao.selectSearchList(word);
	}

	// 구매내역 삭제
	@Override
	public int deleteBuyInfo(int dealNo) {
		return biDao.deleteBuyInfo(dealNo);
	}

	// 반품 택배정보 입력
	@Override
	public int insertReDeliveryInfo(DeliveryInfo d) {
		return biDao.insertReDeliveryInfo(d);
	}

	// 반품 택배정보 수정
	@Override
	public int updateReDeliveryInfo(DeliveryInfo d) {
		return biDao.updateReDeliveryInfo(d);
	}

	// 반품정보 입력
	@Override
	public int insertReturnInfo(ReturnInfo r) {
		return biDao.insertReturnInfo(r);
	}

	// 거래진행상태 '반품요청'으로 변경
	@Override
	public int updateProcessReturn(int dealNo) {
		return biDao.updateProcessReturn(dealNo);
	}

	// 거래진행상태 '구매결정완료'로 변경
	@Override
	public int updateProcessDecision(int dealNo) {
		return biDao.updateProcessDecision(dealNo);
	}

	// 나의 구매내역 전체 count
	@Override
	public int allCnt(int userNo) {
		return biDao.allCnt(userNo);
	}

	// 카테고리별 count(배송준비)
	@Override
	public int preparedCnt(int userNo) {
		return biDao.preparedCnt(userNo);
	}

	// 카테고리별 count(배송중)
	@Override
	public int deliveryCnt(int userNo) {
		return biDao.deliveryCnt(userNo);
	}

	// 카테고리별 count(구매결정완료)
	@Override
	public int decisionCnt(int userNo) {
		return biDao.decisionCnt(userNo);
	}

	// 카테고리별 count(반품요청)
	@Override
	public int returnCnt(int userNo) {
		return biDao.returnCnt(userNo);
	}

	// 카테고리별 count(거래완료)
	@Override
	public int finishedCnt(int userNo) {
		return biDao.finishedCnt(userNo);
	}

}
