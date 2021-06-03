package com.kh.naturephone.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.goods.model.service.GoodsService;
import com.kh.naturephone.goods.model.vo.Goods;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService gService;
	

	@PostMapping("/insert")
	public String goodsInsert(Goods g,
							  @RequestParam(value="att") MultipartFile[] files,
							  @RequestParam(value="userNo", defaultValue="1") int userNo, // defaultValue="1" 지우기
							  HttpServletRequest request) {
		g.setUserNo(userNo);
		int insertReslut = gService.insertGoods(g); 
		
		System.out.println(insertReslut);
		
		
	
		
		
		
		
		int length = files.length;
		String[] renameFileName = new String[length];		
		// 이미지 파일 첨부 
		for(int i = 0; i < length; i++) {
			Attachment att = new Attachment();
			if(!files[i].getOriginalFilename().equals("")) {			
				renameFileName[i] = saveFile(files[i], request);
				
				if(renameFileName[i] != null) {
					
					att.setGaFileName(files[i].getOriginalFilename());
					att.setGaRename(renameFileName[i]);
					att.setGaOrder(i + 1);
					att.setGaFilePath("C:\\workspace\\Spring\\workspace\\naturephone\\src\\main\\webapp\\resources\\guploadFiles");					
				}			
			}
			
			// 첨부이미지 정보 DB insert
			int dd = gService.insertAtt(att);
			
			
		}
		
		
		return "";
	}
	
	public String saveFile(MultipartFile files, HttpServletRequest reqeust) {
		String root = reqeust.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\guploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdir();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = files.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
								+ (int)(Math.random() * 100000)
								+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			files.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		}
		
		return renameFileName;
	}
	
	
	
	
	
}
