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
public class PaymentInfo {
	private int goodsNo;
	private int price;
	private String dealWay;
	private int deliveryFee;
}
