package com.spring.javaclassS10.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.ChallengeListVO;
import com.spring.javaclassS10.vo.ChallengeVO;

public interface ChallengeService {

	List<ChallengeListVO> getChallengeList();

	String fileUpload(String mid, MultipartFile file);

	void setChallenge(ChallengeVO vo);

	List<ChallengeVO> getChallenge(String mid);

	List<ChallengeVO> getChallengeSearch(String sort, String[] tag, String searchStr, String mid);

	void challegeHitLike(ChallengeLikeVO vo);

	void challegeNoLike(ChallengeLikeVO vo);

	List<ChallengeVO> challengeBy(String flag, String txt, String mid);

	void deletePost(int idx, String photo);

	List<ChallengeVO> challengeGetLike(int idx);

	ChallengeLikeVO getMemberDetail(String mid);

	void setChallengeList(String title, String mid);

}
