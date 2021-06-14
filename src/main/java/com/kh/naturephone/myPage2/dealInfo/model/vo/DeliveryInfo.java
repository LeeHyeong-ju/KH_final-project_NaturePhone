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
public class DeliveryInfo {
	private int delNo;
	private String company;
	private String invoice;
	private String type;
	private int dealNo;

}
