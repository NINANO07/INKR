package com.spring.javaclassS10.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;

import com.spring.javaclassS10.service.MeetupService;
import com.spring.javaclassS10.vo.EventListVO;
import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MeetupStatusVO;
import com.spring.javaclassS10.vo.MeetupVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/meetup")
public class MeetupController {
	
	@Autowired
	MeetupService meetupService;
	
	@Autowired
	LocaleResolver localeResolver;
	
	@RequestMapping(value="/meetupMain", method= RequestMethod.GET)
	public String meetupMain(Model model, HttpSession session) {
		String mid = session.getAttribute("sMid").toString();
		Locale currentLocale = LocaleContextHolder.getLocale();
		String language = currentLocale.getLanguage();
		if(language.equals("ko")) language = "Kor";
		else if(language.equals("de")) language = "Ger";
		else  language = "Eng";
		List<MeetupVO>vos = meetupService.getAllMeetup("all", "");
		List<EventListVO> evos = meetupService.getEventList("1", language, "", "");

		model.addAttribute("evos", evos);
		model.addAttribute("vos", vos);
		model.addAttribute("jsonVos", JSONArray.fromObject(vos));
		return "meetup/meetupMain";
	}
	
	@RequestMapping(value="/meetupInput", method= RequestMethod.GET)
	public String meetupInput(@RequestParam(name="pageNo", defaultValue ="1", required=false)String pageNo, Model model) {		
		Locale currentLocale = LocaleContextHolder.getLocale();
		String language = currentLocale.getLanguage();
		if(language.equals("ko")) language = "Kor";
		else if(language.equals("de")) language = "Ger";
		else  language = "Eng";
		
		List<EventListVO> eventVos = meetupService.getEventList(pageNo, language, "", "");

		model.addAttribute("eventVos", eventVos);
		return "meetup/meetupInput";
	}
	
	
	@RequestMapping(value="/meetupInput", method= RequestMethod.POST)
	public String meetupInputPost(@RequestParam(name="pageNo", defaultValue ="1", required=false)String pageNo,
			@RequestParam(name="date", defaultValue ="", required=false)String date,
			@RequestParam(name="searchStr", defaultValue ="", required=false)String searchStr,
			Model model) {
		Locale currentLocale = LocaleContextHolder.getLocale();
		String language = currentLocale.getLanguage();
		if(language.equals("ko")) language = "Kor";
		else if(language.equals("de")) language = "Ger";
		else  language = "Eng";
		
		List<EventListVO> eventVos = meetupService.getEventList(pageNo, language, date, searchStr);

		model.addAttribute("eventVos", eventVos);
		return "meetup/meetupInput";
	}
	
	@RequestMapping(value="/meetupCreateInput", method= RequestMethod.POST)
	public String meetupCreateInput(MeetupVO vo) {
		meetupService.meetupCreate(vo);

		return "redirect:/message/meetupCreateOk";		
	}
	
