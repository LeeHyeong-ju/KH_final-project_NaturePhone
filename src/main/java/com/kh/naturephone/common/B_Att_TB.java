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
public class B_Att_TB {
	private int bfno;				// 첨부파일 넘버
	private String bforiginalName;	// 이미지명(오리지널)
	private String bfrenameName;	// 이미지명(리네임)
	private String bffilePath;		// 파일 경로
	private Date bfuploadDate;		// 업로드일
	private String bfstatus;		// 상태
	private int bno;				// 해당 글 번호
	
}
