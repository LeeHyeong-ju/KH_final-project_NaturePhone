package com.kh.naturephone.myPage2.interest.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.myPage2.interest.model.exception.ItdProdException;
import com.kh.naturephone.myPage2.interest.model.service.ItdProdService;
import com.kh.naturephone.myPage2.interest.model.vo.ItdProduct;

@Controller
@RequestMapping("/itd")
public class ItdProdController {
	@Autowired
	private ItdProdService ipService;
	
	// 관심상품 리스트 조회
	@GetMapping("/list")
	public String interestedProdList(Model model, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		
		List<ItdProduct> itdProdList = ipService.selectItdProdList(userNo);
		
		if(itdProdList != null) {
			model.addAttribute("itdProdList", itdProdList);
			return "myPage2/itdProdPage";
		} else {
			model.addAttribute("msg", "나의 관심상품 조회에 실패하였습니다.");
			return "common/errorPage";
		}		
	}
	
	// 관심상품 내역 삭제
	@GetMapping("/delete")
	public String interestDelete(int itdNo) {
		int result = ipService.deleteInterest(itdNo);
		
		if(result > 0) {
			return "redirect:/itd/list";
		} else {
			throw new ItdProdException("관심상품 삭제에 실패하였습니다.");
		}
	}
	
	// 관심상품 검색
	// 관심상품 등록	
	// 물품페이지 연결
	
	

}
