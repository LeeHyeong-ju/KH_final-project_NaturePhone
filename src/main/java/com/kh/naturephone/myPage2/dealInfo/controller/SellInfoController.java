package com.kh.naturephone.myPage2.dealInfo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.naturephone.myPage2.dealInfo.model.service.SellInfoService;
import com.kh.naturephone.myPage2.dealInfo.model.vo.BuyerInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.CalculateInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.DealInfo;
import com.kh.naturephone.myPage2.dealInfo.model.vo.PaymentInfo;

@Controller
@RequestMapping("/sellInfo")
public class SellInfoController {
	@Autowired
	private SellInfoService siService;
	
	// 나의 판매내역 리스트 조회
	@GetMapping("/list")
	public String sellInfoList(Model model) {
		int userNo = 3;
		
		List<DealInfo> sellInfolist = siService.selectSellInfoList(userNo);		
		
		if(sellInfolist != null) {
			model.addAttribute("sellInfoList", sellInfolist);
			return "myPage2/sellInfoListPage";
		} else {
			model.addAttribute("msg", "나의 판매내역 조회에 실패하였습니다.");
			return ""; // 에러페이지
		}
	}
	
	// 나의 판매내역 리스트 사진 조회
	
	// 나의 판매내역 상세 페이지 조회
	@GetMapping("/detail")
	public String sellInfoDetail(int goodsNo, Model model) {
		DealInfo si = siService.selectSellInfo(goodsNo);
		BuyerInfo bi = siService.selectBuyerInfo(goodsNo);
		BuyerInfo bmi = siService.selectBuyerModifyInfo(goodsNo);
		PaymentInfo payi = siService.selectPaymentInfo(goodsNo);
		CalculateInfo ci = siService.selectCalculateInfo(goodsNo);		
		
		// + 택배정보(택배정보는 null 가능?)				
		
		if(si != null) {
			model.addAttribute("sellInfo", si);
			model.addAttribute("buyerInfo", bi);
			model.addAttribute("buyerMdfInfo", bmi);
			model.addAttribute("payInfo", payi);
			model.addAttribute("calInfo", ci);			
			return "myPage2/sellInfoDetailPage";
		} else {
			model.addAttribute("msg", "나의 판매내역 상세 페이지 조회에 실패하였습니다.");
			return "";
		}
	}
	
	// 택배정보 입력
	
	
	
	
	
}
