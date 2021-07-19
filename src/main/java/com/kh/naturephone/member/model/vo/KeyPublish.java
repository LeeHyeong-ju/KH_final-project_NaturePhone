package com.kh.naturephone.member.model.vo;

public class KeyPublish {
	
	// 메일 인증 키와 비밀번호 변경키에 이용되는 메소드
	public static String createKey() {
		
		char[] charSet= { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
						 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
						 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
						 'W', 'X', 'Y', 'Z',
						 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
						 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
						 'w', 'x', 'y', 'z',
						 '!', '@', '#', '$', '%', '^', '&', '+', '=', '.' };
		
		StringBuffer key = new StringBuffer();
		
		for(int i = 0; i < 10; i++) {
			int index = (int) (charSet.length * Math.random());
			key.append(charSet[index]);
		}
		return key.toString();
	}
	
	// 간편로그인 - 네이처폰 아이디 부여
	public static String createId() {
		
		char[] charSet= {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
						 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
						 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
						 'w', 'x', 'y', 'z'};
		
		StringBuffer id = new StringBuffer();
		
		for(int i = 0; i < 5; i++) {
			int index = (int) (charSet.length * Math.random());
			id.append(charSet[index]);
		}
		return id.toString();
	}
}
