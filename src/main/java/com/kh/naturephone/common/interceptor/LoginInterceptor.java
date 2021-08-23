package com.kh.naturephone.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.naturephone.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			System.out.println(1);
			logger.info("비 로그인 상태에서 [ {} ] 접근하려고 함!", request.getRequestURI());
			session.setAttribute("msg", "로그인 후 이용할 수 있습니다.");
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	
}
