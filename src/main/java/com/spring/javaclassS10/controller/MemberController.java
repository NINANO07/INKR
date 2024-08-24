package com.spring.javaclassS10.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.service.BookclubService;
import com.spring.javaclassS10.service.ChallengeService;
import com.spring.javaclassS10.service.MeetupService;
import com.spring.javaclassS10.service.MemberService;
import com.spring.javaclassS10.service.NotificationService;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.CountryCodeVO;
import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.MessageVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaMailSender mailsender;
	
	@Autowired
	NotificationService notificationService;
	
	@Autowired 
	BookclubService bookclubService;
	
	@Autowired
	ChallengeService challengeService;
	
	@Autowired
	MeetupService meetupService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	JavaclassProvide javaclassProvide;
	
	@RequestMapping(value="/memberLogin", method = RequestMethod.GET)
	public String memberLoginGet(Model model) {
		
		model.addAttribute("login", true);
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLogin", method = RequestMethod.POST)
	public String memberLoginPost(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(name ="mid", defaultValue = "hkd1234", required = false) String mid,
			@RequestParam(name ="pwd", defaultValue = "1234", required = false) String pwd,
			@RequestParam(name ="idSave", defaultValue = "off", required = false) String idSave
			) {
		
		MemberVO vo = memberService.getIdCheck(mid);
		
		if(vo != null && vo.isActive() && passwordEncoder.matches(pwd, vo.getPwd())) {
			session.setAttribute("sMid", mid);
			session.setAttribute("sPhoto", vo.getPhoto());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sName", vo.getFirstName());
			session.setAttribute("sLevelB", vo.getLevelB());
			session.setAttribute("sLevelC", vo.getLevelC());
			session.setAttribute("sLevelM", vo.getLevelM());
			
			if(idSave.equals("on")) {
				Cookie cookieMid = new Cookie("cMid", mid);
				cookieMid.setPath("/");
				cookieMid.setMaxAge(60*60*24*7);
				response.addCookie(cookieMid);
			} else {
				Cookie[] cookies = request.getCookies();
				if(cookies != null) {
					for(int i=0; i<cookies.length; i++) {
						if(cookies[i].getName().equals("cMid")) {
							cookies[i].setPath("/");
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
							break;
						}
					}
				}
			}
			
			memberService.setUpdateVisitCnt(mid);
			
			if(mid.equals("admin")) {
				return "redirect:/message/adminLogin";
			}
	
			return "redirect:/message/memberLoginOk";
			
		}else return "redirect:/message/memberLoginNo";
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.GET)
	public String memberJoinGet(Model model) {
		
		
		ArrayList<CountryCodeVO> vos = memberService.getCountrycodeList();
	
		model.addAttribute("join", true);
		model.addAttribute("cVos", vos);
		
		return "member/memberJoin";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberIdCheck", method = RequestMethod.POST)
	public String memberIdCheckPost(String mid) {
		int res =0;
		MemberVO vo = memberService.getIdCheck(mid);
		if(vo == null) res =1;
		
		return res+"";
	}
	
	@RequestMapping(value="/memberJoin", method = RequestMethod.POST)
	public String memberJoinPost(MemberVO vo, MultipartFile file, HttpSession session) {
		if(memberService.getIdCheck(vo.getMid()) != null) return "redirect:/message/idCheckNo";
		//else if(memberService.getEmailCheck(vo.getEmail()) != null) return "redirect:/message/idEmailNo";
		
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		vo.setTel(vo.getAreaTel()+"/"+vo.getTel());
		
		vo.setBirthday(vo.getBirthday().substring(0,4)+"-"+vo.getBirthday().substring(5,7)+"-"+vo.getBirthday().substring(8,10));
		
		if(!file.getOriginalFilename().equals("")) vo.setPhoto(memberService.fileUpload(file, vo.getMid(), ""));
		else vo.setPhoto("nopimg.jpg");
		
		int res = memberService.setMemberJoin(vo);
		
		if(res != 0) {
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sPhoto", vo.getPhoto());
			session.setAttribute("sName", vo.getFirstName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLevelB", vo.getLevelB());
			session.setAttribute("sLevelC", vo.getLevelC());
			session.setAttribute("sLevelM", vo.getLevelM());
			memberService.setUpdateVisitCnt(vo.getMid());
			return "redirect:/message/memberJoinOk";
		}
		else return "redirect:/message/memberJoinNo";
	}
	
	@RequestMapping(value="/memberMain", method = RequestMethod.GET)
	public String memberMainGet(Model model) {
		
		return "member/memberMain";
	}
	
	@RequestMapping(value="/memberLogout", method = RequestMethod.GET)
	public String memberLogoutGet(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberPwdFind", method = RequestMethod.GET)
	public String memberPwdFind(Model model) {
		model.addAttribute("join", true);
		return "member/memberPwdFind";
	}
	
	@RequestMapping(value="/memberPwdFind", method = RequestMethod.POST)
	public String memberPwdFindPost(MemberVO vo) {
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		
		memberService.resetPassword(vo.getMid(), vo.getPwd());
		
		return "redirect:/message/resetPwdOk";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberBlock", method = RequestMethod.POST)
	public String memberBlock(String toMid, String mid) {
		memberService.memberBlock(toMid, mid);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/memberNewPassword", method=RequestMethod.POST)
	public String memberNewPassword(String mid) {
		MemberVO vo = memberService.getIdCheck(mid);
		String email = vo.getEmail();
		String code = RandomStringUtils.randomAlphanumeric(6);
		String title = "새로운 비밀번호를 설정하기 위한 코드입니다.";
		String mailFlag = "code : " + code;
		
		try {
			mailSend(email, title, mailFlag);
		} catch (MessagingException e) {
			e.getMessage();
		}
		
		System.out.println(code);
		return code;
	}
	
	
	private String mailSend(String toMail, String title, String mailFlag) throws MessagingException {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String content="";
		
		// 메일 전송을 위한 객체 : MimeMessage(), MimeMessageHelper()
		MimeMessage message = mailsender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		// 메일 보관함에 작성한 메세지들의 정보를 모두 저장시킨후, 작업 처리...
		messageHelper.setTo(toMail); //받는사람 메일 주소
		messageHelper.setSubject(title); // 메일 제목
		messageHelper.setText(content);
		
		//메세지 보관함의 내용(content) 발신자의 필요한 정보를 추가로 담아서 전송 처리...
		content = content.replace("\n", "<br>");
		content += "<br><hr><h3>"+mailFlag+"</h3><hr><br>";
		content += "<p><img src=\"cid:logo.jpg\" width='500px'></p>";
		content += "<p>방문하기 : <a href='http://49.142.157.251:9090/javaclassJ10/Main'>javaclass</a></p>";
		content += "<hr>";
		messageHelper.setText(content, true);
		FileSystemResource file = new FileSystemResource(request.getSession().getServletContext().getRealPath("/resources/images/logo.jpg"));
		messageHelper.addInline("logo.jpg", file);
		
		mailsender.send(message);
		
		
		return "1";
	}
	
	@RequestMapping(value="/memberPage", method=RequestMethod.GET )
	public String memberPage() {

		return "member/memberPage";
	}

	@ResponseBody
	@RequestMapping(value="/pointAmount", method=RequestMethod.POST )
	public int pointAmount(String mid) {
		int amount = memberService.pointAmount(mid);
		
		
		return amount;
	}
	
	@ResponseBody
	@RequestMapping(value="/checked", method=RequestMethod.POST )
	public String checked(String mid, String section) {
		
		notificationService.updateStatus(mid, section);
		
		return "";
	}
	
	@RequestMapping(value="/memberGuest", method=RequestMethod.POST )
	public String checked(String name, String phone, String subject, String toMid, String fromMid) {
		
		MessageVO vo = new MessageVO();
		vo.setSubject("name :" +name+ ", phone : " + phone+"," +subject);
		vo.setToMid(toMid);
		vo.setFromMid(fromMid);
		
		memberService.sendMessage(vo);
		
		return "redirect:/message/guestMessageOk";
	}
	
	@RequestMapping(value="/memberPage/{mid}", method= RequestMethod.GET)
	public String adminUser(Model model,
			@PathVariable("mid") String mid) {

		MemberVO vo = memberService.getIdCheck(mid);
		
		BookclubMemberVO bk = bookclubService.getMemberDetail(mid);
		ChallengeLikeVO ch= challengeService.getMemberDetail(mid);
		MeetupMemberVO mu = meetupService.getMemberDetail(mid);
		ArrayList<CountryCodeVO> vos = memberService.getCountrycodeList();
		
		vo.setAreaTel(vo.getTel().split("/")[0]);
		vo.setTel(vo.getTel().split("/")[1]);

		model.addAttribute("cVos", vos);
		model.addAttribute("bk", bk);
		model.addAttribute("ch", ch);
		model.addAttribute("mu", mu);		
		model.addAttribute("vo", vo);
		return "member/memberPage";
	}
	
	@RequestMapping(value="/memberPhotoChange", method= RequestMethod.POST)
	public String adminUser(MultipartFile file, MemberVO vo) {
		if(!file.getOriginalFilename().equals("")) vo.setPhoto(memberService.fileUpload(file, vo.getMid(), vo.getPhoto()));
		else vo.setPhoto(vo.getPhoto());
		memberService.changePhoto(vo);
		
		return"redirect:/member/memberPage/"+vo.getMid();
	}
	
	@RequestMapping(value="/memberEdit", method= RequestMethod.POST)
	public String memberEdit(MemberVO vo) {
		memberService.updateUserInfo(vo);
		
		return"redirect:/member/memberPage/"+vo.getMid();
	}
	
	@RequestMapping(value="/memberMessage", method= RequestMethod.POST)
	public String adminMessage(MessageVO vo) {

		 memberService.sendMessage(vo);

		return "redirect:/message/memberMessageOk?mid="+vo.getFromMid();
	}
	
	@RequestMapping(value="/memberMessage", method= RequestMethod.GET)
	public String adminMessageGet(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");

		List<MessageVO> invos = memberService.getInMessage(mid);
		List<MessageVO> stvos = memberService.getStMessage(mid);
		
		List<MemberVO> memvos = memberService.getMemberList();
		
		model.addAttribute("invos", invos);
		model.addAttribute("stvos", stvos);
		model.addAttribute("memvos", memvos);
		
		return "member/memberMessage";
	}
}
