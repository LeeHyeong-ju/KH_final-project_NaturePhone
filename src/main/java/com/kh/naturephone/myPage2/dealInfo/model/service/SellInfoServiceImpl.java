package com.kh.naturephone.myPage2.dealInfo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.myPage2.dealInfo.model.dao.SellInfoDao;
import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalculateInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalendarInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CategoryCount;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CategoryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DeliveryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.GoodsAtt;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PeriodInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.SearchKeyword;

@Service
public class SellInfoServiceImpl implements SellInfoService{
	@Autowired
	private SellInfoDao siDao;

	// 나의 판매내역 리스트 조회
	@Override
	public List<DealInfo> selectSellInfoList(int userNo) {
		return siDao.selectSellInfoList(userNo);
	}

	// 나의 판매내역 리스트 사진 조회
	@Override
	public List<GoodsAtt> selectAttList() {
		return siDao.selectAttList();
	}
	
	// 나의 판매내역 상세조회(공통정보)
	@Override
	public DealInfo selectSellInfo(int goodsNo) {
		return siDao.selectSellInfo(goodsNo);
	}

	// 나의 판매내역 상세조회(배송지정보)
	@Override
	public BuyerInfo selectBuyerInfo(int goodsNo) {
		return siDao.selectBuyerInfo(goodsNo);
	}

	// 나의 판매내역 상세조회(추가된 배송지정보)
	@Override
	public BuyerInfo selectBuyerModifyInfo(int goodsNo) {
		return siDao.selectBuyerModifyInfo(goodsNo);
	}

	// 나의 판매내역 상세조회(결제정보)
	@Override
	public PaymentInfo selectPaymentInfo(int goodsNo) {
		return siDao.selectPaymentInfo(goodsNo);
	}

	// 나의 판매내역 상세조회(정산정보)
	@Override
	public CalculateInfo selectCalculateInfo(int goodsNo) {
		return siDao.selectCalculateInfo(goodsNo);
	}

	// 나의 판매내역 상세조회(택배정보)
	@Override
	public DeliveryInfo selectDeliveryInfo(int dealNo) {
		return siDao.selectDeliveryInfo(dealNo);
	}
	
	// 나의 판매내역 상세조회(반품 택배정보)
	@Override
	public DeliveryInfo selectReDeliveryInfo(int dealNo) {
		return siDao.selectReDeliveryInfo(dealNo);
	}

	// 나의 판매내역 카테고리별 리스트 조회
	@Override
	public List<DealInfo> selectCategoryList(CategoryInfo category) {
		return siDao.selectCategoryList(category);
	}
	
	// 나의 판매내역 전체 count
	@Override
	public int allCnt(int userNo) {
		return siDao.allCnt(userNo);
	}

	// 나의 판매내역 카테고리별 count
	@Override
	public List<CategoryCount> categoryCnt(int userNo) {
		return siDao.categoryCnt(userNo);
	}

	// 나의 판매내역 기간별 리스트 조회 (1, 3, 6개월)
	@Override
	public List<DealInfo> selectMonthsList(PeriodInfo period) {
		return siDao.selectMonthsList(period);
	}

	// 나의 판매내역 기간별 리스트 조회 (datePicker)
	@Override
	public List<DealInfo> selectCalendarList(CalendarInfo calendar) {
		return siDao.selectCalendarList(calendar);
	}

	// 택배정보 입력
	@Override
	public int insertDeliveryInfo(DeliveryInfo d) {
		return siDao.insertDeliveryInfo(d);
	}

	// 거래진행상태 '배송'으로 변경
	@Override
	public int updateProgressDel(int dealNo) {
		return siDao.updateProgressDel(dealNo);
	}

	// 택배정보 수정
	@Override
	public int updateDeliveryInfo(DeliveryInfo d) {
		return siDao.updateDeliveryInfo(d);
	}

	// 검색한 게시글 리스트 조회
	@Override
	public List<DealInfo> selectSearchList(SearchKeyword word) {
		return siDao.selectSearchList(word);
	}

	// 정산정보 수정
	@Override
	public int updateCalculateInfo(CalculateInfo c) {
		return siDao.updateCalculateInfo(c);
	}

	// 판매내역 삭제
	@Override
	public int deleteSellInfo(int dealNo) {
		return siDao.deleteSellInfo(dealNo);
	}

	// 거래진행상태 '환불예정'으로 변경
	@Override
	public int updateProcessRefund(int dealNo) {
		return siDao.updateProcessRefund(dealNo);
	}

	// 거래진행상태 '반품보류'로 변경
	@Override
	public int updateProcessHold(int dealNo) {
		return siDao.updateProcessHold(dealNo);
	}	

}
