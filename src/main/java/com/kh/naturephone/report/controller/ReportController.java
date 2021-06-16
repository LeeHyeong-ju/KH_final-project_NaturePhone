package com.kh.naturephone.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.naturephone.report.model.service.ReportService;
import com.kh.naturephone.report.model.vo.Report;

@Controller
@RequestMapping("/report")
public class ReportController {
	@Autowired
	private ReportService rService;
	
	@PostMapping("/insert")
	public String reportInsert(HttpServletRequest request,
							   @ModelAttribute Report r,
							   RedirectAttributes rd,
							   Model model) {
		// 1. 신고 하기
		int result = rService.reportInsert(r);
		if(result > 0) {
			rd.addFlashAttribute("msg", "신고해주셔서 감사합니다.");
			String referer = request.getHeader("Referer");
			return "redirect:"+ referer;
		} else {
			model.addAttribute("msg", "신고 실패");
			return "common/errorPage";
		}
	}
	
}
