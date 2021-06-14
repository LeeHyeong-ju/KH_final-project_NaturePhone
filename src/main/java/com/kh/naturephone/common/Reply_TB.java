package com.kh.naturephone.common;

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
public class Reply_TB {
	private int re_no;			// 댓글 번호
	private int user_no;		// 회원 번호
	private String re_content;	// 내용
	private Date create_date;	// 작성일
	private Date modify_date;	// 수정일
	private String re_status;	// 상태
	private int b_no;			// 글 번호
	private int s_no;			// 설문 글 번호
	private String user_id;		// 댓글용 아이디

}
