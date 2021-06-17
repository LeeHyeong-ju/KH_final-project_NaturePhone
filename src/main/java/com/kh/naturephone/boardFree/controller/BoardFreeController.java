package com.kh.naturephone.boardFree.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.kh.naturephone.boardFree.model.exception.BoardFreeException;
import com.kh.naturephone.boardFree.model.service.BoardFreeService;
import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.common.Reply_TB;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.notice.model.exception.NoticeException;
import com.kh.naturephone.boardFree.model.exception.BoardFreeException;

@Controller
@RequestMapping("/boardFree")
public class BoardFreeController {
	
	@Autowired
	private BoardFreeService bService;
		
	@GetMapping("/list")
	public ModelAndView boardList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage
				) {

			int listCount = bService.selectListCount();
			//System.out.println(listCount);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
			List<Board_TB> list = bService.selectList(pi);			
						
			//System.out.println(pi);
			//System.out.println("list : " + list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				
				mv.setViewName("board/boardFreeList");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
				
	// 게시글 작성 페이지로 이동
	@GetMapping("/write")
	public String writePageView() {
	
		return "board/boardFreeInsert";
	}
	
	// 게시글 작성 - 파일첨부(리네임)
	@PostMapping("/insert")
	public String boardInsert(Board_TB board,
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest request,
							  HttpSession session) {
			Member loginUser = (Member)session.getAttribute("loginUser");
				board.setCategory("자유");
				board.setUserNo(loginUser.getUserNo());
				//System.out.println("board: " + board);
				int result = bService.insertBoard(board);
				
				if(result > 0) {	
					
					if(!file.getOriginalFilename().equals("")) {
						String bfrenameName = saveFile(file, request);
						
						B_Att_TB att = new B_Att_TB(); 
						
						if(bfrenameName != null) {
							att.setBforiginalName(file.getOriginalFilename());
							att.setBfrenameName(bfrenameName);
							att.setBffilePath("/bfuploadFiles/"+file.getOriginalFilename());
//							System.out.println(att);
							int result1 = bService.insertBoardAtt(att);
//							System.out.println("result1 : " + result1);
							if(result1 > 0) {
								return "redirect:/boardFree/list";
							} else {
								throw new BoardFreeException("이미지 등록에 실패했습니다.");
							}							
						}							
					}					
					return "redirect:/boardFree/list";
				} else {
					throw new BoardFreeException("게시글 등록에 실패했습니다.");	
				}	
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\bfuploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); 
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String bforiginalName = file.getOriginalFilename();
		String bfrenameName = sdf.format(new Date()) + "_"  
							  +	(int)(Math.random() * 100000)
							  + bforiginalName.substring(bforiginalName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + bfrenameName;
		
		try {

			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}

		return bfrenameName;
	}
		
				
	// 게시글 상세 페이지
		@GetMapping("/detail")
		public String boardDetail(int bno,
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
								if(st.equals(String.valueOf(bno))) flagbno = true;
							}
							if(!flagbno) { // 게시글을 읽지 않았다면
								// 지금 게시글을 읽었다는 의미로 blist에 bno를 추가해서 인코딩한 문자로 쿠키값을 새롭게 설정
								c.setValue(URLEncoder.encode(blist + "," + bno, "UTF-8"));
								response.addCookie(c); // 응답에 담아 보냄
							}
						}
					}				
					if(!flagblist) { // blist라는 쿠키가 존재하지 않는 경우 새로 생성해서 지금 게시글의 bno를 value로 추가
						Cookie c1 = new Cookie("blist", URLEncoder.encode(String.valueOf(bno), "UTF-8"));
						response.addCookie(c1); // 응답에 담아 보냄					
					}				
				}											
			} catch (UnsupportedEncodingException e) {						
				e.printStackTrace();
			}
			
			// flagbno가 true면 읽은 게시글, false면 읽지 않은 게시글
			// !flagbno를 전달하여 true면 조회수 증가 필요, false면 조회수 증가 불필요
			Board_TB board = bService.selectBoard(bno, !flagbno);
			//System.out.println("board : " + board);
			B_Att_TB att =  bService.selectBoardAtt(bno);
			List<Reply_TB> rlist = bService.selectReplyList(bno);
			//System.out.println("rlist : " + rlist);
			if(board != null) {
				model.addAttribute("board", board);
				model.addAttribute("att", att);
				model.addAttribute("rlist", rlist);
				return "board/boardFreeDetail";
			} else {
				model.addAttribute("msg", "게시글 상세보기 실패했습니다.");
				return "common/errorPage";
			}		
		}
		
		// 게시글 수정 페이지로 이동
		@GetMapping("/updatePage")
		public String updatePageView(int bno, Model model) {
			Board_TB board = bService.selectBoard(bno, false);
			//System.out.println(board);
			model.addAttribute("board", board);
			return "board/boardFreeUpdate";
		}
				
			
		@PostMapping("/update")
		public String boardUpdate(Board_TB board,
								  B_Att_TB att,
								  @RequestParam(value="uploadFile") MultipartFile file,
								  HttpServletRequest request) throws BoardFreeException {
			int result = 0;
			
			if(!file.getOriginalFilename().equals("")) {
				
				int result1 = 0;
				
				String renameFileName = saveFile(file, request);
				
				if(renameFileName != null){
					if(att.getBfrenameName() != null) {
						deleteFile(att.getBfrenameName(), request);
						
						att.setBforiginalName(file.getOriginalFilename());
						att.setBfrenameName(renameFileName);
						att.setBffilePath("/bfuploadFiles/" + file.getOriginalFilename());
						
						result1 = bService.updateBoardAtt(att);
					} else {
						att.setBforiginalName(file.getOriginalFilename());
						att.setBfrenameName(renameFileName);
						att.setBffilePath("/bfuploadFiles/" + file.getOriginalFilename());
						
						result1 = bService.insertFreeAtt(att, board.getBno());
					}
					
					if(result1 > 0) {
						result = bService.updateBoard(board);
					} else {
						throw new BoardFreeException("파일 업로드에 실패하였습니다.");
					}
				}
			}
			else {
				result = bService.updateBoard(board);
			}
			
			if(result > 0) {
				return "redirect:/boardFree/detail?bno=" + board.getBno();
			} else {
				throw new BoardFreeException("게시글 수정에 실패하였습니다.");
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		public void deleteFile(String fileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\bfuploadFiles";
			File f = new File(savePath + "\\" + fileName);
			if(f.exists()) f.delete();
		}
	
		@RequestMapping("/delete")
		public String boardDelete(int bno, HttpServletRequest request){
			
			B_Att_TB att =  bService.selectBoardAtt(bno);
			System.out.println("att : " + att);
			if(att != null) {
				deleteFile(att.getBfrenameName(), request);				
			} 
			System.out.println("bno : " + bno);
			int result = bService.deleteBoard(bno);
					
			if(result > 0) {		
				return "redirect:/boardFree/list";
			} else {
				throw new BoardFreeException("게시글 삭제에 실패했습니다.");
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
				
			System.out.println("list : " + rlist);	 
			// 날짜 포맷하기 위해 GsonBuilder를 이용해서 Gson 객체 생성
			Gson gson = new GsonBuilder()
							.setDateFormat("yy.MM.dd hh:mm")
							.create();
					
				return gson.toJson(rlist);
		}	
							
		// 리스트 키워드 검색
		@GetMapping("/search")
		public ModelAndView noticeSearch(@ModelAttribute Search search,
								   ModelAndView mv,
								   @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
			
			int listCount = bService.searchListCount(search);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Board_TB> searchList = bService.searchList(search, pi);
			

			if(searchList != null) {
				mv.addObject("list", searchList);
				mv.addObject("pi", pi);				
				mv.setViewName("board/boardFreeList");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		//게시물 추천 관련 메소드
	    @RequestMapping("/recommend")
	    public String recommend (@RequestParam int bno) {	      
	        int result = bService.recommend(bno);
	        if(result > 0) {		        
	        	return "redirect:/boardFree/detail?bno=" + bno;
	        } else {
				throw new BoardFreeException("공감 클릭에 실패했습니다.");	
			}	   
	    }
		
		// 댓글 삭제
		  @PostMapping(value="/deleteReply") 
		  public @ResponseBody String deleteReply(Reply_TB r) {
//		  System.out.println("r : " + r);
		  int result = bService.deleteReply(r);
//		  System.out.println(result);
		  return Integer.toString(result); }
		

	
}
