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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.service.ChallengeService;
import com.spring.javaclassS10.service.MemberService;
import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.ChallengeListVO;
import com.spring.javaclassS10.vo.ChallengeVO;

@Controller
@RequestMapping("/challenge")
public class ChallengeController {
	
	@Autowired
	ChallengeService challengeService;
	
	@Autowired
	JavaclassProvide javaclassProvide;
	
	@Autowired 
	MemberService memberService;

	@RequestMapping(value="/challengeMain", method = RequestMethod.GET )
	public String challengeMain(Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		List<ChallengeListVO> vos = challengeService.getChallengeList();
		List<ChallengeVO> cvos = challengeService.getChallenge(mid);
		for(ChallengeVO cvo :cvos) {
			if(cvo.getPhoto().substring(cvo.getPhoto().lastIndexOf(".")+1).toLowerCase().equals("mp4")) {
				cvo.setExt("video");
			}else cvo.setExt("image");
		}
		
		model.addAttribute("vos", vos);
		model.addAttribute("cvos", cvos);
		return "challenge/challengeMain";
	}
	
	@RequestMapping(value="/challengeMain", method = RequestMethod.POST)
	public String challengeMainPost(ChallengeVO vo, MultipartFile file, Model model, HttpSession session) {
		String mid = (String) session.getAttribute("sMid");
		List<ChallengeVO> cvos =new ArrayList<ChallengeVO>();
		List<ChallengeListVO> vos = challengeService.getChallengeList();
		if(file != null) {
			vo.setPhoto(challengeService.fileUpload(vo.getMid(), file));
			challengeService.setChallenge(vo);
			memberService.pointUpdate(vo.getMid(), 50, "plus");
			
			return "redirect:/challenge/challengeMain";
		}
		else {
			String[] tagArray = (vo.getTags() != null && !vo.getTags().trim().isEmpty()) ? vo.getTags().split(",") : new String[0];
			cvos = challengeService.getChallengeSearch(vo.getSort(), tagArray, vo.getSearchStr(), mid);
			for(ChallengeVO cvo :cvos) {
				if(cvo.getPhoto().substring(cvo.getPhoto().lastIndexOf(".")+1).toLowerCase().equals("mp4")) {
					cvo.setExt("video");
				}else cvo.setExt("image");
			}
			model.addAttribute("vos", vos);
			model.addAttribute("cvos", cvos);
			return "challenge/challengeMain";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/challegeHitLike", method= RequestMethod.POST)
	public String challegeHitLike(ChallengeLikeVO vo) {
		challengeService.challegeHitLike(vo);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/challegeNoLike", method= RequestMethod.POST)
	public String challegeNoLike(ChallengeLikeVO vo) {
		challengeService.challegeNoLike(vo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/postDelete", method= RequestMethod.POST)
	public String deletePost(int idx, String photo, String mid) {
		challengeService.deletePost(idx, photo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/ranking", method= RequestMethod.POST)
	public List<ChallengeListVO> ranking() {
		List<ChallengeListVO> vos = challengeService.getChallengeList();
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value="/challengeAdd", method= RequestMethod.POST)
	public String challengeAdd(String title) {
		challengeService.setChallengeList(title, "admin");
		return "";
	}
	
	@RequestMapping(value="/challengeBy/{flag}/{txt}", method= RequestMethod.GET)
	public String challengeBy(@PathVariable("flag") String flag, @PathVariable("txt") String txt, Model model, HttpSession session){
		String mid = (String) session.getAttribute("sMid");
		List<ChallengeListVO> vos = challengeService.getChallengeList();
		List<ChallengeVO> cvos = challengeService.challengeBy(flag, txt, mid);
		for(ChallengeVO cvo :cvos) {
			if(cvo.getPhoto().substring(cvo.getPhoto().lastIndexOf(".")+1).toLowerCase().equals("mp4")) {
				cvo.setExt("video");
			}else cvo.setExt("image");
		}
		model.addAttribute("vos", vos);
		model.addAttribute("cvos", cvos);
		return "challenge/challengeMain";
	}
	
	@RequestMapping(value="/challengeLike/{idx}", method= RequestMethod.GET)
	public String challengeBy(@PathVariable("idx") int idx, Model model, HttpSession session){
		List<ChallengeListVO> vos = challengeService.getChallengeList();
		List<ChallengeVO> cvos = challengeService.challengeGetLike(idx);
		for(ChallengeVO cvo :cvos) {
			if(cvo.getPhoto().substring(cvo.getPhoto().lastIndexOf(".")+1).toLowerCase().equals("mp4")) {
				cvo.setExt("video");
			}else cvo.setExt("image");
		}
		model.addAttribute("vos", vos);
		model.addAttribute("cvos", cvos);
		return "challenge/challengeMain";
	}
	
	
}
