package com.kh.naturephone.myPage2.dealInfo.model.vo;

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
public class BuyerInfo {
	private int dealNo;
	private	String userName;
	private String phone;
	private String address;
	private String dealRequest;
	private int goodsNo;
}
