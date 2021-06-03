package com.kh.naturephone.boardFree.model.vo;

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
public class Board_TB {
	private int bno;			// 글번호
	private int userNo;			// 회원번호
	private String btitle;		// 제목
	private String bcontent;	// 내용
	private String category;	// 게시판 분류(자유,모바일뉴스,공지사항,Q&A)
	private String bcategory;	// 카테고리 분류 (자유게시판용- 스마트폰,일상 등)
	private int bcount;			// 조회수
	private int brecom;			// 공감수
	private Date bcreateDate;	// 작성일
	private Date bmodifyDate;	// 수정일
	private String bstatus;		// 상태
	private int brefNo;			// 참조번호
	
}
