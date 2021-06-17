package com.kh.naturephone.myPage2.dealInfo.model.service;

import java.util.List;

import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalculateInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalendarInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CategoryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DeliveryInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.GoodsAtt;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PeriodInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.SearchKeyword;

public interface SellInfoService {

	// 나의 판매내역 리스트 조회
	List<DealInfo> selectSellInfoList(int userNo);

	// 나의 판매내역 리스트 사진 조회
	List<GoodsAtt> selectAttList();
	
	// 나의 판매내역 상세조회(판매정보)
	DealInfo selectSellInfo(int goodsNo);

	// 나의 판매내역 상세조회(배송지정보)
	BuyerInfo selectBuyerInfo(int goodsNo);

	// 나의 판매내역 상세조회(추가된 배송지정보)
	BuyerInfo selectBuyerModifyInfo(int goodsNo);

	// 나의 판매내역 상세조회(결제정보)
	PaymentInfo selectPaymentInfo(int goodsNo);

	// 나의 판매내역 상세조회(정산정보)
	CalculateInfo selectCalculateInfo(int goodsNo);

	// 나의 판매내역 상세조회(택배정보)
	DeliveryInfo selectDeliveryInfo(int dealNo);
	
	// 나의 판매내역 상세조회(반품 택배정보)
	DeliveryInfo selectReDeliveryInfo(int dealNo);

	// 나의 판매내역 카테고리별 리스트 조회
	List<DealInfo> selectCategoryList(CategoryInfo category);

	// 나의 판매내역 전체 count
	int allCnt(int userNo);

	// 나의 판매내역 기간별 리스트 조회 (1, 3, 6개월)
	List<DealInfo> selectMonthsList(PeriodInfo period);

	// 나의 판매내역 기간별 리스트 조회 (datePicker)
	List<DealInfo> selectCalendarList(CalendarInfo calendar);

	// 택배정보 입력
	int insertDeliveryInfo(DeliveryInfo d);

	// 거래진행상태 '배송'으로 변경
	int updateProgressDel(int dealNo);

	// 택배정보 수정
	int updateDeliveryInfo(DeliveryInfo d);

	// 검색한 게시글 리스트 조회
	List<DealInfo> selectSearchList(SearchKeyword word);

	// 정산정보 수정
	int updateCalculateInfo(CalculateInfo c);

	// 판매내역 삭제
	int deleteSellInfo(int dealNo);

	// 거래진행상태 '환불예정'으로 변경
	int updateProcessRefund(int dealNo);

	// 거래진행상태 '반품보류'로 변경
	int updateProcessHold(int dealNo);

	// 카테고리별 count(배송준비)
	int preparedCnt(int userNo);

	// 카테고리별 count(배송중)
	int deliveryCnt(int userNo);

	// 카테고리별 count(구매결정완료)
	int decisionCnt(int userNo);

	// 카테고리별 count(반품요청)
	int returnCnt(int userNo);

	// 카테고리별 count(거래완료)
	int finishedCnt(int userNo);		
	
}
