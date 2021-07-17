package com.kh.naturephone.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	private Integer userNo;				// 회원 번호 (시퀀스 처리)
	private String token;				// 간편 로그인 시 부여받은 토큰이나 아이디
	private String grade;				// 회원등급(기본적으로 '일반회원' 부여)
	private String id;					// 회원 아이디
	private String pwd;					// 회원 비밀번호 (암호화 처리)
	private String name;				// 회원 이름
	private String phone;				// 회원 핸드폰 번호
	private String address;				// 회원 주소
	private String approvalKey;			// 메일 인증키
	private String approvalStatus;		// 메일 인증 상태
	private String email;				// 회원 이메일
	private Date createDate;			// 가입 날짜
	private Date modifyDate;			// 회원 수정 날짜
	private String status;				// 탈퇴여부
	private String quitType;			// 탈퇴 이유(필수)
	private String quitContent;			// 탈퇴 이유 상세(선택)
}
