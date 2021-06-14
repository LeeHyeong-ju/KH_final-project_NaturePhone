package com.kh.naturephone.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.naturephone.attachment.model.vo.Attachment;
import com.kh.naturephone.boardFree.model.vo.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.goods.model.service.GoodsService;
import com.kh.naturephone.goods.model.vo.Goods;
import com.kh.naturephone.support.model.vo.Phone;


@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	private GoodsService gService;
	int count = 0;

	@PostMapping("/insert")
	public String goodsInsert(@ModelAttribute() Goods g,
							  @RequestParam(value="att") MultipartFile[] files,
							  @RequestParam(value="year") String year,
							  @RequestParam(value="month", required = false) String month,
							  @RequestParam(value="day", required = false) String day,// defaultValue="1" 지우기
							  @RequestParam(value="gphone") String modelName, // 제품 모델 명
							  HttpServletRequest request) {
		
		Phone phoneForName = gService.selectPFN(modelName);  // 넘어온 모델명과 같은 폰객체	
		//System.out.println(phoneForName);
		int proNo = phoneForName.getProno();			// 제품번호 가져와서 변수에 저장
		
		g.setProNo(proNo);								   // 넘어온 물품 객체에 제품번호 저장 
			
		String openDate = year + " " + month + " " + day; // 개통일 문자값 합치기
		g.setOpenDate(openDate); // 개통일 저장
		// System.out.println(g.getUserNo());

		
		

		int insertReslut = gService.insertGoods(g); 
		
		
		
		
	
		int length = files.length;
		String[] renameFileName = new String[length];		
		// 이미지 파일 첨부 
		for(int i = 0; i < length; i++) {
			Attachment att = new Attachment();
			if(!files[i].getOriginalFilename().equals("")) {			
				renameFileName[i] = saveFile(files[i], request);
				
				if(renameFileName[i] != null) {	
					att.setGoodsNo(insertReslut - 1);				
					att.setGaFileName(files[i].getOriginalFilename());
					att.setGaRename(renameFileName[i]);
					att.setGaOrder(i + 1);
					att.setGaFilePath("C:\\workspace\\Spring\\workspace\\naturephone\\src\\main\\webapp\\resources\\guploadFiles");					
				}			
			}
			
			// 첨부이미지 정보 DB insert
			gService.insertAtt(att);
			
			
		}
		
		if(insertReslut > 0) {
			return "redirect:/goods/list";
		} else {
			return "common/errorPage";
		}
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
	
	@GetMapping("/ginsertpage")
	public String insertPage() {
		return "goods/goodsInsert";
	}
	
	
	@GetMapping("/productName")
	public void productName(HttpServletResponse response,
							HttpServletRequest request) throws IOException {  
		String keyword = request.getParameter("keyword");
		
		if(keyword != "" && keyword != null) {
			List<Phone> list = gService.productName(keyword);
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(new Gson().toJson(list));
			
			out.flush();
			out.close();
		}

	}
	
	@GetMapping("/list")
	public ModelAndView SelectgoodsList(ModelAndView mv,
			 					  @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
		
		int listCount = gService.selectGoodsListCount();
		
		// System.out.println(listCount);
		
		// 요청 페이지에 맞는 게시글 리스트 조회
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		List<Map<String, String>> list = gService.selectGoodsList(pi);
		// System.out.println(list.get(0));
		
		List<Phone> phoneNameList = new ArrayList<Phone>();
		
		// 물품 게시글 당 제품 이름 알아오기
		for(Map<String, String> m : list) {
			String proNoString = String.valueOf(m.get("proNo"));
			int proNo = Integer.parseInt(proNoString);
			Phone p = gService.selectPhoneNameList(proNo);
			phoneNameList.add(p);
		}
		
		// System.out.println(phoneNameList);
		
		// 첨부파일 가져오기
		List<Attachment> attList = gService.selectAttList();
		
		
		if(list.get(0) != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("attList", attList);
			mv.addObject("phoneNameList", phoneNameList);
			mv.setViewName("goods/goodsList");
		} else {
			mv.addObject("msg", "물품 조회 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	
}
