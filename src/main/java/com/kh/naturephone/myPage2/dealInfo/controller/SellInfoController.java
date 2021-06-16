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
import com.kh.naturephone.myPage2.dealInfo.model.service.SellInfoService;
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

@Controller
@RequestMapping("/sellInfo")
public class SellInfoController {
	@Autowired
	private SellInfoService siService;
	
	// 나의 판매내역 리스트 조회
	@GetMapping("/list")
	public String sellInfoList(HttpSession session, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		List<DealInfo> sellInfoList = siService.selectSellInfoList(userNo);
		
		// 사진 조회
		List<GoodsAtt> attList = siService.selectAttList();
		
		// 카테고리별 count
		int allCnt = siService.allCnt(userNo);
		List<CategoryCount> cntList = siService.categoryCnt(userNo);
		
		if(sellInfoList != null) {
			model.addAttribute("sellInfoList", sellInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("cntList", cntList);
			return "myPage2/sellInfoListPage";
		} else {
			model.addAttribute("msg", "나의 판매내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 나의 판매내역 상세 페이지 조회
	@GetMapping("/detail")
	public String sellInfoDetail(int goodsNo, Model model) {
		DealInfo si = siService.selectSellInfo(goodsNo);
		BuyerInfo bi = siService.selectBuyerInfo(goodsNo);
		BuyerInfo bmi = siService.selectBuyerModifyInfo(goodsNo);
		PaymentInfo payi = siService.selectPaymentInfo(goodsNo);
		CalculateInfo ci = siService.selectCalculateInfo(goodsNo);
		DeliveryInfo di = siService.selectDeliveryInfo(bi.getDealNo());
		DeliveryInfo rdi = siService.selectReDeliveryInfo(bi.getDealNo());
		
		if(si != null) {
			model.addAttribute("sellInfo", si);
			model.addAttribute("buyerInfo", bi);
			model.addAttribute("buyerMdfInfo", bmi);
			model.addAttribute("payInfo", payi);
			model.addAttribute("calInfo", ci);
			model.addAttribute("delInfo", di);
			model.addAttribute("reDelInfo", rdi);
			return "myPage2/sellInfoDetailPage";
		} else {
			model.addAttribute("msg", "나의 판매내역 상세 페이지 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 카테고리별 리스트 조회
	@GetMapping("/sortList")
	public String categoryList(HttpSession session, @RequestParam(value="category") String cate, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();		
		CategoryInfo category = new CategoryInfo(userNo, cate);
		
		List<DealInfo> sellInfoList;
		if(category.getCategory().equals("전체보기")) {
			sellInfoList = siService.selectSellInfoList(category.getUserNo());
		} else {
			// 그 외 카테고리
			sellInfoList = siService.selectCategoryList(category);
		}
		
		// 사진 조회
		List<GoodsAtt> attList = siService.selectAttList();
		
		// 카테고리별 count
		int allCnt = siService.allCnt(userNo);
		List<CategoryCount> cntList = siService.categoryCnt(userNo);
		
		if(sellInfoList != null) {
			model.addAttribute("sellInfoList", sellInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("cateInfo", category);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("cntList", cntList);
			return "myPage2/sellInfoListPage";
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
		
		List<DealInfo> sellInfoList = siService.selectMonthsList(period);
		
		// 사진 조회
		List<GoodsAtt> attList = siService.selectAttList();
		
		// 카테고리별 count
		int allCnt = siService.allCnt(userNo);
		List<CategoryCount> cntList = siService.categoryCnt(userNo);
		
		if(sellInfoList != null) {
			model.addAttribute("sellInfoList", sellInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("cntList", cntList);
			return "myPage2/sellInfoListPage";
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
		
		List<DealInfo> sellInfoList = siService.selectCalendarList(calendar);
		
		// 사진 조회
		List<GoodsAtt> attList = siService.selectAttList();
		
		// 카테고리별 count
		int allCnt = siService.allCnt(userNo);
		List<CategoryCount> cntList = siService.categoryCnt(userNo);
				
		if(sellInfoList != null) {
			model.addAttribute("sellInfoList", sellInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("cntList", cntList);
			return "myPage2/sellInfoListPage";
		} else {
			model.addAttribute("msg", "기간별 내역 조회에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 택배정보 입력(판매)
	@PostMapping("/delInsert")
	public String deliveryInfoInsert(DeliveryInfo d, int goodsNo) {		
		int result1 = siService.insertDeliveryInfo(d);
		
		// 거래진행상태 '배송'으로 변경
		int result2 = siService.updateProgressDel(d.getDealNo());		
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:/sellInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("배송 정보 등록에 실패하였습니다.");
		}
	}
	
	// 택배정보 수정
	@PostMapping("/delUpdate")
	public String deliveryInfoUpdate(DeliveryInfo d, int goodsNo) {		
		int result = siService.updateDeliveryInfo(d);
		
		if(result > 0) {
			return "redirect:/sellInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("배송 정보 수정에 실패하였습니다.");
		}
	}			
	
	// 검색한 게시글 리스트 조회
	@GetMapping("/searchList")
	public String searchSellInfoList(HttpSession session, String keyword, Model model) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		SearchKeyword word = new SearchKeyword(userNo, keyword);
		
		List<DealInfo> sellInfoList = siService.selectSearchList(word);
		
		// 사진 조회
		List<GoodsAtt> attList = siService.selectAttList();
		
		// 카테고리별 count
		int allCnt = siService.allCnt(userNo);
		List<CategoryCount> cntList = siService.categoryCnt(userNo);
		
		if(sellInfoList != null) {
			model.addAttribute("sellInfoList", sellInfoList);
			model.addAttribute("attList", attList);
			model.addAttribute("allCnt", allCnt);
			model.addAttribute("cntList", cntList);
			return "myPage2/sellInfoListPage";
		} else {
			model.addAttribute("msg", "나의 판매내역 검색에 실패하였습니다.");
			return "common/errorPage";
		}
	}
		
	// 정산정보 수정
	@PostMapping("/calUpdate")
	public String calculateInfoUpdate(CalculateInfo c) {
		int result = siService.updateCalculateInfo(c);
		
		if(result > 0) {
			return "redirect:/sellInfo/detail?goodsNo=" + c.getGoodsNo();
		} else {
			throw new DealInfoException("정산 정보 수정에 실패하였습니다.");
		}
	}
		
	// 내역삭제				
	@GetMapping("/delete")
	public String sellInfoDelete(int dealNo) {
		int result = siService.deleteSellInfo(dealNo);
		
		if(result > 0) {
			return "redirect:/sellInfo/list";
		} else {
			throw new DealInfoException("판매내역 삭제에 실패하였습니다.");
		}
	}
	
	// 거래진행상태 '환불예정'으로 변경
	@GetMapping("/refundUpdate")
	public String processRefundUpdate(int dealNo, int goodsNo) {
		int result = siService.updateProcessRefund(dealNo);
		
		if(result > 0) {
			return "redirect:/sellInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("반품승인에 실패하였습니다.");
		}
	}
	
	// 거래진행상태 '반품보류'로 변경
	@GetMapping("/holdUpdate")
	public String processHoldUpdate(int dealNo, int goodsNo) {
		int result = siService.updateProcessHold(dealNo);
		
		if(result > 0) {
			return "redirect:/sellInfo/detail?goodsNo=" + goodsNo;
		} else {
			throw new DealInfoException("반품거부에 실패하였습니다.");
		}
	}
	
}
