package com.kh.naturephone.boardFree.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.naturephone.boardFree.model.exception.BoardFreeException;
import com.kh.naturephone.boardFree.model.service.BoardFreeService;
import com.kh.naturephone.boardFree.model.vo.B_Att_TB;
import com.kh.naturephone.boardFree.model.vo.Board_TB;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.boardFree.model.exception.BoardFreeException;

@Controller
@RequestMapping("/boardFree")
public class BoardFreeController {
	
	@Autowired
	private BoardFreeService bService;
		
	@GetMapping("/list")
	public ModelAndView boardList(ModelAndView mv,
				@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
			// -> 메뉴바 클릭 시 page라는 파리미터는 없으므로 required=false, 넘어오는 값이 없을 시 기본값 1로 설정
			
			// 게시글 개수 구하기
			int listCount = bService.selectListCount();
			
			// PageInfo 객체 생성
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			// 요청페이지에 맞는 게시글 리스트 조회
			List<Board_TB> list = bService.selectList(pi);
			System.out.println(list);
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("pi", pi);
				mv.setViewName("boardFree/boardFreeList");
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
							  HttpServletRequest request) {
				board.setCategory("자유");
				board.setUserNo(1);
				System.out.println(board);
				int result = bService.insertBoard(board);
				
				if(result > 0) {	
					
					if(!file.getOriginalFilename().equals("")) {
						String bfrenameName = saveFile(file, request);
						
						B_Att_TB att = new B_Att_TB(); 
						
						if(bfrenameName != null) {
							att.setBforiginalName(file.getOriginalFilename());
							att.setBfrenameName(bfrenameName);
							att.setBffilePath("/bfuploadFiles/"+file.getOriginalFilename());
							
							int result1 = bService.insertBoardAtt(att);
							
							if(result1>0) {
								return "redirect:/boardFree/BoardFreeList";
							} else {
								throw new BoardFreeException("이미지 등록에 실패했습니다.");
							}							
						}							
					}					
					return "redirect:/boardFree/BoardFreeList";
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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
