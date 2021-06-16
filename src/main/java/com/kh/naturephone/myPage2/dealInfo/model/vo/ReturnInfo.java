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
public class ReturnInfo {
	private int rtnNo;
	private String content;
	private String dcontent;
	private String delType;
	private int goodsNo;
	private int dealNo;

}
