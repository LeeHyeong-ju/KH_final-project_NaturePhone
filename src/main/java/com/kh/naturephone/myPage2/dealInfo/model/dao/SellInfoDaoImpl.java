package com.kh.naturephone.myPage2.dealInfo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class SellInfoDaoImpl implements SellInfoDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 나의 판매내역 리스트 조회
	@Override
	public List<DealInfo> selectSellInfoList(int userNo) {
		return sqlSession.selectList("sellInfoMapper.selectSellInfoList", userNo);
	}

	// 나의 판매내역 리스트 사진 조회
	@Override
	public List<GoodsAtt> selectAttList() {
		return sqlSession.selectList("sellInfoMapper.selectAttList");
	}
	
	// 나의 판매내역 상세조회(공통정보)
	@Override
	public DealInfo selectSellInfo(int goodsNo) {
		return sqlSession.selectOne("sellInfoMapper.selectSellInfo", goodsNo);
	}

	// 나의 판매내역 상세조회(배송지정보)
	@Override
	public BuyerInfo selectBuyerInfo(int goodsNo) {
		return sqlSession.selectOne("sellInfoMapper.selectBuyerInfo", goodsNo);
	}

	// 나의 판매내역 상세조회(추가된 배송지정보)
	@Override
	public BuyerInfo selectBuyerModifyInfo(int goodsNo) {
		return sqlSession.selectOne("sellInfoMapper.selectBuyerModifyInfo", goodsNo);
	}

	// 나의 판매내역 상세조회(결제정보)
	@Override
	public PaymentInfo selectPaymentInfo(int goodsNo) {
		return sqlSession.selectOne("sellInfoMapper.selectPaymentInfo", goodsNo);
	}

	// 나의 판매내역 상세조회(정산정보)
	@Override
	public CalculateInfo selectCalculateInfo(int goodsNo) {
		return sqlSession.selectOne("sellInfoMapper.selectCalculateInfo", goodsNo);
	}

	// 나의 판매내역 상세조회(택배정보)
	@Override
	public DeliveryInfo selectDeliveryInfo(int dealNo) {
		return sqlSession.selectOne("sellInfoMapper.selectDeliveryInfo", dealNo);		
	}
	
	// 나의 판매내역 상세조회(반품 택배정보)
	@Override
	public DeliveryInfo selectReDeliveryInfo(int dealNo) {
		return sqlSession.selectOne("sellInfoMapper.selectReDeliveryInfo", dealNo);
	}

	// 나의 판매내역 카테고리별 리스트 조회
	@Override
	public List<DealInfo> selectCategoryList(CategoryInfo category) {
		return sqlSession.selectList("sellInfoMapper.selectCategoryList", category);
	}
	
	// 나의 판매내역 전체 count
	@Override
	public int allCnt(int userNo) {
		return sqlSession.selectOne("sellInfoMapper.allCnt", userNo);
	}

	// 나의 판매내역 카테고리별 count
	@Override
	public List<CategoryCount> categoryCnt(int userNo) {
		return sqlSession.selectList("sellInfoMapper.categoryCnt", userNo);
	}

	// 나의 판매내역 기간별 리스트 조회 (1, 3, 6개월)
	@Override
	public List<DealInfo> selectMonthsList(PeriodInfo period) {
		return sqlSession.selectList("sellInfoMapper.selectMonthsList", period);
	}

	// 나의 판매내역 기간별 리스트 조회 (datePicker)
	@Override
	public List<DealInfo> selectCalendarList(CalendarInfo calendar) {
		return sqlSession.selectList("sellInfoMapper.selectCalendarList", calendar);
	}

	// 택배정보 입력
	@Override
	public int insertDeliveryInfo(DeliveryInfo d) {
		return sqlSession.insert("sellInfoMapper.insertDeliveryInfo", d);
	}

	// 거래진행상태 '배송'으로 변경
	@Override
	public int updateProgressDel(int dealNo) {
		return sqlSession.update("sellInfoMapper.updateProgressDel", dealNo);
	}

	// 택배정보 수정
	@Override
	public int updateDeliveryInfo(DeliveryInfo d) {
		return sqlSession.update("sellInfoMapper.updateDeliveryInfo", d);
	}

	// 검색한 게시글 리스트 조회
	@Override
	public List<DealInfo> selectSearchList(SearchKeyword word) {
		return sqlSession.selectList("sellInfoMapper.selectSearchList", word);
	}

	// 정산정보 수정
	@Override
	public int updateCalculateInfo(CalculateInfo c) {
		return sqlSession.update("sellInfoMapper.updateCalculateInfo", c);
	}

	// 판매내역 삭제
	@Override
	public int deleteSellInfo(int dealNo) {
		return sqlSession.update("sellInfoMapper.deleteSellInfo", dealNo);
	}			

}
