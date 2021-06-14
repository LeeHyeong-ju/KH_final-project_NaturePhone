package com.kh.naturephone.myPage2.dealInfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.naturephone.myPage2.dealInfo.model.service.BuyInfoService;

@Controller
@RequestMapping("/buyInfo")
public class BuyInfoController {
	@Autowired
	private BuyInfoService biService;
	

}
