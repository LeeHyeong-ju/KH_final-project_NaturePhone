package com.kh.naturephone.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.admin.model.dao.AdminDao;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao aDao;

	@Override
	public int selectMemberListCount() {
		return aDao.selectMemberListCount();
	}

	@Override
	public List<Member> selectMemberList(PageInfo pi) {
		return aDao.selectMemberList(pi);
	}

}
