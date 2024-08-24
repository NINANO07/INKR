package com.spring.javaclassS10.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.service.BookclubService;
import com.spring.javaclassS10.service.MemberService;
import com.spring.javaclassS10.vo.BookclubALikeVO;
import com.spring.javaclassS10.vo.BookclubAVO;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.BookclubQVO;
import com.spring.javaclassS10.vo.BookclubReportVO;
import com.spring.javaclassS10.vo.BookclubVO;
import com.spring.javaclassS10.vo.BookclubVocaVO;

@Controller
@RequestMapping("/bookclub")
public class BookclubController {
	
	@Autowired
	BookclubService bookclubService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	JavaclassProvide javaclassProvide;
	
	@RequestMapping(value = "/bookclubList", method = RequestMethod.GET)
	public String booclubListGet(Model model, HttpSession session,
			@RequestParam(name="sort", defaultValue="", required = false) String sort) {
		String mid = (String)session.getAttribute("sMid");
		List<BookclubVO> vos = new ArrayList<BookclubVO>();
		List<BookclubVO> myVos = new ArrayList<BookclubVO>();
		if(sort.equals("my")) myVos = bookclubService.getBookclubJoin(mid, "my");
		else if(sort.equals("marked")) myVos = bookclubService.getBookclubJoin(mid, "marked");
		else myVos = bookclubService.getBookclubJoin(mid, "yes");
		for(BookclubVO myVo : myVos) {
			int cnt = bookclubService.getBookclubMarked(myVo.getIdx(), mid);
			if(cnt == 0) myVo.setMarked(false);
			else myVo.setMarked(true);
		}
		
		
		vos = bookclubService.getBookclubJoin(mid, "no");
		model.addAttribute("vos", vos);
		model.addAttribute("myVos", myVos);
		
		return "bookclub/bookclubList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubCreate", method = RequestMethod.POST)
	public BookclubVO bookclubCreatePost(BookclubVO vo, HttpSession session) {
		vo.setHost((String)session.getAttribute("sMid"));
		
		BookclubVO isbnVO = bookclubService.getIsbnInfo(vo.getIsbn());
		if(isbnVO != null) {
			isbnVO.setIsbn("exist");
			return isbnVO;
		}
		
		HashMap<String, String> map = bookclubService.getEngInfo(vo.getIsbn());
		vo.setAuthor(vo.getAuthor().trim());
		vo.setTitle(vo.getTitle().trim());
		
		if(vo.getTitle().contains(":")) {
			vo.setTitle(vo.getTitle().substring(0, vo.getTitle().lastIndexOf(":")));
		}
		
		if(vo.getAuthor().contains(":")) {
			vo.setAuthor(vo.getAuthor().replace("글:", ""));
			vo.setAuthor(vo.getAuthor().replace("지은이:", ""));
			vo.setAuthor(vo.getAuthor().replace("작가:", ""));		
			vo.setAuthor(vo.getAuthor().replace("저자:", ""));		
		}
		
		if(map != null) {
			if(vo.getCover().substring(vo.getCover().lastIndexOf("/")+1, vo.getCover().lastIndexOf(".")).equals("noimage")){
				vo.setCover(map.get("cover"));
			}
			vo.setEngTitle(map.get("engTitle"));
			vo.setEngAuthor(map.get("engAuthor"));
		}
		
		int res = bookclubService.setBookclub(vo);
		
		if(res !=0) {
			vo = bookclubService.getIsbnInfo(vo.getIsbn());
			bookclubService.setBookclubMember(vo.getIdx(), vo.getHost());
		}
			
		
		return vo;
	}
	
	@RequestMapping(value="bookclubJoin/{idx}", method = RequestMethod.GET)
	public String bookclubJoinGet(@PathVariable("idx") int idx, HttpSession session) {
		String mid = (String)session.getAttribute("sMid");
		bookclubService.setBookclubMember(idx,mid);
		return "redirect:/bookclub/bookclubQnA/"+idx;
	}
	
