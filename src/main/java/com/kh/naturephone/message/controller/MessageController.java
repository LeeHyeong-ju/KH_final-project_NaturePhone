package com.kh.naturephone.message.controller;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
=======
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {
>>>>>>> c78903c143e51903577b3369b6881a2f926e9336

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.message.model.service.MessageService;
import com.kh.naturephone.message.model.vo.Message;
import com.kh.naturephone.message.model.vo.MessageSearch;

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
									@ModelAttribute Message m,
									@SessionAttribute("loginUser") Member loginUser,
									@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount;
		PageInfo pi = null;
		List<Message> list;
		
		if(m.getType().equals("받은 쪽지함")) {
			
			m.setRecipientNo(loginUser.getUserNo());
			listCount = mService.selectListCount(m);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		} else if(m.getType().equals("보낸 쪽지함")) {
			
			m.setSenderNo(loginUser.getUserNo());
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
	
	// 2. 쪽지 상세
	@GetMapping("/detail")
	public String messageDetail(@ModelAttribute Message m,
								@SessionAttribute("loginUser") Member loginUser,
            					Model model) {
		
		Message detailM = mService.selectMessage(m);
		detailM.setType(m.getType());
		model.addAttribute("detailMessage", detailM);
		return "message/messageDetailPage";
		
	}
	
	// 3. 쪽지함 검색
	@GetMapping("/search")
	public String messageSearch(@ModelAttribute(name="message") MessageSearch search,
								@SessionAttribute("loginUser") Member loginUser,
								@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
								Model model) {
		PageInfo pi = null;
		int listCount;
		
		if(search.getType().equals("받은 쪽지함")) {
			
			search.setRecipientNo(loginUser.getUserNo());
			listCount = mService.searchListCount(search);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		} else if(search.getType().equals("보낸 쪽지함")) {
			
			search.setSenderNo(loginUser.getUserNo());
			listCount = mService.searchListCount(search);
			
			pi = Pagination.getPageInfo(currentPage, listCount);
			
		} 
		
		List<Message> searchList = mService.searchList(search, pi);
		
		model.addAttribute("list", searchList);
		model.addAttribute("pi", pi);
		return "message/messagePage";
	}
	
	// 4. 쪽지 삭제(Ajax)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody String messageDelete(@RequestParam(value="ckArr[]") List<Integer> deleteList,
											  @RequestParam(value="type") String type) {
		
		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0; i < deleteList.size(); i++) {
			deleteArray.add(deleteList.get(i));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("deleteArray", deleteArray);
		
		int result = mService.messageDelete(map);
		
		if(result > 0) {
			return "success";
		} else {
			return "error";
		}
	}
	
	// 5. 쪽지 보내기
	@PostMapping("/insert")
	public String messageInsert(HttpServletRequest request,
								@ModelAttribute Message m,
								RedirectAttributes rd,
							    Model model) {
		int result = mService.messageInsert(m);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "쪽지가 성공적으로 보내졌습니다.");
			 String referer = request.getHeader("Referer");
			 return "redirect:"+ referer;
			
		} else {
			model.addAttribute("msg", "쪽지 보내기 실패");
			return "common/errorPage";
		}
	}
	
}
