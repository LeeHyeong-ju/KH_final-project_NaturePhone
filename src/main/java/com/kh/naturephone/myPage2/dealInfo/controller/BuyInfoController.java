package com.kh.naturephone.myPage2.dealInfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.myPage2.dealInfo.model.exception.DealInfoException;
import com.kh.naturephone.myPage2.dealInfo.model.service.BuyInfoService;
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

@Controller
@RequestMapping("/buyInfo")
public class BuyInfoController {
	@Autowired
	private BuyInfoService biService;
	
	// 나의 구매내역 리스트 조회
	@GetMapping("/list")
	public String buyInfoList(HttpSession session, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<DealInfo> buyInfoList = biService.selectBuyInfoList(userNo);
		
		// 사진 조회
		List<GoodsAtt> attList = biService.selectAttList();
		
		// 카테고리별 count
		int allCnt = biService.allCnt(userNo);
		int preparedCnt = biService.preparedCnt(userNo);
		int deliveryCnt = biService.deliveryCnt(userNo);
		int decisionCnt = biService.decisionCnt(userNo);
		int returnCnt = biService.returnCnt(userNo);
		int finishedCnt = biService.finishedCnt(userNo);
		
		if(buyInfoList != null) {
			model.addAttribute("buyInfoList", buyInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("preparedCnt", preparedCnt);
			model.addAttribute("deliveryCnt", deliveryCnt);
			model.addAttribute("decisionCnt", decisionCnt);
			model.addAttribute("returnCnt", returnCnt);
			model.addAttribute("finishedCnt", finishedCnt);
			return "myPage2/buyInfoListPage";
		} else {
			model.addAttribute("msg", "나의 구매내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@GetMapping("/detail")
	public String buyInfoDetail(int goodsNo, Model model) {
		DealInfo buyi = biService.selectBuyInfo(goodsNo);
		BuyerInfo bi = biService.selectBuyerInfo(goodsNo);
		BuyerInfo bmi = biService.selectBuyerModifyInfo(goodsNo);
		PaymentInfo payi = biService.selectPaymentInfo(goodsNo);
		DeliveryInfo di = biService.selectDeliveryInfo(bi.getDealNo());
		DeliveryInfo rdi = biService.selectReDeliveryInfo(bi.getDealNo());
		Member seller = biService.selectSellerInfo(goodsNo);
		
		if(buyi != null) {
			model.addAttribute("buyInfo", buyi);
			model.addAttribute("buyerInfo", bi);
			model.addAttribute("buyerMdfInfo", bmi);
			model.addAttribute("payInfo", payi);
			model.addAttribute("delInfo", di);
			model.addAttribute("reDelInfo", rdi);
			model.addAttribute("sellerInfo", seller);
			return "myPage2/buyInfoDetailPage";
		} else {
			model.addAttribute("msg", "나의 구매내역 상세 페이지 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 카테고리별 리스트 조회
	@GetMapping("/sortList")
	public String categoryList(HttpSession session, @RequestParam(value="category") String cate, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();		
		CategoryInfo category = new CategoryInfo(userNo, cate);
		
		List<DealInfo> buyInfoList;
		if(category.getCategory().equals("전체보기")) {
			buyInfoList = biService.selectBuyInfoList(category.getUserNo());
		} else {
			// 그 외 카테고리
			buyInfoList = biService.selectCategoryList(category);
		}
		
		// 사진 조회
		List<GoodsAtt> attList = biService.selectAttList();
		
		// 카테고리별 count
		int allCnt = biService.allCnt(userNo);
		int preparedCnt = biService.preparedCnt(userNo);
		int deliveryCnt = biService.deliveryCnt(userNo);
		int decisionCnt = biService.decisionCnt(userNo);
		int returnCnt = biService.returnCnt(userNo);
		int finishedCnt = biService.finishedCnt(userNo);
		
		if(buyInfoList != null) {
			model.addAttribute("buyInfoList", buyInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("cateInfo", category);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("preparedCnt", preparedCnt);
			model.addAttribute("deliveryCnt", deliveryCnt);
			model.addAttribute("decisionCnt", decisionCnt);
			model.addAttribute("returnCnt", returnCnt);
			model.addAttribute("finishedCnt", finishedCnt);
			return "myPage2/buyInfoListPage";
		} else {
			model.addAttribute("msg", "카테고리별 내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}		
	}

	// 기간별 리스트 조회 (1, 3, 6개월)
	@GetMapping("/months")
	public String monthsList(HttpSession session, int m, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		PeriodInfo period = new PeriodInfo(userNo, m);
		
		List<DealInfo> buyInfoList = biService.selectMonthsList(period);
		
		// 사진 조회
		List<GoodsAtt> attList = biService.selectAttList();
		
		// 카테고리별 count
		int allCnt = biService.allCnt(userNo);
		int preparedCnt = biService.preparedCnt(userNo);
		int deliveryCnt = biService.deliveryCnt(userNo);
		int decisionCnt = biService.decisionCnt(userNo);
		int returnCnt = biService.returnCnt(userNo);
		int finishedCnt = biService.finishedCnt(userNo);
		
		if(buyInfoList != null) {
			model.addAttribute("buyInfoList", buyInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("preparedCnt", preparedCnt);
			model.addAttribute("deliveryCnt", deliveryCnt);
			model.addAttribute("decisionCnt", decisionCnt);
			model.addAttribute("returnCnt", returnCnt);
			model.addAttribute("finishedCnt", finishedCnt);
			return "myPage2/buyInfoListPage";
		} else {
			model.addAttribute("msg", "기간별 내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// 기간별 리스트 조회 (datePicker)
	@GetMapping("/calendar")
	public String calendarList(HttpSession session, String date1, String date2, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		CalendarInfo calendar = new CalendarInfo(userNo, date1, date2);
		
		List<DealInfo> buyInfoList = biService.selectCalendarList(calendar);
		
		// 사진 조회
		List<GoodsAtt> attList = biService.selectAttList();
		
		// 카테고리별 count
		int allCnt = biService.allCnt(userNo);
		int preparedCnt = biService.preparedCnt(userNo);
		int deliveryCnt = biService.deliveryCnt(userNo);
		int decisionCnt = biService.decisionCnt(userNo);
		int returnCnt = biService.returnCnt(userNo);
		int finishedCnt = biService.finishedCnt(userNo);
				
		if(buyInfoList != null) {
			model.addAttribute("buyInfoList", buyInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("preparedCnt", preparedCnt);
			model.addAttribute("deliveryCnt", deliveryCnt);
			model.addAttribute("decisionCnt", decisionCnt);
			model.addAttribute("returnCnt", returnCnt);
			model.addAttribute("finishedCnt", finishedCnt);
			return "myPage2/buyInfoListPage";
		} else {
			model.addAttribute("msg", "기간별 내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 검색한 게시글 리스트 조회
	@GetMapping("/searchList")
	public String searchBuyInfoList(HttpSession session, String keyword, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		SearchKeyword word = new SearchKeyword(userNo, keyword);
		
		List<DealInfo> buyInfoList = biService.selectSearchList(word);
		
		// 사진 조회
		List<GoodsAtt> attList = biService.selectAttList();
		
		// 카테고리별 count
		int allCnt = biService.allCnt(userNo);
		int preparedCnt = biService.preparedCnt(userNo);
		int deliveryCnt = biService.deliveryCnt(userNo);
		int decisionCnt = biService.decisionCnt(userNo);
		int returnCnt = biService.returnCnt(userNo);
		int finishedCnt = biService.finishedCnt(userNo);
		
		if(buyInfoList != null) {
			model.addAttribute("buyInfoList", buyInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("preparedCnt", preparedCnt);
			model.addAttribute("deliveryCnt", deliveryCnt);
			model.addAttribute("decisionCnt", decisionCnt);
			model.addAttribute("returnCnt", returnCnt);
			model.addAttribute("finishedCnt", finishedCnt);
			return "myPage2/buyInfoListPage";
		} else {
			model.addAttribute("msg", "나의 구매내역 검색에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 내역삭제				
	@GetMapping("/delete")
	public String buyInfoDelete(int dealNo) {
		int result = biService.deleteBuyInfo(dealNo);
		
		if(result > 0) {
			return "redirect:/buyInfo/list";
		} else {
			throw new DealInfoException("구매내역 삭제에 실패하였습니다.");
		}
	}
	
	// 택배정보 입력(반품)
	@PostMapping("/reDelInsert")
	public String reDeliveryInfoInsert(DeliveryInfo d, int goodsNo) {
		int result = biService.insertReDeliveryInfo(d);		
		
		if(result > 0) {
			return "redirect:/buyInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("반품 배송 정보 등록에 실패하였습니다.");
		}
	}	
	
	// 택배정보 수정(반품)
	// 택배정보 수정
	@PostMapping("/reDelUpdate")
	public String reDeliveryInfoUpdate(DeliveryInfo d, int goodsNo) {		
		int result = biService.updateReDeliveryInfo(d);
		
		if(result > 0) {
			return "redirect:/buyInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("반품 배송 정보 수정에 실패하였습니다.");
		}
	}		
	
	// 반품정보 입력
	@PostMapping("/returnInsert")
	public String returnInfoInsert(ReturnInfo r) {
		int result1 = biService.insertReturnInfo(r);
		
		// 거래진행상태 '반품요청'으로 변경
		int result2 = biService.updateProcessReturn(r.getDealNo());
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:/buyInfo/detail?goodsNo=" + r.getGoodsNo();
		} else {
			throw new DealInfoException("반품 정보 등록에 실패하였습니다.");
		}
	}
	
	// 거래진행상태 '구매결정완료'로 변경
	@GetMapping("/decisionUpdate")
	public String processDecisionUpdate(int dealNo, int goodsNo) {
		int result = biService.updateProcessDecision(dealNo);
		
		if(result > 0) {
			return "redirect:/buyInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("구매결정완료에 실패하였습니다.");
		}
	}
	
}
