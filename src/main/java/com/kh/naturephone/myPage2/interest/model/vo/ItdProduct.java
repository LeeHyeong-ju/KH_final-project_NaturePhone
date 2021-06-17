package com.kh.naturephone.myPage2.interest.model.vo;

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
public class ItdProduct {
	private int itdNo;
	private Date enrollDate;
	private int productNo;
	private String productName;
	private String modelName;
	private String maker;
	private int carrNo;
	private String carrName;
	private int userNo;

}
