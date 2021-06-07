package com.kh.naturephone.message.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.message.model.service.MessageService;
import com.kh.naturephone.message.model.vo.Message;

@Controller
@RequestMapping("/message")
@SessionAttributes({ "loginUser" })
public class MessageController {
	@Autowired
	private MessageService mService;
	
	/*--------------------- 페이징 처리 ---------------------*/
	
	// 1. 게시글 수 카운트
	@GetMapping("/selectList")
	public ModelAndView messageList(ModelAndView mv, 
									String type, 
									@SessionAttribute("loginUser") Member loginUser,
									@ModelAttribute Message m,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount;
		PageInfo pi = null;
		List<Message> list;
		
		if(type.equals("받은 쪽지함")) {
			
			m.setRecipientNo(loginUser.getUserNo());
			
			listCount = mService.selectListCount(m);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		} else if(type.equals("보낸 쪽지함")) {
			
			m.setSenderNo(loginUser.getUserNo());
			
			listCount = mService.selectListCount(m);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		} else if(type.equals("보관함") || type.equals("휴지통")) {
			m.setDivisionNo(loginUser.getUserNo());
			listCount = mService.selectListCount(m);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		}
		
		
		list = mService.selectList(m, pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("message/messagePage");
		} 
		return mv;
	}
	
	// 1. 쪽지함 목록 조회
	//@GetMappng("")
}
