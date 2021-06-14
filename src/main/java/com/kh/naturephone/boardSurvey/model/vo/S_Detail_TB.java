package com.kh.naturephone.boardSurvey.model.vo;

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
public class S_Detail_TB {

	private int de_s_no;	    // 설문 상세번호
	private int s_no;		    // 글 번호 
	private String de_choice;	// 선택지
	private int de_person;		// 인원
	
}
