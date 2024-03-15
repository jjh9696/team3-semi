package com.kh.semiteam3.interceptor;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class MemberInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();//세션객체 꺼내기
		String loginId = (String)session.getAttribute("loginId");//사용자 아이디 추출
		
		if(loginId != null) {//회원일때
			return true;
		}
		else {//로그인 페이지로
			response.sendRedirect("/member/login");
            return false;
		}
	}
	

}
