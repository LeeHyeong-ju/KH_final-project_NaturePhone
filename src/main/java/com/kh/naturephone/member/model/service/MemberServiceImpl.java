package com.kh.naturephone.member.model.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.member.model.dao.MemberDao;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.member.model.vo.MyBoard;
import com.kh.naturephone.member.model.vo.MyReply;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired 
	private MemberDao mDao;
	
	/*----------------- 회원 관련 -----------------*/
	
	@Override
	public Member loginMember(Member m) {
		return mDao.selectMember(m);
	}

	@Override
	public void idOverlapCheck(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(mDao.idOverlapCheck(id));
		out.flush();
		out.close();
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(m);
	}

	@Override
	public int pwdUpdate(Member loginUser) {
		return mDao.pwdUpdate(loginUser);
	}
	
	@Override
	public int deleteMember(Member m) {
		return mDao.deleteMember(m);
	}

	// 인증키 생성
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();

		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	// 메일보내기
	@Override
	public void sendEmail(Member m) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "vaumc4@naver.com";
		String hostSMTPpwd = "1234qwer!Q";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "vaumc4@naver.com";
		String fromName = "네이처폰 관리자";
		String subject = "이메일 발송 테스트";
		String msg = "";

		// 회원가입 메일 내용
		subject = "Nature Phone 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += m.getId() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:8800/naturephone/member/memberApproval'>";
		msg += "<input type='hidden' name='email' value='" + m.getEmail() + "'>";
		msg += "<input type='hidden' name='approvalKey' value='" + m.getApprovalKey() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
		String mail = m.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void approval_member(Member m, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (mDao.approval_member(m) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다.');");
			//out.println("location.href='../index.jsp';");
			out.println("</script>");
			out.close();
		}		
	}

	/*----------------- 나의 게시글, 나의 댓글 조회 -----------------*/
	
	@Override
	public List<MyBoard> selectMyBoardList(int userNo, PageInfo pi) {
		return mDao.selectMyBoardList(userNo, pi);
	}
	
	@Override
	public int selectListCount(int userNo) {
		return mDao.selectListCount(userNo);
	}

	@Override
	public List<MyReply> selectMyReplyList() {
		return mDao.selectMyReplyList();
	}


	

	
}
