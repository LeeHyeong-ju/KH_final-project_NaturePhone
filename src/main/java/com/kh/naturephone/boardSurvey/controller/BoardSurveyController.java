package com.kh.naturephone.boardSurvey.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.naturephone.boardSurvey.model.exception.BoardSurveyException;
import com.kh.naturephone.boardSurvey.model.service.BoardSurveyService;
import com.kh.naturephone.boardSurvey.model.vo.S_Detail_TB;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.member.model.vo.Member;

@Controller
@RequestMapping("/boardSurvey")
public class BoardSurveyController {
	
	@Autowired
	private BoardSurveyService bService;
		
	@GetMapping("/list")
	public ModelAndView boardList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage
				) {

			int listCount = bService.selectListCount();
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
			List<Survey_TB> list = bService.selectList(pi);			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
			
				mv.setViewName("board/boardSurveyList");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
				
	// 게시글 작성 페이지로 이동
	@GetMapping("/write")
	public String writePageView() {
	
		return "board/boardSurveyInsert";
	}
	
	// 게시글 작성 
	@PostMapping("/insert")
	public String boardInsert(Survey_TB board,
							  S_Detail_TB sDetail,
							@RequestParam("surveytext1") String surveytext1,
							@RequestParam("surveytext2") String surveytext2,					
							Model model, 
							HttpSession session) {
					
			Member loginUser = (Member)session.getAttribute("loginUser");
			board.setUserNo(loginUser.getUserNo());
			board.setScategory("설문");
			
			
			int result = bService.insertBoard(board);
			
			  sDetail.setDe_choice(surveytext1);
			  int result1 = bService.insertBoardDetail(sDetail);
			
			  sDetail.setDe_choice(surveytext2);
			  int result2 = bService.insertBoardDetail(sDetail);
				

				if((result&result1&result2) > 0) {	

					return "redirect:/boardSurvey/list";
										
				} else {
					throw new BoardSurveyException("게시글 등록에 실패했습니다.");	
				}	
	}
	// 게시글 상세 페이지
		@GetMapping("/detail")
		public String boardDetail(int s_no,
								  HttpServletRequest request,
								  HttpServletResponse response,
								  Model model) {
			boolean flagblist = false; // blist라는 이름의 쿠키가 있는지 확인
			boolean flagbno = false; // blist 안에 해당 bid가 포함되어 있는지 확인

			Cookie[] cookies = request.getCookies();
			try {
				if(cookies != null) {
					for(Cookie c : cookies) {
						// 읽은 게시글의 bno를 모아서 보관하는 blist가 쿠키 안에 있다면
						if(c.getName().equals("blist")) {
							flagblist = true;
							// 기존 쿠키 값 먼저 읽어옴(, 등의 특수문자 인코딩때문에 decode 처리)
							String blist = URLDecoder.decode(c.getValue(), "UTF-8");
							// , 구분자 기준으로 나누기
							String[] list = blist.split(",");
							for(String st : list) {
								// 쿠키 안에 지금 클릭한 게시글의 bno가 들어있다면 => 읽었음을 표시
								if(st.equals(String.valueOf(s_no))) flagbno = true;
							}
							if(!flagbno) { // 게시글을 읽지 않았다면
								// 지금 게시글을 읽었다는 의미로 blist에 bno를 추가해서 인코딩한 문자로 쿠키값을 새롭게 설정
								c.setValue(URLEncoder.encode(blist + "," + s_no, "UTF-8"));
								response.addCookie(c); // 응답에 담아 보냄
							}
						}
					}				
					if(!flagblist) { // blist라는 쿠키가 존재하지 않는 경우 새로 생성해서 지금 게시글의 bno를 value로 추가
						Cookie c1 = new Cookie("blist", URLEncoder.encode(String.valueOf(s_no), "UTF-8"));
						response.addCookie(c1); // 응답에 담아 보냄					
					}				
				}											
			} catch (UnsupportedEncodingException e) {						
				e.printStackTrace();
			}

			Survey_TB board = bService.selectBoard(s_no, !flagbno);

			List<S_Detail_TB> sDetail= bService.selectBoardDetail(s_no);
			sDetail.get(0);
			sDetail.get(1);
			
//			System.out.println("1" + sDetail.get(0));
//			System.out.println("2" + sDetail.get(1));
					
			List<Reply_TB> rlist = bService.selectReplyList(s_no);
			System.out.println("rlist : " + rlist);
			if(board != null) {
				model.addAttribute("board", board);
				model.addAttribute("rlist", rlist);
				model.addAttribute("sDetail0", sDetail.get(0));
				model.addAttribute("sDetail1", sDetail.get(1));
				return "board/boardSurveyDetail";
			} else {
				model.addAttribute("msg", "게시글 상세보기 실패했습니다.");
				return "common/errorPage";
			}		
		}
		
		// 게시글 수정 페이지로 이동
		@GetMapping("/updatePage")
		public String updatePageView(int s_no, Model model) {
			Survey_TB board = bService.selectBoard(s_no, false);
			System.out.println(board);
			model.addAttribute("board", board);
			return "board/boardSurveyUpdate";
		}
		
		// 게시글 수정
		@PostMapping("/update")
		public String boardUpdate(Survey_TB board,
								  @RequestParam(value="uploadFile") MultipartFile file,
								  HttpServletRequest request) {
			
			int result = bService.updateBoard(board);
			
			if(result > 0) {
				return "redirect:/boardSurvey/detail?s_no=" + board.getS_no();
			} else {
				throw new BoardSurveyException("게시글 수정에 실패했습니다.");
			}
			
		}		
				
		@RequestMapping("/delete")
		public String boardDelete(int s_no, HttpServletRequest request) {
					
			int result = bService.deleteBoard(s_no);
					
			if(result > 0) {		
				return "redirect:/boardSurvey/list";
			} else {
				throw new BoardSurveyException("게시글 삭제에 실패했습니다.");
			}	
		}
	
		// 댓글 작성
		@PostMapping(value="/insertReply", produces="application/json; charset=utf-8")
		public @ResponseBody String insertReply(Reply_TB r, HttpSession session) {
			// 글 작성자 loginUser에서 가져옴
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int userno = loginUser.getUserNo();
			r.setUser_no(userno);
			//System.out.println( "userno : " + userno);
			List<Reply_TB> rlist = bService.insertReply(r);
				System.out.println(rlist);
			// 날짜 포맷하기 위해 GsonBuilder를 이용해서 Gson 객체 생성
			Gson gson = new GsonBuilder()
							.setDateFormat("yyyy-MM-dd")
							.create();
					
				return gson.toJson(rlist);
		}	
	
		// 검색기능
		@GetMapping("/search")
		public String noticeSearch(@ModelAttribute Search search,
								   Model model) {
			
			List<Survey_TB> searchList = bService.searchList(search);
			model.addAttribute("list", searchList);
					
			return "board/boardSurveyList";
		}
	

		// 투표하기(+1)
	    @RequestMapping("/surveyVote")
	    public String recommend (@RequestParam int de_s_no,
	    						Model model) {	      
	        int result = bService.surveyVote(de_s_no);
	        
	        if(result > 0) {
	        	List<S_Detail_TB> sDetail= bService.selectDetail(de_s_no);
	        	System.out.println("sDetail : " + sDetail);
	        	if(sDetail != null) {
					model.addAttribute("sDetail", sDetail);
					return "redirect:/boardSurvey/detail?s_no=" + sDetail.get(0).getS_no();
	        	} else {	        		
	        	}
	        	return "redirect:/boardSurvey/detail?s_no=" + sDetail.get(0).getS_no();
	        } else {
				throw new BoardSurveyException("투표하기에 실패했습니다.");	
			}	   
	    }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
