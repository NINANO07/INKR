package com.spring.javaclassS10.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value="/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model,
			@PathVariable String msgFlag,
			@RequestParam(name="idx", defaultValue = "", required = false) Integer idx,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid
			) {
		
		if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("msg", "가입완료");
			model.addAttribute("url", "member/memberMain");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("msg", "가입실패");
			model.addAttribute("url", "member/memberJoin");
		}
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("msg", "no");
			model.addAttribute("url", "member/memberMain");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("msg", "incorrect");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("bookclubUnOk")) {
			model.addAttribute("msg", "탈퇴되었습니다.");
			model.addAttribute("url", "bookclub/bookclubList");
		}
		else if(msgFlag.equals("bookclubDeleteOk")) {
			model.addAttribute("msg", "삭제되었습니다.");
			model.addAttribute("url", "bookclub/bookclubList");
		}
		else if(msgFlag.equals("bookclubDeleteNo")) {
			
			model.addAttribute("msg", "삭제불가합니다.");
			model.addAttribute("url", "bookclub/bookclubList");
		}
		else if(msgFlag.equals("meetupCreateOk")) {
			
			model.addAttribute("msg", "create ok");
			model.addAttribute("url", "meetup/meetupMain");
		}
		else if(msgFlag.equals("resetPwdOk")) {
			
			model.addAttribute("msg", "Your password has been successfully changed");
			model.addAttribute("url", "member/memberLogin");
		}
		else if(msgFlag.equals("waitingOk")) {
			model.addAttribute("msg", "You are on the waitlist!");
			model.addAttribute("url", "meetup/meetupInfo?idx="+idx);
		}
		else if(msgFlag.equals("meetUpdelete")) {
			model.addAttribute("msg", "Successfully deleted.");
			model.addAttribute("url", "meetup/meetupMain");
		}
		else if(msgFlag.equals("userEditOkay")) {
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "admin/adminUserInfo/"+mid);
		}
		else if(msgFlag.equals("userEditOkay")) {
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "admin/adminUserInfo/"+mid);
		}
		else if(msgFlag.equals("sendOk")) {
			model.addAttribute("msg", "메세지를 보냈습니다.");
			model.addAttribute("url", "admin/adminUserInfo/"+mid);
		}
		else if(msgFlag.equals("adminLogin")) {
			model.addAttribute("msg", "관리자님 안녕하세요");
			model.addAttribute("url", "admin/adminMain");
		}
		else if(msgFlag.equals("reportDeleteOk")) {
			model.addAttribute("msg", "삭제되었습니다");
			model.addAttribute("url", "admin/adminReport");
		}
		else if(msgFlag.equals("alreadyDeleted")) {
			model.addAttribute("msg", "이미 삭제된 게시글입니다.");
			model.addAttribute("url", "admin/adminReport");
		}
		else if(msgFlag.equals("sendOkFrom")) {
			model.addAttribute("msg", "메세지를 보냈습니다.");
			model.addAttribute("url", "admin/adminMessage");
		}
		else if(msgFlag.equals("guestMessageOk")) {
			model.addAttribute("msg", "성공적으로 메세지를 보냈습니다.");
			model.addAttribute("url", "/");
		}
		else if(msgFlag.equals("AdminNo")) {
			model.addAttribute("msg", "관리자 페이지입니다.");
			if(mid.equals("")) model.addAttribute("url", "/");
			else model.addAttribute("url", "member/memberMain");
			
		}
		else if(msgFlag.equals("noBookclubMember")) {
			model.addAttribute("msg", "북클럽에 가입하세요.");
			model.addAttribute("url", "bookclub/bookclubList");
		}
		else if(msgFlag.equals("memberMessageOk")) {
			model.addAttribute("msg", "문의가 완료되었습니다.");
			model.addAttribute("url", "member/memberPage/"+mid);
		}
		else if(msgFlag.equals("noMeetupMember")) {
			model.addAttribute("msg", "Meetup에 참가하세요.");
			model.addAttribute("url", "meetup/meetupMain");
		}
		else if(msgFlag.equals("memberNo")) {
			model.addAttribute("msg", "로그인 하세요.");
			model.addAttribute("url", "member/memberLogin");
		}
		
		return "include/message";
	}
}
