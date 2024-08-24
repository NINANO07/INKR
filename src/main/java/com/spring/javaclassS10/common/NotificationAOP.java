package com.spring.javaclassS10.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.spring.javaclassS10.service.MemberService;
import com.spring.javaclassS10.service.NotificationService;
import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.NotificationVO;

@Component
@Aspect
public class NotificationAOP {
	@Autowired
	HttpServletRequest request;
		
	@Autowired
	NotificationService notificationService;
	
	@Autowired
	MemberService memberService;
	
	@Around("execution(* com.spring.javaclassS10.controller..*(..))")
	public Object addNotifications(ProceedingJoinPoint joinPoint) throws Throwable {
		String mid = (String) request.getSession().getAttribute("sMid");
		Object[] args = joinPoint.getArgs();
		
		for (Object arg : args) {
			if(arg instanceof Model) {
				Model model = (Model) arg;
				if(mid != null) {
					List<NotificationVO> ntfBVos = notificationService.getNotreadMessage(mid, "bookclub");
					List<NotificationVO> ntfCVos = notificationService.getNotreadMessage(mid, "challenge");
					List<NotificationVO> ntfMVos = notificationService.getNotreadMessage(mid, "meetup");
					
					MemberVO memberInfo = memberService.getIdCheck(mid);
					
					model.addAttribute("ntfBVos", ntfBVos);
					model.addAttribute("ntfCVos", ntfCVos);
					model.addAttribute("ntfMVos", ntfMVos);
					model.addAttribute("member", memberInfo);
					
				}
			}
		}

		return joinPoint.proceed();
	}
	
}
