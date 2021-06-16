package com.kh.naturephone.myPage2.dealInfo.model.dao;

import java.util.List;

import com.kh.naturephone.member.model.vo.Member;
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

public interface BuyInfoDao {

	// 나의 구매내역 리스트 조회
	List<DealInfo> selectBuyInfoList(int userNo);

	// 나의 구매내역 리스트 사진 조회
	List<GoodsAtt> selectAttList();

	// 나의 구매내역 상세조회(구매정보)
	DealInfo selectBuyInfo(int goodsNo);

	// 나의 구매내역 상세조회(배송지정보)
	BuyerInfo selectBuyerInfo(int goodsNo);

	// 나의 구매내역 상세조회(추가된 배송지정보)
	BuyerInfo selectBuyerModifyInfo(int goodsNo);

	// 나의 구매내역 상세조회(결제정보)
	PaymentInfo selectPaymentInfo(int goodsNo);

	// 나의 구매내역 상세조회(택배정보)
	DeliveryInfo selectDeliveryInfo(int dealNo);

	// 나의 구매내역 상세조회(반품 택배정보)
	DeliveryInfo selectReDeliveryInfo(int dealNo);
	
	// 나의 구매내역 상세조회(판매자정보)
	Member selectSellerInfo(int goodsNo);

	// 나의 구매내역 카테고리별 리스트 조회
	List<DealInfo> selectCategoryList(CategoryInfo category);

	// 나의 구매내역 기간별 리스트 조회 (1, 3, 6개월)
	List<DealInfo> selectMonthsList(PeriodInfo period);

	// 나의 구매내역 기간별 리스트 조회 (datePicker)
	List<DealInfo> selectCalendarList(CalendarInfo calendar);

	// 검색한 게시글 리스트 조회
	List<DealInfo> selectSearchList(SearchKeyword word);

	// 구매내역 삭제
	int deleteBuyInfo(int dealNo);

	// 반품 택배정보 입력
	int insertReDeliveryInfo(DeliveryInfo d);

	// 반품 택배정보 수정
	int updateReDeliveryInfo(DeliveryInfo d);

	// 반품정보 입력
	int insertReturnInfo(ReturnInfo r);

	// 거래진행상태 '반품요청'으로 변경
	int updateProcessReturn(int dealNo);

	// 거래진행상태 '구매결정완료'로 변경
	int updateProcessDecision(int dealNo);

}