	@RequestMapping(value="/meetupCreate", method= RequestMethod.POST)
	public String meetupCreatePost(EventListVO vo, Model model, 
			@RequestParam(name="lang", defaultValue = "", required = false)String lang) {
		MeetupVO evo = meetupService.getMeetup(vo.getMapX(), vo.getMapY());

		if(evo == null) {
		SimpleDateFormat iF = new SimpleDateFormat("yyyy-MM-dd");
	    SimpleDateFormat oF = new SimpleDateFormat("MMM dd, yyyy", Locale.ENGLISH);
	    try {
			vo.setEventStartDate(iF.format(oF.parse(vo.getEventStartDate())));
			vo.setEventEndDate(iF.format(oF.parse(vo.getEventEndDate())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("vo", vo);
		return "meetup/meetupCreate";
		}
		else {
			return "redirect:/meetup/meetupTo?idx="+evo.getIdx();
		}
		
	}
	
	@RequestMapping(value="/meetupInfo", method= RequestMethod.GET)
	public String meetupInfo(int idx, Model model, HttpSession session) {	
		String mid= (String)session.getAttribute("sMid");
		String flag= "0";
		int res = meetupService.getWaitingList(idx, mid);
		int cancel = meetupService.getCanceledList(idx, mid);
		if(res != 0) {
			flag = "1";
		}else {
			if(cancel != 0) flag = "2";
		}
		MeetupVO vo = meetupService.getMeetupList(idx);
		model.addAttribute("vo", vo);
		model.addAttribute("flag", flag);
		return "meetup/meetupInfo";
	}
	
	@RequestMapping(value="/meetupInfo", method= RequestMethod.POST)
	public String meetupInfoPost(int idx, String mid, Model model) {
		MeetupVO vo = meetupService.getMeetupList(idx);
		
		if(vo.getCurNumber() <vo.getMemNumber()) {
			meetupService.setMeetupMember(idx, mid);			
			return "redirect:/meetup/meetupRoom/"+idx;
		} else {
			meetupService.setMeetupWaiting(idx, mid);
			return "redirect:/message/waitingOk?idx="+idx;
		}
		
	}
	
	@RequestMapping(value="/meetupAll", method= RequestMethod.GET)
	public String meetupAll(Model model, HttpSession session, 
			@RequestParam(name="sort", defaultValue ="", required=false) String sort
			) {	
		List<MeetupVO> vos = new ArrayList<MeetupVO>();
		String mid = session.getAttribute("sMid").toString();
		if(sort.equals("my")) vos = meetupService.getAllMeetup("yes", mid);
		else if(sort.equals("not"))  vos = meetupService.getAllMeetup("no", mid);
		else vos= meetupService.getAllMeetup("all", "");
		
		model.addAttribute("vos", vos);
		
		return "meetup/meetupAll";
	}
	
	@RequestMapping(value="/meetupTo", method= RequestMethod.GET)
	public String meetupTo(Model model, HttpSession session, int idx) {	
		String mid = session.getAttribute("sMid").toString();
		MeetupMemberVO vo = meetupService.getMeetupMember(idx, mid);
		
		if(vo == null) return "redirect:/meetup/meetupInfo?idx="+idx;
		
		else return "redirect:/meetup/meetupRoom/"+idx;
	}
	
	@RequestMapping(value="/meetupRoom/{idx}", method= RequestMethod.GET)
	public String meetupRoom(@PathVariable("idx") int idx,  Model model) {	
		List<MeetupMemberVO> vos = meetupService.getMeetupMemberAll(idx);
		MeetupVO vo = meetupService.getMeetupList(idx);
		List<MeetupStatusVO> svos = meetupService.getMeetupStatus(idx);
		model.addAttribute("vos", vos);
		model.addAttribute("svos", svos);
		model.addAttribute("vo", vo);
		return "meetup/meetupRoom";
	}
	
	@ResponseBody
	@RequestMapping(value="/setNotice", method= RequestMethod.POST)
	public String setNotice(int idx, String content) {	
		meetupService.updateStatus(idx, content, true);
		return "";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteNotice", method= RequestMethod.POST)
	public String deleteNotice(int idx) {	
		meetupService.deleteNotice(idx);
		return "";
	}
	
	@RequestMapping(value="/cancelMeetup", method= RequestMethod.POST)
	public String cancelMeetup(int meetupIdx, String mid) {	
		meetupService.cancelMeetup(meetupIdx, mid);
		return "redirect:/meetup/meetupMain";
	}
	
	@ResponseBody
	@RequestMapping(value="/meetupWaited", method= RequestMethod.POST)
	public List<MeetupMemberVO> meetupWaited(int idx) {	
		List<MeetupMemberVO> vos = meetupService.getWaitedList(idx);
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value="/meetupEdit", method= RequestMethod.POST)
	public String[] meetupEdit(MeetupVO vo) {	
		
		return meetupService.updateMeetUpEdit(vo);
	}
	
	@RequestMapping(value="/meetupDelete", method= RequestMethod.GET)
	public String meetupDelete(int idx, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		meetupService.deleteMeetUp(idx, mid);
		return "redirect:/message/meetUpdelete";
	}

}
