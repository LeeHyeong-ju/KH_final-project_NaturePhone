package com.kh.naturephone.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.naturephone.admin.model.exception.AdminException;
import com.kh.naturephone.admin.model.service.AdminService;
import com.kh.naturephone.boardFree.model.service.BoardFreeService;
import com.kh.naturephone.boardMobile.model.service.BoardMobileService;
import com.kh.naturephone.boardSurvey.model.service.BoardSurveyService;
import com.kh.naturephone.boardSurvey.model.vo.Survey_TB;
import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.notice.model.service.NoticeService;
import com.kh.naturephone.report.model.vo.Report;
import com.kh.naturephone.support.controller.SupportController;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService aService;
	@Autowired
	private BoardSurveyService bsService;
	@Autowired
	private BoardMobileService bmService;
	@Autowired
	private BoardFreeService bfService;
	@Autowired
	private NoticeService nService;

	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@GetMapping("/memberList")
	public ModelAndView adminMemberPageView(ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
			int listCount = aService.selectMemberListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
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
	
	@GetMapping("/memberQuit")
	public String adminQuitMember(int userNo, RedirectAttributes rd) throws AdminException {
		
		int result = aService.adminQuitMember(userNo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "해당 회원이 탈퇴되었습니다.");
			return "redirect:/admin/memberList";
		} else {
			throw new AdminException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	@PostMapping("/memberGrade")
	public void adminChangeGradeMember(Member m, HttpServletResponse response) throws IOException {
		aService.adminChangeGradeMember(m, response);
	}
	
	@GetMapping("/memberDetail")
	public String adminMemberDetail(int userNo, Model model) {
		Member m = aService.adminSelectMember(userNo);
		
		if(m != null) {
			model.addAttribute("member", m);
			return "admin/adminMemberDetail";
		} else {
			model.addAttribute("msg", "회원정보를 불러오는데 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// ----------------------------- 회원 관리 끝 -----------------------------------
	@GetMapping("/boardList")
	public ModelAndView adminBoardPageView(ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			String category) {
		
			if(category == null) {
				category = "자유";
			}
			
			int listCount = 0;
			
			if(!category.equals("설문")) {
				listCount = aService.selectBoardListCount(category);
			} else {
				listCount = aService.selectSurveyListCount();
			}

			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Board_TB> blist = null;
			List<Survey_TB> slist = null;

			if(!category.equals("설문")) {
				blist = aService.selectBoardList(category, pi);
				if(blist != null) {
					mv.addObject("blist", blist);
				}
			} else {
				slist = aService.selectSurveyList(pi);
				if(slist != null) {
					mv.addObject("blist", slist);
				}
			}
			
			if(blist != null || slist != null) {
				mv.addObject("pi", pi);
				mv.addObject("cg", category);
				mv.setViewName("admin/adminBoardPage");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}
	
	public void deleteFile(String fileName, String category, HttpServletRequest request) throws AdminException {
		String folder = null;
		
		switch(category) {
		case "자유": case "뉴스": folder = "\\bfuploadFils"; break;
		case "공지": case "질문": folder = "\\nuploadFiles"; break;
		case "설문": break;
		default: throw new AdminException("삭제 대상을 찾지 못했습니다.");
		}
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + folder;
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) f.delete();
	}
	
	@GetMapping("/boardDelete")
	public String adminBoardDelete(int bno, String category, 
								HttpServletRequest request, RedirectAttributes rd) throws AdminException {
		
		int result = 0;
		B_Att_TB att = null;
		
		switch(category) {
		case "자유":  
			att = bfService.selectBoardAtt(bno);
			if(att != null) {
				deleteFile(att.getBfrenameName(), category, request);				
			}
			result = bfService.deleteBoard(bno);
			break;
		case "뉴스":  
			att = bmService.selectBoardAtt(bno);
			if(att != null) {
				deleteFile(att.getBfrenameName(), category, request);				
			}
			result = bmService.deleteBoard(bno);
			break;
		case "공지":
			att = nService.selectNoticeAtt(bno);
			if(att != null) {
				deleteFile(att.getBfrenameName(), category, request);				
			}
			result = nService.deleteNotice(bno);
			break;
		case "설문": 
			result = bsService.deleteBoard(bno);
			break;
		case "질문": break;
		default: throw new AdminException("삭제 대상을 찾지 못했습니다.");
		}
		
		if(result > 0) {
			rd.addFlashAttribute("category", category);
			return "redirect:/admin/boardList";
		} else {
			throw new AdminException("게시글 삭제에 실패했습니다.");
		}
	}
	
	@GetMapping("/reportList")
	public ModelAndView adminReportPageView(ModelAndView mv,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
			int listCount = aService.selectReportListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			List<Report> rplist = aService.selectReportList(pi);
			System.out.println(rplist);
			
			if(rplist != null) {
				mv.addObject("rplist", rplist);
				mv.addObject("pi", pi);
				mv.setViewName("admin/adminReportPage");
			} else {
				mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
				mv.setViewName("common/errorPage");
			}
			return mv;
	}
	
	@GetMapping("/reportQuit")
	public String adminQuitReport(int userNo, RedirectAttributes rd) throws AdminException {
		
		int result = aService.adminQuitMember(userNo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "해당 회원이 탈퇴되었습니다.");
			return "redirect:/admin/reportList";
		} else {
			throw new AdminException("회원 탈퇴에 실패하였습니다.");
		}
	}
	
	@GetMapping("/reportDown")
	public String adminDownReport(int userNo, RedirectAttributes rd) throws AdminException {
		
		int result = aService.adminDownMember(userNo);
		
		if(result > 0) {
			rd.addFlashAttribute("msg", "해당 회원 등급이 블랙회원으로 변경되었습니다.");
			return "redirect:/admin/reportList";
		} else {
			throw new AdminException("회원 탈퇴에 실패하였습니다.");
		}
	}
}













