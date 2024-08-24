package com.spring.javaclassS10.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS10.service.BookclubService;
import com.spring.javaclassS10.service.ChallengeService;
import com.spring.javaclassS10.service.MeetupService;
import com.spring.javaclassS10.service.MemberService;
import com.spring.javaclassS10.vo.BookclubAVO;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.BookclubQVO;
import com.spring.javaclassS10.vo.BookclubReportVO;
import com.spring.javaclassS10.vo.BookclubVO;
import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.ChallengeVO;
import com.spring.javaclassS10.vo.CountryCodeVO;
import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MeetupVO;
import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.MessageVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired 
	BookclubService bookclubService;
	
	@Autowired
	ChallengeService challengeService;
	
	@Autowired
	MeetupService meetupService;
	
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value="/adminMain", method= RequestMethod.GET)
	public String adminMain(Model model) {
		List<BookclubVO> bvos = bookclubService.getBookclubList();
		List<ChallengeVO> cvos = challengeService.getChallenge("admin");
		List<MeetupVO> mvos = meetupService.getAllMeetup("all", "");
		
		model.addAttribute("bvos", JSONArray.fromObject(bvos));
		model.addAttribute("cvos", JSONArray.fromObject(cvos));
		model.addAttribute("mvos", JSONArray.fromObject(mvos));
		
		return"admin/adminMain";
	}
	
	@RequestMapping(value="/adminUser", method= RequestMethod.GET)
	public String adminUser(Model model, HttpSession session,
			@RequestParam(name="pag", defaultValue = "1", required = false) int pag,
			@RequestParam(name="pageSize", defaultValue = "10", required = false) int pageSize,
			@RequestParam(name="sort", defaultValue = "", required = false) String sort,
			@RequestParam(name="search", defaultValue = "", required = false) String search
		) {

		int totRecCnt = memberService.getMemberTotRecCnt(search);
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		List<MemberVO> mvos = memberService.getAllMember(startIndexNo, pageSize, sort, search);
		
		model.addAttribute("mvos", JSONArray.fromObject(mvos));
		model.addAttribute("pag", pag);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totPage", totPage);
		model.addAttribute("curScrStartNo", curScrStartNo);
		model.addAttribute("blockSize", blockSize);
		model.addAttribute("curBlock", curBlock);
		model.addAttribute("lastBlock", lastBlock);
		model.addAttribute("sort", sort);
		model.addAttribute("search", search);

		return"admin/adminUser";
	}
	
	@RequestMapping(value="/adminUserInfo/{mid}", method= RequestMethod.GET)
	public String adminUser(Model model, HttpSession session, 
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
		return"admin/adminUserInfo";
	}
	
	@RequestMapping(value="/adminUserInfo", method= RequestMethod.POST)
	public String adminUser(MemberVO vo) {
		memberService.updateUserInfo(vo);
		
		return"redirect:/message/userEditOkay?mid="+vo.getMid();
	}
	
	@RequestMapping(value="/adminUserDelete", method= RequestMethod.GET)
	public String adminUserDelete(int idx) {
		/* memberService.deactiveUser(idx); */
		
		return "redirect:/message/userDeleteOkay";
	}
	
	@RequestMapping(value="/adminMessage", method= RequestMethod.POST)
	public String adminMessage(MessageVO vo, HttpServletRequest request) {
		
		String flag = "";
		if(vo.getFromMid().contains("/")) {
			flag="user";
			vo.setFromMid("admin");
		}
		
		if(vo.getToMid().equals("all")) {
			List<MemberVO> memvos = memberService.getMemberList();
			for(MemberVO mvo : memvos) {
				vo.setToMid(mvo.getMid());
				if(!vo.getToMid().equals("admin")) memberService.sendMessage(vo);
			}
			
		}
		else memberService.sendMessage(vo);

		
		if(flag.equals("user")) {
			return "redirect:/message/sendOk?mid="+vo.getToMid();			
		} else return "redirect:/message/sendOkFrom";
	}
	
	
	@RequestMapping(value="/adminBookclub", method= RequestMethod.GET)
	public String adminBookclub(Model model	) {

		List<BookclubVO> bvos = bookclubService.getBookclubList();
		
		model.addAttribute("bvos", JSONArray.fromObject(bvos));

		return "admin/adminBookclub";
	}
	
	
	@RequestMapping(value="/adminChallenge", method= RequestMethod.GET)
	public String adminChallenge(Model model) {

		return "redirect:/challenge/challengeMain";
	}
	
	@RequestMapping(value="/adminMeetup", method= RequestMethod.GET)
	public String adminMeetup(Model model) {

		List<MeetupVO> mvos = meetupService.getMeetupListAll();
		
		for(MeetupVO mvo :mvos) {
			 int lastCommaIndex = mvo.getAddr().lastIndexOf(",");
			 String addressBeforeLastComma = mvo.getAddr().substring(0, lastCommaIndex);
			 int secondLastCommaIndex = addressBeforeLastComma.lastIndexOf(",");
			 mvo.setAddr(mvo.getAddr().substring(secondLastCommaIndex + 2)); 
			
		}
		model.addAttribute("mvos", mvos);

		return "admin/adminMeetup";
	}
	
	@RequestMapping(value="/adminReport", method= RequestMethod.GET)
	public String adminReport(Model model) {
		
		List<BookclubReportVO> rvos = bookclubService.getReportALL();
		model.addAttribute("rvos", rvos);
		return "admin/adminReport";
	}
	@ResponseBody
	@RequestMapping(value="/adminReportedPost", method= RequestMethod.POST)
	public String adminReportedPost(String sort, int sortIdx, int idx) {
		
		String post ="";
		
		if(sort.equals("bookclubQ")) {
			BookclubQVO vo = bookclubService.getBookclubQListbyidx(sortIdx);
			if(vo==null) {
				bookclubService.updateReportedPost(idx);
				return "delete";
			}
			post = vo.getContent();
		}
		else if(sort.equals("bookclubA")) {
			BookclubAVO vo = bookclubService.getBookclubAnswer(sortIdx);
			if(vo==null) {
				bookclubService.updateReportedPost(idx);
				return "delete";
			}
			post = vo.getContent();
		}

		return post;
	}
	
	@RequestMapping(value="/adminReport", method= RequestMethod.POST)
	public String adminReportPost(String sort, int sortIdx, int idx) {
		
		if(sort.equals("bookclubQ")) {
			BookclubQVO vo = bookclubService.getBookclubQListbyidx(sortIdx);
			if(vo==null) {
				bookclubService.updateReportedPost(idx);
				return "redirect:/message/alreadyDeleted";
			}
			bookclubService.bookclubQnADeletePost(sortIdx);
		}
		else if(sort.equals("bookclubA")) {
			BookclubAVO vo = bookclubService.getBookclubAnswer(sortIdx);
			if(vo==null) {
				bookclubService.updateReportedPost(idx);
				return "redirect:/message/alreadyDeleted";
			}
			bookclubService.bookclubADelete(sortIdx);
		}
		
		bookclubService.updateReportedPost(idx);
		
		return "redirect:/message/reportDeleteOk";
	}
	
	@RequestMapping(value="/adminMessage", method = RequestMethod.GET)
	public String adminMessage(Model model) {
		List<MessageVO> invos = memberService.getInMessage("admin");
		List<MessageVO> stvos = memberService.getStMessage("admin");
		
		List<MemberVO> memvos = memberService.getMemberList();
		
		model.addAttribute("invos", invos);
		model.addAttribute("stvos", stvos);
		model.addAttribute("memvos", memvos);
		return "admin/adminMessage";
	}
	
	

}
