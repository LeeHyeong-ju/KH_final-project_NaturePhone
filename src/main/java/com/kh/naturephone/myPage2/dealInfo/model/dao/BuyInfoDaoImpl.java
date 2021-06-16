package com.kh.naturephone.myPage2.dealInfo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class BuyInfoDaoImpl implements BuyInfoDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 나의 구매내역 리스트 조회
	@Override
	public List<DealInfo> selectBuyInfoList(int userNo) {
		return sqlSession.selectList("buyInfoMapper.selectBuyInfoList", userNo);
	}

	// 나의 구매내역 리스트 사진 조회
	@Override
	public List<GoodsAtt> selectAttList() {
		return sqlSession.selectList("buyInfoMapper.selectAttList");
	}

	// 나의 구매내역 상세조회(구매정보)
	@Override
	public DealInfo selectBuyInfo(int goodsNo) {
		return sqlSession.selectOne("buyInfoMapper.selectBuyInfo", goodsNo);
	}

	// 나의 구매내역 상세조회(배송지정보)
	@Override
	public BuyerInfo selectBuyerInfo(int goodsNo) {
		return sqlSession.selectOne("buyInfoMapper.selectBuyerInfo", goodsNo);
	}

	// 나의 구매내역 상세조회(추가된 배송지정보)
	@Override
	public BuyerInfo selectBuyerModifyInfo(int goodsNo) {
		return sqlSession.selectOne("buyInfoMapper.selectBuyerModifyInfo", goodsNo);
	}

	// 나의 구매내역 상세조회(결제정보)
	@Override
	public PaymentInfo selectPaymentInfo(int goodsNo) {
		return sqlSession.selectOne("buyInfoMapper.selectPaymentInfo", goodsNo);
	}

	// 나의 구매내역 상세조회(택배정보)
	@Override
	public DeliveryInfo selectDeliveryInfo(int dealNo) {
		return sqlSession.selectOne("buyInfoMapper.selectDeliveryInfo", dealNo);
	}

	// 나의 구매내역 상세조회(반품 택배정보)
	@Override
	public DeliveryInfo selectReDeliveryInfo(int dealNo) {
		return sqlSession.selectOne("buyInfoMapper.selectReDeliveryInfo", dealNo);
	}
	
	// 나의 구매내역 상세조회(판매자정보)
	@Override
	public Member selectSellerInfo(int goodsNo) {
		return sqlSession.selectOne("buyInfoMapper.selectSellerInfo", goodsNo);
	}

	// 나의 구매내역 카테고리별 리스트 조회
	@Override
	public List<DealInfo> selectCategoryList(CategoryInfo category) {
		return sqlSession.selectList("buyInfoMapper.selectCategoryList", category);
	}

	// 나의 구매내역 기간별 리스트 조회 (1, 3, 6개월)
	@Override
	public List<DealInfo> selectMonthsList(PeriodInfo period) {
		return sqlSession.selectList("buyInfoMapper.selectMonthsList", period);
	}

	// 나의 구매내역 기간별 리스트 조회 (datePicker)
	@Override
	public List<DealInfo> selectCalendarList(CalendarInfo calendar) {
		return sqlSession.selectList("buyInfoMapper.selectCalendarList", calendar);
	}

	// 검색한 게시글 리스트 조회
	@Override
	public List<DealInfo> selectSearchList(SearchKeyword word) {
		return sqlSession.selectList("buyInfoMapper.selectSearchList", word);
	}

	// 구매내역 삭제
	@Override
	public int deleteBuyInfo(int dealNo) {
		return sqlSession.update("buyInfoMapper.deleteBuyInfo", dealNo);
	}

	// 반품 택배정보 입력
	@Override
	public int insertReDeliveryInfo(DeliveryInfo d) {
		return sqlSession.insert("buyInfoMapper.insertReDeliveryInfo", d);
	}

	// 반품 택배정보 수정
	@Override
	public int updateReDeliveryInfo(DeliveryInfo d) {
		return sqlSession.update("buyInfoMapper.updateReDeliveryInfo", d);
	}

	// 반품정보 입력
	@Override
	public int insertReturnInfo(ReturnInfo r) {
		return sqlSession.insert("buyInfoMapper.insertReturnInfo", r);
	}

	// 거래진행상태 '반품요청'으로 변경
	@Override
	public int updateProcessReturn(int dealNo) {
		return sqlSession.update("buyInfoMapper.updateProcessReturn", dealNo);
	}

	// 거래진행상태 '구매결정완료'로 변경
	@Override
	public int updateProcessDecision(int dealNo) {
		return sqlSession.update("buyInfoMapper.updateProcessDecision", dealNo);
	}

}
