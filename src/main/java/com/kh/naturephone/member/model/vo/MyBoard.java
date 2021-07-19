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
public class MyBoard {
	private int rownum;			
	private int boardNo;		// 게시물 번호
	private int userNo;			// 회원 번호
	private String btitle;		// 게시물 제목
	private String category;	// 카테고리
	private Date createDate;	// 게시물 생성 날짜
	private String bstatus;		// 게시물 삭제 여부
}
