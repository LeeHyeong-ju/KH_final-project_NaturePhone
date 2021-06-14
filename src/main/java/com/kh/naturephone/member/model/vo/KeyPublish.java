package com.kh.naturephone.member.model.vo;

public class KeyPublish {
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
}
