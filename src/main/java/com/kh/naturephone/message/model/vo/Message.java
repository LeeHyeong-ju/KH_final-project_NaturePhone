package com.kh.naturephone.message.model.vo;

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
public class Message {
	private int messageNo;
	private String messageTitle;
	private String messageContent;
	private Date createDate;
	private Date deleteDate;
	private String viewStatus;
	private int senderNo;
	private int recipientNo;
	private String type;
	private String status;
	private int divisionNo;
	private String userName;
}
