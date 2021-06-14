package com.kh.naturephone.myPage2.dealInfo.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class DealInfo {
	private int goodsNo;	
	private int price;
	private String gtitle;
	private String modelName;
	private Date createDate;
	private String progress;
	private String dealWay;
	private int dealNo;
	
}
