package com.kh.naturephone.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.naturephone.admin.model.service.AdminService;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.support.controller.SupportController;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService aService;

	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@GetMapping("/memberList")
	public ModelAndView adminPageView(ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
			// 게시글 개수 구하기
			int listCount = aService.selectMemberListCount();
			
			// PageInfo 객체 생성
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			// 요청페이지에 맞는 게시글 리스트 조회
			List<Member> mlist = aService.selectMemberList(pi);
			
			if(mlist != null) {
				mv.addObject("mlist", mlist);
				mv.addObject("pi", pi);
				mv.setViewName("admin/adminMemberPage");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}
	
}













