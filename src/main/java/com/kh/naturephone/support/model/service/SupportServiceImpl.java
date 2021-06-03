package com.kh.naturephone.support.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.support.model.dao.SupportDao;
import com.kh.naturephone.support.model.vo.Phone;

@Service
public class SupportServiceImpl implements SupportService {
	@Autowired
	private SupportDao sDao;

	@Override
	public List<Phone> selectPhoneList(Phone p) {
		return sDao.selectPhoneList(p);
	}
	
}
