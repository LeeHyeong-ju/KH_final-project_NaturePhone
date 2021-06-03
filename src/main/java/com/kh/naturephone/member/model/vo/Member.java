package com.kh.naturephone.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	private Integer userNo;
	private String token;
	private String grade;
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String address;
	private String approvalKey;
	private String approvalStatus;
	private String email;
	private Date createDate;
	private Date modifyDate;
	private String status;	
	private String quitType;
	private String quitContent;
}
