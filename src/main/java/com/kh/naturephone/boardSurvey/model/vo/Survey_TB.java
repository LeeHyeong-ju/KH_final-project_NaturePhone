package com.kh.naturephone.boardSurvey.model.vo;

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
public class Survey_TB {
	private int s_no;			// 글 번호
	private int userNo;		// 회원 번호
	private int prono;			// 제품 번호(핸드폰)
	private String stitle;		// 제목
	private String scontent;	// 내용
	private String scategory;	// 설문 분류
	private Date s_create_date;	// 작성일
	private Date s_modify_date;	// 수정일
	private int scount;			// 조회수
	private int sparticipant;	// 참여자수
	private String s_status;	// 상태
	private String writer_id;	// 작성자	
	
}
