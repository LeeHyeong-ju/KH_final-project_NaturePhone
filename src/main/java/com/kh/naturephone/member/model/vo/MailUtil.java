package com.kh.naturephone.member.model.vo;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
	
	public static void sendMail(String email, String subject, String msg) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "vaumc4";
		String hostSMTPpwd = "123qwe!Q";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "vaumc4@naver.com";
		String fromName = "네이처폰 관리자";

		// 받는 사람 E-Mail 주소
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSL(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);

			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setTLS(true);
			mail.addTo(email, charSet);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
