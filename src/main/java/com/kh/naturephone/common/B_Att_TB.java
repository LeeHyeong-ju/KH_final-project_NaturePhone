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
	private int bfno;
	private String bforiginalName;
	private String bfrenameName;
	private String bffilePath;
	private Date bfuploadDate;
	private String bfstatus;
	private int bno;
	
}
