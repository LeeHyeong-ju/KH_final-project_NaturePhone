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
	private int replyNo;
	private int userNo;
	private String content;
	private Date createDate;
	private String status;
	private int boardNo;
	private int survayNo;
}
