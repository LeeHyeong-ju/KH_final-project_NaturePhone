package com.kh.naturephone.admin.model.service;

import java.util.List;

import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;

public interface AdminService {

	int selectMemberListCount();

	List<Member> selectMemberList(PageInfo pi);

}
