package com.kh.naturephone.support.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.naturephone.support.model.service.SupportService;
import com.kh.naturephone.support.model.vo.Phone;

@Controller
@RequestMapping("/support")
public class SupportController {
	@Autowired
	private SupportService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@GetMapping("/compare")
	public String supportCompareView(Model model) {
		String display = "none";
		model.addAttribute("display", display);
		return "support/supportCompare";
	}
	
	@GetMapping("/quote")
	public String supportQuoteView() {
		return "support/supportQuote";
	}
	
	@PostMapping(value="/selectPhone", produces="application/json; charset=utf-8")
	public @ResponseBody String selectPhone(Phone p) {
		List<Phone> plist = null;
		
		if(!(p.getMaker() == "제조사 선택" && p.getCarrname() == "통신사 선택")) {
			plist = sService.selectPhoneList(p);
		}
		
		Gson gson = new GsonBuilder()
						.setDateFormat("yyyy-MM-dd")
						.create();
		
		return gson.toJson(plist);
	}
	
	@GetMapping("/compareInfo")
	public String supportCompareInfo(int[] proNums, Model model) {
		List<Integer> pnos = Arrays.stream(proNums).boxed().collect(Collectors.toList());
		
		List<Phone> clist = sService.selectCompareInfo(pnos);
		String display = "block";
		
		if(clist != null) {
			model.addAttribute("clist", clist);
			model.addAttribute("display", display);
			return "support/supportCompare";
		} else {
			model.addAttribute("msg", "게시글 상세보기에 실패하였습니다.");
			return "common/errorPage";
		}
	}

}
