package com.kh.naturephone.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.member.model.service.MemberService;
import com.kh.naturephone.member.model.vo.KeyPublish;
import com.kh.naturephone.member.model.vo.MailUtil;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "loginUser" })
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/* ----------------------페이지 이동---------------------- */
	// 로그인 페이지 이동
	@GetMapping("/loginPage")
	public String loginView(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// 네이버
		model.addAttribute("url", naverAuthUrl);

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

			model.addAttribute("loginUser", loginUser);
			return "redirect:/";

		} else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "member/loginPage";
		}
	}

	// 2-1. 아이디 중복 검사 메소드 (Ajax)
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public void idOverlapCheck(String id, HttpServletResponse response) throws Exception {
		mService.idOverlapCheck(id, response);
	}

	// 2-2. 이메일 중복 검사 메소드 (Ajax)
	@RequestMapping(value = "/emailOverlap", method = RequestMethod.POST)
	public void emailOverlapCheck(String email, HttpServletResponse response) throws Exception {
		System.out.println(email);
		mService.emailOverlapCheck(email, response);
	}

	// 3-1. 회원가입 - 메일 인증
	@RequestMapping(value = "/joinSendMail", method = RequestMethod.POST)
	@ResponseBody
	public void joinSendMail(@ModelAttribute Member m, HttpSession session) throws Exception {
		String keyCode = KeyPublish.createKey();

		session.setAttribute("keyCode", keyCode);

		String subject = "";
		String msg = "";

		// 회원가입 메일 내용
		subject = "Nature Phone 회원가입 인증 코드입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<div style='font-size: 130%'>";
		msg += "회원가입 페이지에서 인증코드 <strong>";
		msg += keyCode + "</strong> 를 입력해 주세요.</div><br/>";

		MailUtil.sendMail(m.getEmail(), subject, msg);

	}

	// 3-2. 메일 인증키 확인
	@RequestMapping(value = "/keyCheck", method = RequestMethod.POST)
	@ResponseBody
	public String keyCheck(@RequestParam("modalInput") String key, @SessionAttribute("keyCode") String keyCode) {
		if (key != null && key.equals(keyCode)) {
			return "success";
		} else {
			return "false";
		}
	}

	// 4. 회원가입 (DB insert)
	@PostMapping("/join")
	public String memberJoin(@ModelAttribute Member m, @RequestParam("postcode") String postcode,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("hp1") String hp1, @RequestParam("hp2") String hp2, @RequestParam("hp3") String hp3,
			Model model, RedirectAttributes rd) throws Exception {
		System.out.println(m.getEmail());
		m.setAddress(postcode + "," + address1 + "," + address2);
		m.setPhone(hp1 + "-" + hp2 + "-" + hp3);
		m.setPwd(bcryptPasswordEncoder.encode(m.getPwd()));

		int result = mService.insertMember(m);

		if (result > 0) {
			rd.addFlashAttribute("msg", "회원 가입이 성공적으로 이루어졌습니다. 로그인 해주세요!");
			return "redirect:/";
		} else {
			model.addAttribute("msg", "회원 가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}

	// 5. 회원정보 수정
	@PostMapping("/update")
	public String memberUpdate(@ModelAttribute("loginUser") Member m, @RequestParam("postcode") String postcode,
			@RequestParam("address1") String address1, @RequestParam("address2") String address2,
			@RequestParam("hp1") String hp1, @RequestParam("hp2") String hp2, @RequestParam("hp3") String hp3,
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
	public String pwdUpdate(@RequestParam("pwdOrigin") String pwdOrigin, @RequestParam("pwdChange") String pwdChange,
			@SessionAttribute("loginUser") Member loginUser, RedirectAttributes rd, SessionStatus status, Model model) {

		if (bcryptPasswordEncoder.matches(pwdOrigin, loginUser.getPwd()) == true) {
			loginUser.setPwd(bcryptPasswordEncoder.encode(pwdChange));
			int result = mService.pwdUpdate(loginUser);

			if (result > 0) {
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
	public String deleteMember(@RequestBody Member m, @SessionAttribute("loginUser") Member loginUser,
			SessionStatus status) throws Exception {

		if (bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd()) == true) {
			m.setUserNo(loginUser.getUserNo());
			int result = mService.deleteMember(m);

			if (result > 0) {
				status.setComplete();
				return "success";
			} else {
				return "error";
			}

		} else {
			return "inconsistency";
		}
	}

	// 8. 아이디 찾기
	@RequestMapping(value = "/findIdSendMailAjax", method = RequestMethod.POST)
	@ResponseBody
	public String findIdSendMail(@RequestParam(value = "findIdEmail") String findIdEmail) throws Exception {

		String searchId = mService.findIdSendMail(findIdEmail);

		String subject = "";
		String msg = "";

		if (searchId != null) {
			// 회원가입 메일 내용
			subject = "Nature Phone 아이디입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<div style='font-size: 130%'>";
			msg += "회원님의 아이디는 <strong>";
			msg += searchId + "</strong> 입니다. </div><br/>";

			MailUtil.sendMail(findIdEmail, subject, msg);
			return "success";
		} else {
			return "null";
		}
	}

	// 9. 비밀번호 찾기
	@RequestMapping(value = "/findPwdEmailAjax", method = RequestMethod.POST)
	@ResponseBody
	public String findPwdSendEmail(@RequestBody Member m) throws Exception {

		String searchId = mService.findIdSendMail(m.getEmail());

		if (searchId != null) {
			String keyCode = KeyPublish.createKey() + "Q" + "v" + "!" + "5";

			m.setApprovalKey(bcryptPasswordEncoder.encode(keyCode));
			System.out.println(m);
			String subject = "";
			String msg = "";

			int result = mService.findPwdSendEmail(m);

			if (result > 0) {

				// 회원가입 메일 내용
				subject = "Nature Phone 새로운 비밀번호를 발급해드립니다.";
				msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
				msg += "<div style='font-size: 130%'>";
				msg += "새로운 비밀번호 <strong>";
				msg += keyCode + "</strong> 를 발급해드렸습니다. 로그인 하신 후 비밀번호를 꼭 바꿔주세요.</div><br/>";

				MailUtil.sendMail(m.getEmail(), subject, msg);

				return "success";
			} else {
				return "updateFail";
			}
		} else {
			return "null";
		}
	}

	// 네이버 로그인
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, 
						   @RequestParam String code, 
						   @RequestParam String state,
						   RedirectAttributes rd,
						   HttpSession session,
						   HttpServletResponse response) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// 필수값 - 이름, 휴대전화 번호, 이메일
		String nName = (String) response_obj.get("name");
		String nEmail = (String) response_obj.get("email");
		String nPhone = (String) response_obj.get("mobile");

		// 4. 가입된 회원인지 확인
		Member m = new Member();
		Member loginUser = mService.searchNEmail(nEmail);

		// 4-1. 가입된 회원일 시
		if (loginUser != null) { // 로그인 처리
			model.addAttribute("loginUser", loginUser);
			return "redirect:/";
		
		// 4-2. 가입되지 않은 회원일 때
		} else {

			PrintWriter out = response.getWriter();

			// 필수입력값 다 들어왔다면 DB에 저장후 로그인
			if (nName != null && nEmail != null && nPhone != null) {
				m.setName(nName);
				m.setPhone(nPhone);
				m.setEmail(nEmail);

				// DB 저장
				mService.naverInsert(m);
				// 로그인
				m = mService.loginMember(m);
				model.addAttribute("loginUser", m);
				rd.addAttribute("closeWindow", "close");
				return "redirect:/";

				// 필수입력값 다 들어오지 않았다면 네아로 재요청
			} else {
				String url = URLEncoder.encode("http://localhost:8800/naturephone/member/callback", "UTF-8");
				out.println("<script>alert('이름, 이메일, 전화번호는 필수입니다.');</script>");
				return "redirect:https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=_neJ4MDnS0PpuxFf3FQU&state="
						+ state + "&redirect_uri=" + url + "&auth_type=reprompt";

			}
		}
	}

	// 나의 게시글 조회
	@GetMapping("/myBoardList")
	public ModelAndView selectMyBoardList(ModelAndView mv, @SessionAttribute("loginUser") Member loginUser,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {

		int userNo = loginUser.getUserNo();
		int listCount = mService.selectListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<MyBoard> list = mService.selectMyBoardList(userNo, pi);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/myBoardPage");
		}
		return mv;
	}

	// 나의 댓글 조회
	@GetMapping("/myReplyList")
	public ModelAndView selectMyReplyList(ModelAndView mv, @SessionAttribute("loginUser") Member loginUser,
			@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage) {
		int userNo = loginUser.getUserNo();
		int listCount = mService.selectReplyListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<MyReply> list = mService.selectMyReplyList(userNo, pi);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("member/myReplyPage");
		}
		return mv;
	}
}
