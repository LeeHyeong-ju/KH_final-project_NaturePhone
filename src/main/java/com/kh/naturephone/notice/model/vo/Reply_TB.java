package com.kh.naturephone.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Reply_TB {
	private int reno;
	private int userno;
	private String recontent;
	private Date createDate;
	private Date modifyDate;
	private String restatus;
	private int bno;
	private int sno;
}