	/*
	 * @RequestMapping(value = "/bookclubA/{board}/{idx}", method =
	 * RequestMethod.GET) public String bookclubAGet(Model model, HttpSession
	 * session,
	 * 
	 * @PathVariable("idx") int idx,
	 * 
	 * @PathVariable("board") String board) {
	 * 
	 * String mid = session.getAttribute("sMid").toString(); BookclubVO vo =
	 * bookclubService.getBookclubListbyidx(idx); model.addAttribute("vo", vo);
	 * if(board.equals("game")) { //vos = bookclubService.getGameList(idx);
	 * 
	 * return "bookclub/bookclubGame"; } else if(board.equals("voca")) {
	 * List<BookclubVocaVO> vos = bookclubService.getAllVocaList(idx, "1");
	 * for(BookclubVocaVO mvo : vos) { int cnt =
	 * bookclubService.getVocaMarked(mvo.getIdx(), mid); if(cnt == 0)
	 * mvo.setMarked(false); else mvo.setMarked(true); } model.addAttribute("vos",
	 * vos); return "bookclub/bookclubVoca"; } else { List<BookclubQVO> vos =
	 * bookclubService.getQnAList(idx, mid);
	 * 
	 * model.addAttribute("vos", vos); return "bookclub/bookclubQnA"; } }
	 */
	
	@RequestMapping(value = "/bookclubQnA/{idx}", method = RequestMethod.GET)
	public String bookclubQnA(Model model, HttpSession session,
			@PathVariable("idx") int idx ) {
		
		String mid = session.getAttribute("sMid").toString();
		BookclubVO vo = bookclubService.getBookclubListbyidx(idx);
		model.addAttribute("vo", vo);
	
		BookclubMemberVO bvo = bookclubService.getBestMember(idx);
		model.addAttribute("bvo", bvo);
		List<BookclubQVO> vos = bookclubService.getQnAList(idx, mid);
		
		model.addAttribute("vos", vos);
		return "bookclub/bookclubQnA";
	}
	
	@RequestMapping(value = "/bookclubQnA/{idx}", method = RequestMethod.POST)
	public String bookclubQnAPost(Model model, HttpSession session,
			@PathVariable("idx") int idx, String langV, String searchStr) {
		
		String mid = session.getAttribute("sMid").toString();
		BookclubVO vo = bookclubService.getBookclubListbyidx(idx);
		model.addAttribute("vo", vo);
		
		BookclubMemberVO bvo = bookclubService.getBestMember(idx);
		model.addAttribute("bvo", bvo);
		List<BookclubQVO> vos = bookclubService.getQnASearch(idx, mid, langV, searchStr);
		model.addAttribute("langV", langV);
		model.addAttribute("vos", vos);
		return "bookclub/bookclubQnA";
	}
		
	@RequestMapping(value = "/bookclubVocaByLang", method = RequestMethod.GET)
	public String bookclubVocaByLang(Model model, HttpSession session, int idx, String langV) {
		BookclubVO vo = bookclubService.getBookclubListbyidx(idx);
		String mid = session.getAttribute("sMid").toString();
		BookclubMemberVO bvo = bookclubService.getBestMember(idx);
		model.addAttribute("bvo", bvo);
		List<BookclubVocaVO> vos = bookclubService.getAllVocaList(idx, langV);
		for(BookclubVocaVO mvo : vos) {
			int cnt = bookclubService.getVocaMarked(mvo.getIdx(), mid);
			if(cnt == 0) mvo.setMarked(false);
			else mvo.setMarked(true);
		}
		model.addAttribute("vos", vos);
		model.addAttribute("vo", vo);
		model.addAttribute("langV", langV);
		return "bookclub/bookclubVoca";
	}
	
