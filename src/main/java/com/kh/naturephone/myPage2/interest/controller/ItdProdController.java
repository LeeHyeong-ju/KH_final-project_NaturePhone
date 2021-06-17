package com.kh.naturephone.myPage2.interest.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
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
	
	// 관심상품 등록
	@GetMapping("/insert")
	public String interestProdInsert(HttpSession session, String keyword) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		// 선택한 상품 정보 조회
		ItdProduct itdProd = ipService.selectItdProd(keyword);
		itdProd.setUserNo(userNo);
		itdProd.setCarrNo(1);
		
		// 조회된 상품 등록
		int result = ipService.insertInterestProd(itdProd);
		
		if(result > 0) {
			return "redirect:/itd/list";
		} else {
			throw new ItdProdException("관심상품 등록에 실패하였습니다.");
		}
	}
	
	
	
	// 관심상품 검색 - 보류
	@GetMapping("/search")
	public ModelAndView interestProdSearch(String keyword, HttpServletResponse response, ModelAndView mv){
		System.out.println("넘어온 keyword : " + keyword);
		response.setContentType("application/json; charset=utf-8");
		
		List<ItdProduct> phoneList = ipService.selectSearchProdList(keyword);
		System.out.println("검색한 리턴값 : " + phoneList);
		
		mv.addObject("phoneList", new Gson().toJson(phoneList));
		mv.setViewName("jsonView");
		
		return mv;
	}

}
