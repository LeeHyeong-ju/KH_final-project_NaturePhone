package com.kh.naturephone.member.model.vo;

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
public class MyReply {
	private int rownum;
	private int replyNo;		// 댓글 번호
	private int userNo;			// 회원 번호
	private String content;		// 댓글 내용
	private Date createDate;	// 댓글 생성 날짜
	private String category;	// 카테고리	
	private int boardNo;		// 댓글 처리 된 게시물 번호
}