	@RequestMapping(value = "/bookclubVocaByLang", method = RequestMethod.POST)
	public String bookclubVocaByLangPost(Model model, HttpSession session, int idx, String langV, String searchInput) {
		BookclubVO vo = bookclubService.getBookclubListbyidx(idx);
		String mid = session.getAttribute("sMid").toString();
		List<BookclubVocaVO> vos = bookclubService.getSearchVocaList(idx, langV, searchInput);
		for(BookclubVocaVO mvo : vos) {
			int cnt = bookclubService.getVocaMarked(mvo.getIdx(), mid);
			if(cnt == 0) mvo.setMarked(false);
			else mvo.setMarked(true);
		}
		model.addAttribute("vos", vos);
		model.addAttribute("vo", vo);
		model.addAttribute("langV", langV);
		return "bookclub/bookclubVoca";
	}
	
	@RequestMapping(value = "/bookclubQnA", method = RequestMethod.POST)
	public String bookclubQnAPOST(BookclubQVO vo, MultipartFile file) {
		String top = vo.getTop() == null ? "off" : vo.getTop();
		vo.setTop(top);
		
		int usePoint = 50;
		
		if(vo.getTop().equals("on")) {
			usePoint += 100;
		}
		
		memberService.pointUpdate(vo.getMid(), usePoint, "use");
		
		int clubMidx = bookclubService.getClubMidx(vo.getMid(), vo.getClubIdx());
		vo.setClubMidx(clubMidx);

		if(!file.getOriginalFilename().equals("")) vo.setImgFile(javaclassProvide.fileUpload(file, vo.getMid(), "", "bookclub/qna"));
		
		bookclubService.setBookclubAsk(vo);
		
		
		return "redirect:/bookclub/bookclubQnA/"+vo.getClubIdx();
	}
	
