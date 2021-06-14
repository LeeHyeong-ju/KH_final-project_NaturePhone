package com.kh.naturephone.myPage2.dealInfo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.naturephone.myPage2.dealInfo.model.dao.BuyInfoDao;

@Service
public class BuyInfoServiceImpl implements BuyInfoService{
	@Autowired
	private BuyInfoDao biDao;

}
