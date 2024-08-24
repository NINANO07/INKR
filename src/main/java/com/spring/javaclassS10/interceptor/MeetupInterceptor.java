package com.spring.javaclassS10.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.javaclassS10.service.MeetupService;
import com.spring.javaclassS10.vo.MeetupMemberVO;

public class MeetupInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MeetupService meetupService;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri= request.getRequestURI();
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid") == null ? ""  : (String) session.getAttribute("sMid");
		if(uri.contains("/meetup/meetupRoom/") && !mid.equals("admin")) {
			System.out.println(uri);
			int idx =Integer.parseInt(uri.substring(uri.lastIndexOf("/")+1));
			MeetupMemberVO vo = meetupService.getMeetupMember(idx, mid);
			if(vo == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/message/noMeetupMember");
				dispatcher.forward(request, response);
				return false;
			}
		}

		return true;
	}
}
