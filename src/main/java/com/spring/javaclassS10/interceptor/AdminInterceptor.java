package com.spring.javaclassS10.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("sMid") == null ? ""  : (String) session.getAttribute("sMid");
		
		if(!id.equals("admin")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/message/AdminNo?mid="+id);
			dispatcher.forward(request, response);
			return false;
		}
		return true;
	}

}
