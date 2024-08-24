package com.spring.javaclassS10.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS10.vo.BookclubALikeVO;
import com.spring.javaclassS10.vo.BookclubAVO;
import com.spring.javaclassS10.vo.BookclubMemberVO;
import com.spring.javaclassS10.vo.BookclubQVO;
import com.spring.javaclassS10.vo.BookclubReportVO;
import com.spring.javaclassS10.vo.BookclubVO;
import com.spring.javaclassS10.vo.BookclubVocaVO;

public interface BookclubDAO {

	int setBookclub(@Param("vo") BookclubVO vo);

	BookclubVO getIsbnInfo(@Param("isbn")  String isbn);

	List<BookclubVO> getBookclubList();

	BookclubVO getBookclubListbyidx(@Param("idx") int idx);

	List<BookclubQVO> getQnAList(@Param("idx") int idx,@Param("mid") String mid);

	void setBookclubAsk(@Param("vo") BookclubQVO vo);

	BookclubQVO getBookclubQListbyidx(@Param("idx") int idx);

	void setBookclubAnswer(@Param("vo") BookclubAVO vo);

	List<BookclubAVO> getBookclubAListbyidx(@Param("qidx") int qidx,@Param("mid") String mid);

	void setBookclubMember(@Param("idx") int idx, @Param("mid") String mid);

	void setBookclubNumber(@Param("idx") int idx);

	List<BookclubVO> getBookclubJoin(@Param("mid") String mid, @Param("member") String member);

	void updateBookclubQ(@Param("vo") BookclubQVO vo);
	
	int bookclubLinkedAnswer(@Param("idx") int idx);
	
	void bookclubQnADeletePost(@Param("idx") int idx);

	int getBookclubAHitLike(@Param("aidx") int aidx, @Param("mid") String mid);

	void bookclubAHitLikePost(@Param("vo") BookclubALikeVO vo);

	void bookclubANoLike(@Param("aidx") int aidx, @Param("mid") String mid);

	void bookclubAHitDelete(@Param("aidx") int aidx);

	void bookclubADelete(@Param("idx") int idx);

	int getVocaList(@Param("clubIdx") int clubIdx, @Param("word") String word, @Param("language") String language);

	void setBookclubVoca(@Param("vo") BookclubVocaVO vo);

	List<BookclubVocaVO> getAllVocaList(@Param("clubIdx") int clubIdx,@Param("language") String language);

	int getVocaMarked(@Param("vocaIdx") int vocaIdx,@Param("mid") String mid);

	void setVocaBookMark(@Param("vocaIdx") int vocaIdx, @Param("mid") String mid ,@Param("clubMidx") int clubMidx);

	void deleteVocaBookMark(@Param("vocaIdx") int vocaIdx, @Param("mid") String mid);

	void vocaDelete(@Param("idx") int idx);

	void linkedBookMark(@Param("vocaIdx") int vocaIdx);

	void bookclubMarked(@Param("mid") String mid,@Param("idx") int idx, @Param("clubMidx") int clubMidx);

	int getBookclubMarked(@Param("clubIdx") int clubIdx,@Param("mid")  String mid);

	void bookclubMarkedNo(@Param("mid") String mid,@Param("clubIdx") int clubIdx);

	List<BookclubVO> getBookclubSearch(@Param("select") String select,@Param("searchStr") String searchStr, @Param("mid") String mid);

	List<BookclubMemberVO> bookclubGetMember(@Param("idx") int idx);

	BookclubAVO getBookclubAFeatured(@Param("qidx") int qidx);

	void setBookclubAFeatured(@Param("idx") int idx, @Param("eIdx") int eIdx);

	List<BookclubVocaVO> getSearchVocaList(@Param("idx") int idx, @Param("lang") String lang, @Param("searchInput") String searchInput);

	List<BookclubQVO> getQnASearch(@Param("idx") int idx,@Param("mid") String mid,@Param("lang") String lang,@Param("searchStr") String searchStr);

	void clubHostChange(@Param("mid") String mid,@Param("idx") int idx);

	void clubMemberBan(@Param("mid") String mid,@Param("idx") int idx);

	void clubMemberSub(@Param("idx") int idx);

	void bookclubUn(@Param("idx") int idx ,@Param("mid") String mid);

	void bookclubReport(@Param("vo") BookclubReportVO vo);

	void bookclubDelete(@Param("idx") int idx);

	int getClubMidx(@Param("mid") String mid, @Param("clubIdx") int clubIdx);

	void clubpointUpdate(@Param("clubMidx") int clubMidx, @Param("amount") int amount);

	int getClubPoint(@Param("mid") String mid);

	BookclubAVO getBookclubAnswer(@Param("idx") int idx);

	List<BookclubMemberVO> bookclubBanMember(@Param("idx") int idx);

	void clubMemberUnBan(@Param("mid") String mid,@Param("idx") int idx);

	BookclubMemberVO getBestMember(@Param("idx") int idx);

	void updateTop(@Param("idx") int idx);

	int getQboardIdx(@Param("aIdx") int aIdx);

	BookclubMemberVO getMemberDetail(@Param("mid") String mid);

	List<BookclubReportVO> getReportALL();

	void updateReportedPost(@Param("idx") int idx);

	BookclubMemberVO isBookClubMember(@Param("idx") int idx,@Param("mid") String mid);
}
