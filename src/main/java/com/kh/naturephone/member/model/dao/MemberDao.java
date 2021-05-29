package com.kh.naturephone.member.model.dao;

import com.kh.naturephone.member.model.vo.Member;

public interface MemberDao {
	
	// 1. 회원 로그인 서비스를 위한 메소드
	Member selectMember(Member m);


}
