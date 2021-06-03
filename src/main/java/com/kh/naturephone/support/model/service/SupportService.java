package com.kh.naturephone.support.model.service;

import java.util.List;

import com.kh.naturephone.support.model.vo.Phone;

public interface SupportService {

	List<Phone> selectPhoneList(Phone p);

}
