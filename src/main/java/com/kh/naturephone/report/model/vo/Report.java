package com.kh.naturephone.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Report {
	private int reportNo;			// 신고 번호
	private String reportType; 		// 신고 사유(필수)
	private String reportContent; 	// 신고 상세사유(선택)
	private Date createDate;		// 작성 일자
	private String status;			// 상태
	private int reporter;			// 신고 하는 사람 회원번호
	private int suspect;			// 신고 당하는 사람 회원번호
	private String reporter_id;		// 신고자 아이디
	private String suspect_id;		// 신고 당하는 사람 아이디
	private String s_grade;			// 회원 등급
	private String s_status;		// 회원 탈퇴 상태
	
	
	private int boardNo;			// 게시판 글번호
	private int surveyNo;			// 설문 글번호
	private int replyNo;			// 댓글 글번호
	private int goodsNo;			// 물품 글번호
	private int goodsReplyNo;		// 물품 댓글 글번호
	
	
}
