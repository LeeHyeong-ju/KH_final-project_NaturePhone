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
	private String viewStatus;
	private int senderNo;
	private int recipientNo;
	private String sStatus;
	private String rStatus;
	
	private String userId;
	
	private String type;
	private String userStatus;
	private Date deleteDate;
}
