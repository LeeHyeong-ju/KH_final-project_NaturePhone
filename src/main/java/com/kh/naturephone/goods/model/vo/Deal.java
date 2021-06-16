package com.kh.naturephone.goods.model.vo;

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
public class Deal {
	private int dealNo;
	private int buyerNo;
	private String address;
	private String phone;
	private String request;
	private Date finishDate;
	private String bbank;
	private String baccount;
	private String progress;
	private int goodsNo;
	private String status;
}
