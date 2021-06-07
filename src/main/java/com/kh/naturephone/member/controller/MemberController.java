package com.kh.naturephone.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.service.MemberService;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "loginUser" })
public class MemberController {
	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	/* ----------------------페이지 이동---------------------- */
	// 로그인 페이지 이동
	@GetMapping("/loginPage")
	public String loginView() {
		return "member/loginPage";
	}

	// 회원가입 1단계 : 약관페이지 이동
	@GetMapping("/joinPage")
	public String joinView() {
		return "member/joinPageTerms";
	}

	// 회원가입 2단계 : 신상적기 페이지 이동
	@GetMapping("/joinPage2")
	public String joinView2() {
		return "member/joinPage";
	}

	// 마이페이지 클릭 -> 회원정보 페이지 이동
	@GetMapping("/myPage")
	public String memberInfoView() {
		return "member/memberInfoPage";
	}

	// 탈퇴 새창띄우기
	@GetMapping("/quitPage")
	public String quitView() {
		return "member/quitPage";
	}
	
	// 아이디 비밀번호 찾기 새창 띄우기
	@GetMapping("/searchMemberPage")
	public String searchMemberView() {
		return "member/searchMemberPage";
	}
	
	
	/*---------------------- 기능 구현(DB접근 X) ----------------------*/

	// 로그아웃 메소드
	@GetMapping("/logout")
	public String memberLogout(SessionStatus status, RedirectAttributes rd) {
		status.setComplete();
		rd.addFlashAttribute("msg", "정상적으로 로그아웃 되었습니다.");
		return "redirect:/";
	}

	/*---------------------- 기능 구현(DB접근 O) ----------------------*/

	// 1. 회원 로그인 서비스를 위한 메소드
	@PostMapping("/login")
	public String memberLogin(@ModelAttribute Member m, Model model) {

		Member loginUser = mService.loginMember(m);
		
		
		if (loginUser != null && bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			
			if(loginUser.getApprovalStatus().equals("N")) {
				model.addAttribute("msg", "이메일 인증을 하신 후 로그인해주세요.");
				return "member/loginPage";
			}else {
				model.addAttribute("loginUser", loginUser);
				return "redirect:/";
			}
		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "member/loginPage";
		}
	}

	// 2. 아이디 중복 검사 메소드 (Ajax)
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public void idOverlapCheck(String id, HttpServletResponse response) throws Exception {
		mService.idOverlapCheck(id, response);
	}

	// 3. 이메일 인증 메소드
	@RequestMapping(value = "/memberApproval", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute Member m, HttpServletResponse response) throws Exception {
		mService.approval_member(m, response);
	}
	
	// 4. 회원가입 (DB insert)
	@PostMapping("/join")
	public String memberJoin(@ModelAttribute Member m, 
						     @RequestParam("postcode") String postcode,
						     @RequestParam("address1") String address1, 
						     @RequestParam("address2") String address2,
						     @RequestParam("hp1") String hp1, 
						     @RequestParam("hp2") String hp2, 
						     @RequestParam("hp3") String hp3,
						     @RequestParam("email1") String e1, 
						     @RequestParam("email2") String e2, 
						     Model model, 
						     RedirectAttributes rd) throws Exception {

		m.setAddress(postcode + "," + address1 + "," + address2);
		m.setPhone(hp1 + "-" + hp2 + "-" + hp3);
		m.setEmail(e1 + '@' + e2);
		m.setPwd(bcryptPasswordEncoder.encode(m.getPwd()));
		// 인증키 set
		m.setApprovalKey(mService.create_key());
		// 인증 메일 발송
		mService.sendEmail(m);
		
		int result = mService.insertMember(m);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원 가입이 성공적으로 이루어졌습니다. 이메일 인증을 진행하신 후 로그인해주세요!");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원 가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 5. 회원정보 수정
	@PostMapping("/update")
	public String memberUpdate(@ModelAttribute("loginUser") Member m, 
							   @RequestParam("postcode") String postcode,
							   @RequestParam("address1") String address1, 
							   @RequestParam("address2") String address2,
							   @RequestParam("hp1") String hp1, 
							   @RequestParam("hp2") String hp2, 
							   @RequestParam("hp3") String hp3,
							   Model model) {
		m.setAddress(postcode + "," + address1 + "," + address2);
		m.setPhone(hp1 + "-" + hp2 + "-" + hp3);

		int result = mService.updateMember(m);

		if (result > 0) {
			model.addAttribute("msg", "회원정보가 성공적으로 수정되었습니다.");
			return "member/memberInfoPage";
		} else {
			model.addAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			return "common/errorPage";
		}

	}

	// 6. 비밀번호 변경
	@PostMapping("/pwdupdate")
	public String pwdUpdate(@RequestParam("pwdOrigin") String pwdOrigin, 
							@RequestParam("pwdChange") String pwdChange,
							@SessionAttribute("loginUser") Member loginUser,
							RedirectAttributes rd,
							SessionStatus status,
							Model model){
		
		if(bcryptPasswordEncoder.matches(pwdOrigin, loginUser.getPwd()) == true) {
			loginUser.setPwd(bcryptPasswordEncoder.encode(pwdChange));
			int result = mService.pwdUpdate(loginUser);
			
			if(result > 0) {
				status.setComplete();
				rd.addFlashAttribute("msg", "비밀번호 변경이 성공적으로 이루어졌습니다. 다시 로그인해주세요!");
				return "redirect:/";
			} else {
				model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
				return "common/errorPage";
			}
			
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "member/memberInfoPage";
		}
	}

	// 7. 회원 탈퇴 - 비밀번호 확인 (Ajax)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteMember(@RequestBody Member m, 
							   @SessionAttribute("loginUser") Member loginUser,
							   SessionStatus status) throws Exception {
		
		if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd()) == true) {
			m.setUserNo(loginUser.getUserNo());
			int result = mService.deleteMember(m);
			
			if(result > 0) {
				status.setComplete();
				return "success";
			} else {
				return "error";
			}
			
		} else {
			return "inconsistency";
		}
	}

	// 나의 게시글 조회
	@GetMapping("/myBoardList")
	public ModelAndView selectMyBoardList(ModelAndView mv,
										  @SessionAttribute("loginUser") Member loginUser,
										  @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int userNo = loginUser.getUserNo();
		int listCount = mService.selectListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<MyBoard> list = mService.selectMyBoardList(userNo, pi);
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/myBoardPage");
		} 
		return mv;
	}
}
