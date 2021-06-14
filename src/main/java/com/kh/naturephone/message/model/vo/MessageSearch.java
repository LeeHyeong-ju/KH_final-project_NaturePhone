package com.kh.naturephone.message.model.vo;

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
public class MessageSearch {
	private String searchCondition;
	private String searchValue;
	private String type;
	private int senderNo;
	private int recipientNo;
}
