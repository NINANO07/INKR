package com.spring.javaclassS10.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.javaclassS10.service.BookclubService;
import com.spring.javaclassS10.vo.BookclubMemberVO;

import io.opentelemetry.exporter.logging.SystemOutLogRecordExporter;

public class BookclubInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	BookclubService bookclubService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String uri = request.getRequestURI();
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid") == null ? ""  : (String) session.getAttribute("sMid");
		if(uri.contains("/bookclub/bookclubQnA/") && !mid.equals("admin")) {
			int idx = Integer.parseInt(uri.substring(uri.lastIndexOf("/")+1));
			BookclubMemberVO vo = bookclubService.isBookClubMember(idx, mid);
			if(vo == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/message/noBookclubMember");
				dispatcher.forward(request, response);
				return false;
			}
		} else if(uri.contains("/bookclub/bookclubAnswer/") && !mid.equals("admin")) {
			int lastSlashIndex = uri.lastIndexOf("/");
			int secondLastSlashIndex = uri.lastIndexOf("/", lastSlashIndex - 1);
			int idx = Integer.parseInt(uri.substring(secondLastSlashIndex + 1, lastSlashIndex));
			BookclubMemberVO vo = bookclubService.isBookClubMember(idx, mid);
			if(vo == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/message/noBookclubMember");
				dispatcher.forward(request, response);
				return false;
			}
		}else if(uri.contains("bookclub/bookclubVocaByLang") && !mid.equals("admin")) {
			String qS = request.getQueryString();
			int idx =0;
			
			if(qS.contains("&")) idx = Integer.parseInt(qS.substring(4, qS.indexOf("&")));
			else idx= Integer.parseInt(qS.substring(4));
				
	        BookclubMemberVO vo = bookclubService.isBookClubMember(idx, mid);
			if(vo == null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/message/noBookclubMember");
				dispatcher.forward(request, response);
				return false;
			}	
		}
		
		return true;
	}
}
