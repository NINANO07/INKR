package com.spring.javaclassS10.service;

import java.util.HashMap;
import java.util.List;

import com.spring.javaclassS10.vo.BookclubALikeVO;
import com.spring.javaclassS10.vo.BookclubAVO;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.BookclubQVO;
import com.spring.javaclassS10.vo.BookclubReportVO;
import com.spring.javaclassS10.vo.BookclubVO;
import com.spring.javaclassS10.vo.BookclubVocaVO;

public interface BookclubService {

	int setBookclub(BookclubVO vo);

	HashMap<String, String> getEngInfo(String isbn);

	BookclubVO getIsbnInfo(String isbn);

	List<BookclubVO> getBookclubList();

	BookclubVO getBookclubListbyidx(int idx);

	List<BookclubQVO> getQnAList(int idx, String mid);

	void setBookclubAsk(BookclubQVO vo);

	BookclubQVO getBookclubQListbyidx(int idx);

	void setBookclubAnswer(BookclubAVO vo);

	List<BookclubAVO> getBookclubAListbyidx(int qidx, String mid);

	void setBookclubMember(int idx, String mid);

	List<BookclubVO> getBookclubJoin(String mid, String member);

	void updateBookclubQ(BookclubQVO vo);

	void bookclubQnADeletePost(int idx);

	int getBookclubAHitLike(int aidx, String mid);

	void bookclubAHitLikePost(BookclubALikeVO vo);

	void bookclubANoLike(int aidx, String mid);

	void bookclubADelete(int idx);

	int getVocaList(int clubIdx, String word, String language);

	void setBookclubVoca(BookclubVocaVO vo);

	List<BookclubVocaVO> getAllVocaList(int clubIdx, String language);

	int getVocaMarked(int idx, String mid);

	void setVocaBookMark(int vocaIdx, String mid, int clubMidx);

	void deleteVocaBookMark(int vocaIdx, String mid);

	void vocaDelete(int idx);

	void bookclubMarked(String mid, int idx, int clubMidx);

	int getBookclubMarked(int clubIdx, String mid);

	void bookclubMarkedNo(String mid, int clubIdx);

	List<BookclubVO> getBookclubSearch(String select, String searchStr, String mid);

	List<BookclubMemberVO> bookclubGetMember(int idx);

	BookclubAVO getBookclubAFeatured(int qidx);

	void setBookclubAFeatured(int idx, int eIdx);

	void bookclubUn(int idx, String mid);

	List<BookclubVocaVO> getSearchVocaList(int idx, String lang, String searchInput);

	List<BookclubQVO> getQnASearch(int idx, String mid, String lang, String searchStr);

	void clubHostChange(String mid, int idx);

	void clubMemberBan(String mid, int idx);

	void bookclubReport(BookclubReportVO vo);

	void bookclubDelete(int idx);

	int getClubMidx(String mid, int clubIdx);

	void clubpointUpdate(int clubMidx, int amount);

	int getClubPoint(String mid);

	BookclubAVO getBookclubAnswer(int idx);

	List<BookclubMemberVO> bookclubBanMember(int idx);

	void clubMemberUnBan(String mid, int idx);

	BookclubMemberVO getBestMember(int idx);

	BookclubMemberVO getMemberDetail(String mid);

	List<BookclubReportVO> getReportALL();

	void updateReportedPost(int idx);

	BookclubMemberVO isBookClubMember(int idx, String mid);







}
