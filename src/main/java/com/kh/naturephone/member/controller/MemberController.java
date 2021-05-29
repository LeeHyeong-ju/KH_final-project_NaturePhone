package com.kh.naturephone.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.naturephone.member.model.service.MemberService;
import com.kh.naturephone.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes("loginUser")
public class MemberController {
		@Autowired
		private MemberService mService;
		
		/* ----------------------페이지 이동---------------------- */
		// 로그인 페이지 이동
		@GetMapping("/loginPage")
		public String loginView() {
			
			return "member/loginPage";
		}
		
		// 회원가입 1단계 : 약관페이지 이동
		@GetMapping("/joinPage")
		public String joinView(){
		
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
		
		/*---------------------- 기능 구현 ----------------------*/
		
		// 1. 회원 로그인 서비스를 위한 메소드
		@PostMapping("/login")
		public String memberLogin(@ModelAttribute Member m,
									Model model) {
			
			Member loginUser = mService.loginMember(m);
			
			if(loginUser != null) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:/";
			} else{
				model.addAttribute("msg", "로그인에 실패하였습니다."); 
				return "member/loginPage";
			}
		}
		
		// 2. 로그아웃 메소드
		@GetMapping("/logout")
		public String memberLogout(SessionStatus status) {
			status.setComplete();
			return "redirect:/";
		}
		
		// 3. 아이디 중복 검사 메소드 (Ajax)
		// 4. 이메일 중복 검사 메소드 (Ajax)
		// 5. 이메일 인증 메소드
		
		// 6. 회원가입 메소드
		@PostMapping("/join")
		public String memberJoin(@ModelAttribute Member m,
								 @RequestParam("postcode") String postcode,
								 @RequestParam("address1") String address1,
								 @RequestParam("address2") String address2,
								 @RequestParam("hp1") String hp1,
								 @RequestParam("hp2") String hp2,
								 @RequestParam("hp3") String hp3,
								 Model model) {
			m.setAddress(postcode + "," + address1 + "," + address2);
			m.setPhone(hp1 + "-" + hp2 + "-" + hp3);
			System.out.println("회원가입 시 넘어온 값: " + m);
			return null;
		}
	}