	@RequestMapping(value = "/bookclubAnswer/{clubIdx}/{idx}", method = RequestMethod.GET)
	public String bookclubAnswerGet(Model model,
			@PathVariable("clubIdx") int clubIdx,
			@PathVariable("idx") int idx,
			HttpSession session
	) {
		String mid = session.getAttribute("sMid").toString();
		BookclubVO vo = bookclubService.getBookclubListbyidx(clubIdx);
		model.addAttribute("vo", vo);
		BookclubQVO qvo = bookclubService.getBookclubQListbyidx(idx);
		model.addAttribute("qvo", qvo);
		List<BookclubAVO> ansvos = bookclubService.getBookclubAListbyidx(idx, mid);
		for(BookclubAVO ansvo : ansvos) {
			int cnt = bookclubService.getBookclubAHitLike(ansvo.getIdx(), mid);
			if(cnt == 0) ansvo.setHit(false);
			else ansvo.setHit(true);
		}
		model.addAttribute("ansvos", ansvos);
		BookclubMemberVO bvo = bookclubService.getBestMember(clubIdx);
		model.addAttribute("bvo", bvo);
		return "bookclub/bookclubAnswer";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubAnswer", method = RequestMethod.POST)
	public String bookclubAnswerPost(BookclubAVO vo, MultipartFile file) {
		vo.setToMid(vo.getToMid().replace("@",""));
		
		int clubMidx = bookclubService.getClubMidx(vo.getMid(), vo.getClubIdx());
		int clubToidx = bookclubService.getClubMidx(vo.getToMid(), vo.getClubIdx());
		
		vo.setClubMidx(clubMidx);
		vo.setClubToidx(clubToidx);
		
		if(!vo.getMid().equals(vo.getQmid())) {
			memberService.pointUpdate(vo.getMid(), 10, "plus");
			bookclubService.clubpointUpdate(vo.getClubMidx(), 10);
			int clubPoint = bookclubService.getClubPoint(vo.getMid());
			javaclassProvide.update(vo.getMid(), clubPoint, "bookclub");
		}
		
		if(!file.getOriginalFilename().equals("")) vo.setImgFile(javaclassProvide.fileUpload(file, vo.getMid(), "", "bookclub/qna"));
		bookclubService.setBookclubAnswer(vo);

		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubQnAEdit", method = RequestMethod.POST)
	public String bookclubQnAEditPost(BookclubQVO vo, MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) vo.setImgFile(javaclassProvide.fileUpload(file, vo.getMid(), vo.getImgFile(), "bookclub/qna"));	
		bookclubService.updateBookclubQ(vo);	
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubQnADelete", method = RequestMethod.POST)
	public String bookclubQnADeletePost(int idx) {
		bookclubService.bookclubQnADeletePost(idx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubAHitLike", method = RequestMethod.POST)
	public String bookclubAHitLikePost(BookclubALikeVO vo) {
		int clubMidx = bookclubService.getClubMidx(vo.getMid(), vo.getClubIdx());
		int clubToidx = bookclubService.getClubMidx(vo.getToMid(), vo.getClubIdx());
		
		vo.setClubMidx(clubMidx);
		vo.setClubToidx(clubToidx);
		
		bookclubService.bookclubAHitLikePost(vo);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubANoLike", method = RequestMethod.POST)
	public String bookclubANoLikePost(int aidx, String mid, String toMid) {
		bookclubService.bookclubANoLike(aidx, mid);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubADelete", method = RequestMethod.POST)
	public String bookclubADeletePost(int idx) {
		bookclubService.bookclubADelete(idx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubVocaCreate", method = RequestMethod.POST)
	public String bookclubVocaCreatePost(BookclubVocaVO vo) {
		
		if(vo.getTransWord().contains(";")) {
			String[] tw = vo.getTransWord().split(";");
			vo.setTransWord(tw[0]);
		} else if(vo.getTransWord().contains("。")) {
			String[] tw = vo.getTransWord().split("。");
			vo.setTransWord(tw[0]);
		} else if(vo.getTransWord().contains(",")) {
			String[] tw = vo.getTransWord().split(",");
			vo.setTransWord(tw[0]);
		} else if(vo.getTransWord().contains("，")) {
			String[] tw = vo.getTransWord().split("，");
			vo.setTransWord(tw[0]);
		}
		
		
		int res = bookclubService.getVocaList(vo.getClubIdx(), vo.getWord(), vo.getLanguage());
		if(res == 0) {
			int clubMidx = bookclubService.getClubMidx(vo.getMid(), vo.getClubIdx());			
			vo.setClubMidx(clubMidx);
			memberService.pointUpdate(vo.getMid(), 1, "plus");
			bookclubService.clubpointUpdate(vo.getClubMidx(), 1);
			int clubPoint = bookclubService.getClubPoint(vo.getMid());
			javaclassProvide.update(vo.getMid(), clubPoint, "bookclub");
			bookclubService.setBookclubVoca(vo);
		
			return res+"";
		}
		else return res+"";
	}
	
	@ResponseBody
	@RequestMapping(value = "/vocaBookMark", method = RequestMethod.POST)
	public String vocaBookMark(int vocaIdx, int clubIdx, String mid) {
		
		int clubMidx = bookclubService.getClubMidx(mid, clubIdx);
		bookclubService.setVocaBookMark(vocaIdx, mid, clubMidx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/vocaBookMarkNo", method = RequestMethod.POST)
	public String vocaBookMarkNo(int vocaIdx, String mid) {
		bookclubService.deleteVocaBookMark(vocaIdx, mid);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/vocaDelete", method = RequestMethod.POST)
	public String vocaDelete(int idx) {
		bookclubService.vocaDelete(idx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubMarked", method = RequestMethod.POST)
	public String bookclubMarked(String mid, int idx) {
		int clubMidx = bookclubService.getClubMidx(mid, idx);
		bookclubService.bookclubMarked(mid, idx, clubMidx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubMarkedNo", method = RequestMethod.POST)
	public String bookclubMarkedNo(String mid, int idx) {
		bookclubService.bookclubMarkedNo(mid, idx);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubSearch", method = RequestMethod.POST)
	public List<BookclubVO> bookclubSearch(String select, String searchStr, String mid) {
		List<BookclubVO> vos = new ArrayList<BookclubVO>();
		vos = bookclubService.getBookclubSearch(select, searchStr, mid);
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubSort", method = RequestMethod.POST)
	public List<BookclubVO> bookclubSort(String mid, String sort) {
		List<BookclubVO> vos = new ArrayList<BookclubVO>();
		if(sort.equals("all")) vos = bookclubService.getBookclubJoin(mid, "no");			
		else if(sort.equals("sce")) vos = bookclubService.getBookclubJoin(mid, "sce");
		else if(sort.equals("dsce")) vos = bookclubService.getBookclubJoin(mid, "dsce");
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubGetMember", method = RequestMethod.POST)
	public List<BookclubMemberVO> bookclubGetMember(int idx) {
		List<BookclubMemberVO> vos = bookclubService.bookclubGetMember(idx);
		
		return vos;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubBanMember", method = RequestMethod.POST)
	public List<BookclubMemberVO> bookclubBanMember(int idx) {
		List<BookclubMemberVO> vos = bookclubService.bookclubBanMember(idx);	
		return vos;
	}
		
	@ResponseBody
	@RequestMapping(value = "/bookclubAFeatured", method = RequestMethod.POST)
	public String bookclubAFeatured(int qidx, int idx) {
		BookclubAVO vo = bookclubService.getBookclubAFeatured(qidx) ;
		int eIdx = 0;
		if(vo != null) {
			eIdx = vo.getIdx();
		}
		else {
			BookclubAVO vo1 = bookclubService.getBookclubAnswer(idx);
			memberService.pointUpdate(vo1.getMid(), 50, "plus");
			bookclubService.clubpointUpdate(vo1.getClubMidx(), 50);
			int clubPoint = bookclubService.getClubPoint(vo1.getMid());
			javaclassProvide.update(vo1.getMid(), clubPoint, "bookclub");
		}
		bookclubService.setBookclubAFeatured(idx,eIdx);
		return "";
	}
	
	@RequestMapping(value = "/bookclubUn", method = RequestMethod.GET)
	public String bookclubUn(int idx, HttpSession session) {
		String mid = session.getAttribute("sMid").toString();
		bookclubService.bookclubUn(idx, mid);
		return "redirect:/message/bookclubUnOk";
	}
	
	@ResponseBody
	@RequestMapping(value = "/clubHostChange", method = RequestMethod.POST)
	public String clubHostChange(String mid, int idx) {
		
		bookclubService.clubHostChange(mid, idx);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/clubMemberBan", method = RequestMethod.POST)
	public String clubMemberBan(String mid, int idx) {
		
		bookclubService.clubMemberBan(mid, idx);
		return "";
	}
	@ResponseBody
	@RequestMapping(value = "/clubMemberUnBan", method = RequestMethod.POST)
	public String clubMemberUnBan(String mid, int idx) {
		
		bookclubService.clubMemberUnBan(mid, idx);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/bookclubReport", method = RequestMethod.POST)
	public String bookclubReport(BookclubReportVO vo) {
		
		bookclubService.bookclubReport(vo);
		
		return "";
	}
	
	@RequestMapping(value = "/bookclubDelete", method = RequestMethod.GET)
	public String bookclubDelete(int idx, HttpSession session) {

		String mid = session.getAttribute("sMid").toString();
		BookclubVO vo = bookclubService.getBookclubListbyidx(idx);
		if(!vo.getHost().equals(mid) || vo.getParticipant() > 1) {
			return "redirect:/message/bookclubDeleteNo/?idx="+idx;
		}
		else {
			bookclubService.bookclubDelete(idx);
			return "redirect:/message/bookclubDeleteOk";
		}
	}
	
	
}
