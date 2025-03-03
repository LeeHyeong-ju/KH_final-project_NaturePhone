package com.kh.naturephone.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.google.gson.GsonBuilder;
import com.kh.naturephone.common.B_Att_TB;
import com.kh.naturephone.common.Board_TB;
import com.kh.naturephone.common.PageInfo;
import com.kh.naturephone.common.Pagination;
import com.kh.naturephone.common.Search;
import com.kh.naturephone.member.model.vo.Member;
import com.kh.naturephone.notice.model.exception.NoticeException;
import com.kh.naturephone.notice.model.service.NoticeService;
import com.kh.naturephone.notice.model.vo.Reply;
import com.kh.naturephone.support.controller.SupportController;


@Controller
@RequestMapping("/notice")
public class NoticeController {
   @Autowired
   private NoticeService nService;
   
   private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
   
   @GetMapping("/list")
   public ModelAndView noticeList(ModelAndView mv,
            @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
         // -> 메뉴바 클릭 시 page라는 파리미터는 없으므로 required=false, 넘어오는 값이 없을 시 기본값 1로 설정
         
         // 게시글 개수 구하기
         int listCount = nService.selectListCount();
         
         // PageInfo 객체 생성
         PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
         
         // 요청페이지에 맞는 게시글 리스트 조회
         List<Board_TB> list = nService.selectList(pi);
         
         if(list != null) {
            mv.addObject("list", list);
            mv.addObject("pi", pi);
            mv.setViewName("service/serviceNoticeList");
         } else {
            mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
            mv.setViewName("common/errorPage");
         }
         return mv;
      }
            
   // 게시글 작성 페이지로 이동
   @GetMapping("/write")
   public String writePageView() {
      return "service/serviceNoticeInsert";
   }
   
   // 게시글 작성 - 파일첨부(리네임)
   @PostMapping("/insert")
   public String boardInsert(Board_TB notice,
                       @RequestParam(value="uploadFile") MultipartFile file,
                       HttpServletRequest request) throws NoticeException {
         notice.setCategory("공지");
         B_Att_TB att = new B_Att_TB();
         int result2 = 0;
         
         int result1 = nService.insertNotice(notice);
         
         if(result1 > 0) {
            if(!file.getOriginalFilename().equals("")) {
               String nrenameName = saveFile(file, request);
               
               if(nrenameName != null) {
                  att.setBforiginalName(file.getOriginalFilename());
                  att.setBfrenameName(nrenameName);
                  att.setBffilePath("/nuploadFiles/" + file.getOriginalFilename());
                  
                  result2 = nService.insertNoticeAtt(att);
                  
                  if(result2 > 0) {
                     return "redirect:/notice/list";
                  } else {
                     throw new NoticeException("첨부파일 등록에 실패했습니다.");
                  }
               }                     
            }
            
            return "redirect:/notice/list";
         } else {
            throw new NoticeException("게시글 등록에 실패했습니다.");   
         }
   }
   
   public String saveFile(MultipartFile file, HttpServletRequest request) {
      
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "\\nuploadFiles";
      File folder = new File(savePath);
      if(!folder.exists()) folder.mkdirs(); 
      

      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
      String noriginalName = file.getOriginalFilename();
      String nrenameName = sdf.format(new Date()) + "_"  
                       +   (int)(Math.random() * 100000)
                       + noriginalName.substring(noriginalName.lastIndexOf("."));
      
      String renamePath = folder + "\\" + nrenameName;
      
      try {

         file.transferTo(new File(renamePath));
      } catch (IllegalStateException | IOException e) {
         System.out.println("파일 업로드 에러 : " + e.getMessage());
      }

      return nrenameName;
   }
   
   @GetMapping("/search")
   public ModelAndView noticeSearch(@ModelAttribute Search search,
                        ModelAndView mv,
                        @RequestParam(value="page", required=false, defaultValue="1") int currentPage) {
      
      int listCount = nService.searchListCount(search);
      
      PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
      
      List<Board_TB> searchList = nService.searchList(search, pi);
      
      if(searchList != null) {
         mv.addObject("list", searchList);
         mv.addObject("pi", pi);
         mv.setViewName("service/serviceNoticeList");
      } else {
         mv.addObject("msg", "게시글 전체 조회에 실패했습니다.");
         mv.setViewName("common/errorPage");
      }
      return mv;
   }
   
