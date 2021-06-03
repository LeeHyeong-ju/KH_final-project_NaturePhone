package com.kh.naturephone.support.model.dao;

import java.util.List;

import com.kh.naturephone.support.model.vo.Phone;

public interface SupportDao {

	List<Phone> selectPhoneList(Phone p);

}
