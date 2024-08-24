package com.spring.javaclassS10.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.ChallengeListVO;
import com.spring.javaclassS10.vo.ChallengeVO;

public interface ChallengeDAO {

	List<ChallengeListVO> getChallengeList();

	void setChallenge(@Param("vo") ChallengeVO vo);

	List<ChallengeVO> getChallenge(@Param("mid") String mid);

	List<ChallengeVO> getChallengeSearch(@Param("sort") String sort, @Param("tag") String[] tag, @Param("searchStr") String searchStr,@Param("mid") String mid);

	void challegeHitLike(@Param("vo") ChallengeLikeVO vo);

	void challegeNoLike(@Param("vo") ChallengeLikeVO vo);

	List<ChallengeVO> challengeBy(@Param("flag") String flag, @Param("txt") String txt, @Param("mid") String mid);

	void deletePost(@Param("idx") int idx);

	int getChallengePoint(@Param("mid") String mid);

	void setChallengePoint(@Param("mid") String mid);

	void updateChallengePoint(@Param("mid") String mid,@Param("i") int i);

	int getPoint(@Param("mid") String mid);

	List<ChallengeVO> challengeGetLike(@Param("idx") int idx);

	ChallengeLikeVO getMemberDetail(@Param("mid") String mid);

	void setChallengeList(@Param("title") String title,@Param("mid") String mid);

	void updateChallengeCnt(@Param("listIdx") int listIdx);

}