   @GetMapping("/detail")
   public String noticeDetail(int bno,
                       HttpServletRequest request,
                       HttpServletResponse response,
                       Model model) {
      boolean flagblist = false;   // nlist라는 이름의 쿠키가 있는지 확인
      boolean flagbid = false;   // nlist 안에 해당 bno가 포함 되어 있는지 확인
      
      Cookie[] cookies = request.getCookies();
      
      try {
         if(cookies != null) {
            for(Cookie c : cookies) {
               // 읽은 게시글의 bno를 모아서 보관하는 nlist가 쿠키 안에 있다면
               if(c.getName().equals("nlist")) {
                  flagblist = true;
                  // 기존 쿠키 값 먼저 읽어옴(, 등의 특수문자 인코딩 때문에 decode 처리)
                  String nlist = URLDecoder.decode(c.getValue(), "UTF-8");
                  // , 구분자 기준으로 나누기
                  String[] list = nlist.split(",");
                  for(String st : list) {
                     // 쿠키 안에 지금 클릭한 게시글의 bno가 들어 있다면 => 읽었음을 표시
                     if(st.equals(String.valueOf(bno))) flagbid = true;
                  }
                  if(!flagbid) {   // 게시글을 읽지 않았다면
                     // 지금 게시글을 읽었다는 의미로 nlist에 bno를 추가해서 인코딩한 문자로 쿠키 값을 새롭게 설정
                     c.setValue(URLEncoder.encode(nlist + "," + bno, "UTF-8"));
                     response.addCookie(c);   // 응답에 담아 보냄
                  }
               } 
            }
            if(!flagblist) {
               // nlist라는 쿠키가 존재하지 않는 경우 새로 생성해서 지금 게시글의 bno를 value로 추가
               Cookie c1 = new Cookie("nlist", URLEncoder.encode(String.valueOf(bno), "UTF-8"));
               response.addCookie(c1);
               
            }
         }
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      
      // flagbid가 true이면 읽은 게시글, flagbid가 false이면 읽지 않은 게시글
      // !flagbid를 전달하여 true이면 조회수 증가 필요, false이면 조회수 증가 불필요
      Board_TB n = nService.selectNotice(bno, !flagbid);
      
      // *** Ajax 이후 댓글 처리 ***
      List<Reply> rlist = nService.selectReplyList(bno);
      
      if(n != null) {
         model.addAttribute("notice", n);
         // *** Ajax 이후 댓글 처리 ***
         model.addAttribute("rlist", rlist);
         return "service/serviceNoticeDetail";
      } else {
         model.addAttribute("msg", "게시글 상세보기에 실패하였습니다.");
         return "common/errorPage";
      }
   }
   
   @GetMapping("/updatePage")
   public String updatePageView(int bno, Model model) {
      // 조회수 증가 없이 bid로 조회한 Board 객체 리턴
      Board_TB n = nService.selectNotice(bno, false);
      B_Att_TB na = nService.selectNoticeAtt(bno);
      
      model.addAttribute("notice", n);
      
      if(na != null) {
         model.addAttribute("file", na);
      }
      
      return "service/serviceNoticeUpdate";
   }
   
   @PostMapping("/update")
   public String boardUpdate(Board_TB n,
                       B_Att_TB na,
                       @RequestParam(value="uploadFile") MultipartFile file,
                       HttpServletRequest request) throws NoticeException {
      int result = 0;
      
      if(!file.getOriginalFilename().equals("")) {
         
         int result1 = 0;
         
         String renameFileName = saveFile(file, request);
         
         if(renameFileName != null){
            if(na.getBfrenameName() != null) {
               deleteFile(na.getBfrenameName(), request);
               
               na.setBforiginalName(file.getOriginalFilename());
               na.setBfrenameName(renameFileName);
               na.setBffilePath("/nuploadFiles/" + file.getOriginalFilename());
               
               result1 = nService.updateNoticeAtt(na);
            } else {
               na.setBforiginalName(file.getOriginalFilename());
               na.setBfrenameName(renameFileName);
               na.setBffilePath("/nuploadFiles/" + file.getOriginalFilename());
               
               result1 = nService.insertNoticeAtt(na, n.getBno());
            }
            
            if(result1 > 0) {
               result = nService.updateNotice(n);
            } else {
               throw new NoticeException("파일 업로드에 실패하였습니다.");
            }
         }
      }
      else {
         result = nService.updateNotice(n);
      }
      
      if(result > 0) {
         return "redirect:/notice/detail?bno=" + n.getBno();
      } else {
         throw new NoticeException("게시글 수정에 실패하였습니다.");
      }
   }

   public void deleteFile(String fileName, HttpServletRequest request) {
      String root = request.getSession().getServletContext().getRealPath("resources");
      String savePath = root + "\\nuploadFiles";
      File f = new File(savePath + "\\" + fileName);
      if(f.exists()) f.delete();
   }
   
   @RequestMapping("/delete")
   public String NoticeDelete(int bno, HttpServletRequest request) throws NoticeException {
      
      B_Att_TB att = nService.selectNoticeAtt(bno);
      
      if(att != null) {
         deleteFile(att.getBfrenameName(), request);            
      }            
      
      int result = nService.deleteNotice(bno);
            
      if(result > 0) {      
         return "redirect:/notice/list";
      } else {
         throw new NoticeException("게시글 삭제에 실패했습니다.");
      }   
   }
   
   @PostMapping(value="/insertReply", produces="application/json; charset=utf-8")
   public @ResponseBody String insertReply(Reply r, HttpSession session) {
      
      Member loginUser = (Member)session.getAttribute("loginUser");
      int userno = loginUser.getUserNo();
      r.setUserno(userno);
      List<Reply> rlist = nService.insertNoticeReply(r); 
      
      Gson gson = new GsonBuilder()
                  .setDateFormat("yy.MM.dd hh:mm")
                  .create();
            
      return gson.toJson(rlist);
   }
   
   @PostMapping(value="/deleteReply")
   public @ResponseBody String deleteReply(Reply r) {
      
      int result = nService.deleteReply(r);
            
      return Integer.toString(result);
   }
   
   @GetMapping("/mainList")
	public ModelAndView noticeList(ModelAndView mv) {
		List<Board_TB> list = nService.selectMainList();
		System.out.println("mainlist : " + list);
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("common/mainPage");
		} else {
			mv.addObject("msg", "공지사항 목록 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}












