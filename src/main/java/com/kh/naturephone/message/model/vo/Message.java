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
	private int messageNo;			// 쪽지 번호 (시퀀스 처리)
	private String messageTitle;	// 쪽지 제목
	private String messageContent;	// 쪽지 내용
	private Date createDate;		// 생성 날짜
	private String viewStatus;		// 읽음 여부
	private int senderNo;			// 보낸 사람의 회원 번호
	private int recipientNo;		// 받은 사람의 회원 번호
	private String sStatus;			// 보낸 사람의 쪽지 삭제 여부
	private String rStatus;			// 받은 사람의 쪽지 삭제 여부
	
	private String userId;
	
	private String type;			// 쪽지 타입 (받은 쪽지, 보낸 쪽지)
	private String userStatus;		// 회원 탈퇴 여부
	private Date deleteDate;		// 쪽지 삭제 날짜
}
