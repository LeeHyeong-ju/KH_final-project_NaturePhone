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
	private int boardNo;
	private int userNo;
	private String btitle;
	private String category;
	private Date createDate;
	private String bstatus;
}
