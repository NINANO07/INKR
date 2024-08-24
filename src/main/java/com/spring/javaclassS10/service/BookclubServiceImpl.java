package com.spring.javaclassS10.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS10.dao.BookclubDAO;
import com.spring.javaclassS10.vo.BookclubALikeVO;
import com.spring.javaclassS10.vo.BookclubAVO;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.BookclubQVO;
import com.spring.javaclassS10.vo.BookclubReportVO;
import com.spring.javaclassS10.vo.BookclubVO;
import com.spring.javaclassS10.vo.BookclubVocaVO;

@Service
public class BookclubServiceImpl implements BookclubService {

	@Autowired
	BookclubDAO bookclubDAO;


	@Override
	public int setBookclub(BookclubVO vo) {
		return bookclubDAO.setBookclub(vo);
	}

	@Override
	public HashMap<String, String> getEngInfo(String isbn) {
		HashMap<String, String> map = null;
		try {
			Connection conn = Jsoup.connect("https://www.bookfinder.com/isbn/"+isbn);
			Document document = conn.get();
			if(document.selectXpath("//*[@id=\"book-info\"]/h1/a").size() > 0) {

				map = new HashMap<String, String>();
				String engTitle = document.selectXpath("//*[@id=\"book-info\"]/h1/a").text();
				String cover = document.select("#header-img > img").attr("src");
				
				if(engTitle.contains("(")) {
					engTitle = engTitle.substring(0, engTitle.indexOf("("));
				}
				
				if(engTitle.contains(" by ")) {
					engTitle = engTitle.substring(0, engTitle.indexOf(" by "));
				}
				
				engTitle = engTitle.replaceAll("[^a-zA-Z0-9 ]", "");
				engTitle = engTitle.replaceAll("(?i)Korean Book", "");
				
				String engAuthor = document.selectXpath("//*[@id=\"book-info\"]/div[1]/p/strong/a").text();
				
				if(engAuthor.contains("(")) {
					engAuthor = engAuthor.substring(0, engAuthor.indexOf("("));
				}
				
				engAuthor = engAuthor.replaceAll("[^a-zA-Z0-9 ]", "");
				
				map.put("cover", cover);
				map.put("engTitle", engTitle);
				map.put("engAuthor", engAuthor);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}

	@Override
	public BookclubVO getIsbnInfo(String isbn) {
		return bookclubDAO.getIsbnInfo(isbn);
	}

	@Override
	public List<BookclubVO> getBookclubList() {
		return bookclubDAO.getBookclubList();
	}

	@Transactional
	@Override
	public BookclubVO getBookclubListbyidx(int idx) {
		bookclubDAO.updateTop(idx);
		return bookclubDAO.getBookclubListbyidx(idx);
	}

	@Override
	public List<BookclubQVO> getQnAList(int idx, String mid) {
		return bookclubDAO.getQnAList(idx, mid);
	}

	@Override
	public void setBookclubAsk(BookclubQVO vo) {
		bookclubDAO.setBookclubAsk(vo);
		
	}

	@Override
	public BookclubQVO getBookclubQListbyidx(int idx) {
		
		return bookclubDAO.getBookclubQListbyidx(idx);
	}

	@Override
	public void setBookclubAnswer(BookclubAVO vo) {
		bookclubDAO.setBookclubAnswer(vo);
		
	}

	@Override
	public List<BookclubAVO> getBookclubAListbyidx(int qidx,String mid) {
		// TODO Auto-generated method stub
		return bookclubDAO.getBookclubAListbyidx(qidx, mid);
	}

	@Transactional
	@Override
	public void setBookclubMember(int idx, String mid) {
		bookclubDAO.setBookclubMember(idx, mid);
		bookclubDAO.setBookclubNumber(idx);
	}

	@Override
	public List<BookclubVO> getBookclubJoin(String mid, String member) {
		return bookclubDAO.getBookclubJoin(mid,member);
	}

	@Override
	public void updateBookclubQ(BookclubQVO vo) {
		bookclubDAO.updateBookclubQ(vo);
	
	}

	@Transactional
	@Override
	public void bookclubQnADeletePost(int idx) {
		bookclubDAO.bookclubLinkedAnswer(idx);
		bookclubDAO.bookclubQnADeletePost(idx);	
	}

	@Override
	public int getBookclubAHitLike(int aidx, String mid) {
		// TODO Auto-generated method stub
		return bookclubDAO.getBookclubAHitLike(aidx, mid);
	}

	@Override
	public void bookclubAHitLikePost(BookclubALikeVO vo) {
		bookclubDAO.bookclubAHitLikePost(vo);	
	}

	@Override
	public void bookclubANoLike(int aidx, String mid) {
		bookclubDAO.bookclubANoLike(aidx, mid);
	}

	@Override
	public void bookclubADelete(int idx) {
		bookclubDAO.bookclubAHitDelete(idx);
		bookclubDAO.bookclubADelete(idx);
	}

	@Override
	public int getVocaList(int clubIdx, String word, String language) {
		return bookclubDAO.getVocaList(clubIdx, word, language);
	}

	@Override
	public void setBookclubVoca(BookclubVocaVO vo) {
		bookclubDAO.setBookclubVoca(vo);
	}

	@Override
	public List<BookclubVocaVO> getAllVocaList(int clubIdx, String language) {
		return bookclubDAO.getAllVocaList(clubIdx,language );
	}

	@Override
	public int getVocaMarked(int idx, String mid) {
		return bookclubDAO.getVocaMarked(idx,mid);
	}

	@Override
	public void setVocaBookMark(int vocaIdx, String mid, int clubMidx) {
		bookclubDAO.setVocaBookMark(vocaIdx,mid,clubMidx);
		
	}

	@Override
	public void deleteVocaBookMark(int vocaIdx, String mid) {
		bookclubDAO.deleteVocaBookMark(vocaIdx,mid);
	}

	@Override
	public void vocaDelete(int idx) {
		bookclubDAO.linkedBookMark(idx);
		bookclubDAO.vocaDelete(idx);
		
	}

	@Override
	public void bookclubMarked(String mid, int idx, int clubMidx) {
		bookclubDAO.bookclubMarked(mid, idx, clubMidx);
		
	}

	@Override
	public int getBookclubMarked(int clubIdx, String mid) {
		
		return bookclubDAO.getBookclubMarked(clubIdx, mid);
	}

	@Override
	public void bookclubMarkedNo(String mid, int clubIdx) {
		bookclubDAO.bookclubMarkedNo(mid, clubIdx);
		
	}

	@Override
	public List<BookclubVO> getBookclubSearch(String select, String searchStr, String mid) {
		return bookclubDAO.getBookclubSearch(select, searchStr, mid);
	}

	@Override
	public List<BookclubMemberVO> bookclubGetMember(int idx) {
		return bookclubDAO.bookclubGetMember(idx);
	}

	@Override
	public BookclubAVO getBookclubAFeatured(int qidx) {
		return bookclubDAO.getBookclubAFeatured(qidx);
	}

	@Transactional
	@Override
	public void setBookclubAFeatured(int idx, int eIdx) {
		bookclubDAO.setBookclubAFeatured(idx, eIdx);
		
	}

	@Transactional
	@Override
	public void bookclubUn(int idx, String mid) {		
		bookclubDAO.bookclubUn(idx, mid);
		bookclubDAO.clubMemberSub(idx);
	}

	@Override
	public List<BookclubVocaVO> getSearchVocaList(int idx, String lang, String searchInput) {
		// TODO Auto-generated method stub
		return bookclubDAO.getSearchVocaList(idx, lang, searchInput);
	}

	@Override
	public List<BookclubQVO> getQnASearch(int idx, String mid, String lang, String searchStr) {
		
		return bookclubDAO.getQnASearch(idx, mid, lang, searchStr);
	}

	@Override
	public void clubHostChange(String mid, int idx) {
		bookclubDAO.clubHostChange(mid, idx);
		
	}

	@Transactional
	@Override
	public void clubMemberBan(String mid, int idx) {
		bookclubDAO.clubMemberBan(mid, idx);
		bookclubDAO.clubMemberSub(idx);
	}

	@Override
	public void bookclubReport(BookclubReportVO vo) {
		bookclubDAO.bookclubReport(vo);
		
	}

	@Override
	public void bookclubDelete(int idx) {
		bookclubDAO.bookclubDelete(idx);
	}

	@Override
	public int getClubMidx(String mid, int clubIdx) {
		return bookclubDAO.getClubMidx(mid, clubIdx);
	}

	@Override
	public void clubpointUpdate(int clubMidx, int amount) {
		bookclubDAO.clubpointUpdate(clubMidx,amount);
	}

	@Override
	public int getClubPoint(String mid) {
		return bookclubDAO.getClubPoint(mid);
	}

	@Override
	public BookclubAVO getBookclubAnswer(int idx) {
		return bookclubDAO.getBookclubAnswer(idx);
	}

	@Override
	public List<BookclubMemberVO> bookclubBanMember(int idx) {
		return bookclubDAO.bookclubBanMember(idx);
	}

	@Override
	public void clubMemberUnBan(String mid, int idx) {
		bookclubDAO.clubMemberUnBan(mid, idx);
		bookclubDAO.setBookclubNumber(idx);
		
	}

	@Override
	public BookclubMemberVO getBestMember(int idx) {
		return bookclubDAO.getBestMember(idx);
	}

	@Override
	public BookclubMemberVO getMemberDetail(String mid) {
		return  bookclubDAO.getMemberDetail(mid);
	}

	@Override
	public List<BookclubReportVO> getReportALL() {
		return  bookclubDAO.getReportALL();
	}

	@Override
	public void updateReportedPost(int idx) {
		bookclubDAO.updateReportedPost(idx);
	}

	@Override
	public BookclubMemberVO isBookClubMember(int idx, String mid) {
		return bookclubDAO.isBookClubMember(idx, mid) ;
	}



	

	
	
}
