package com.spring.javaclassS10.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.dao.ChallengeDAO;
import com.spring.javaclassS10.vo.ChallengeLikeVO;
import com.spring.javaclassS10.vo.ChallengeListVO;
import com.spring.javaclassS10.vo.ChallengeVO;

@Service
public class ChallengeServiceImpl implements ChallengeService {
	@Autowired
	ChallengeDAO challengeDAO;

	@Autowired
	JavaclassProvide javaclassProvide;
	
	@Autowired
	MemberService memberService;
	
	@Override
	public List<ChallengeListVO> getChallengeList() {
		// TODO Auto-generated method stub
		return challengeDAO.getChallengeList();
	}
	
	@Override
	public String fileUpload(String mid, MultipartFile file) {
		String oFileName = file.getOriginalFilename();
		String sFileName = mid+"_"+javaclassProvide.saveFileName(oFileName);
		
		try {
			javaclassProvide.writeFile(file, sFileName, "challenge");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sFileName;
	}

	@Transactional
	@Override
	public void setChallenge(ChallengeVO vo) {
		int res = challengeDAO.getChallengePoint(vo.getMid());
		
		if(res == 0) challengeDAO.setChallengePoint(vo.getMid());
		
		
		challengeDAO.setChallenge(vo);
		challengeDAO.updateChallengeCnt(vo.getListIdx());
		challengeDAO.updateChallengePoint(vo.getMid(), 50);
		int point = challengeDAO.getPoint(vo.getMid());
		memberService.pointUpdate(vo.getMid(), 50, "plus");
		javaclassProvide.update(vo.getMid(), point, "challenge");
	}

	@Override
	public List<ChallengeVO> getChallenge(String mid) {
		return challengeDAO.getChallenge(mid);
	}

	@Override
	public List<ChallengeVO> getChallengeSearch(String sort, String[] tag, String searchStr, String mid) {

		return challengeDAO.getChallengeSearch(sort, tag, searchStr, mid);
	}

	@Override
	public void challegeHitLike(ChallengeLikeVO vo) {
		challengeDAO.challegeHitLike(vo);
		
	}

	@Override
	public void challegeNoLike(ChallengeLikeVO vo) {
		challengeDAO.challegeNoLike(vo);
		
	}

	@Override
	public List<ChallengeVO> challengeBy(String flag, String txt, String mid) {
		return challengeDAO.challengeBy(flag, txt, mid);
	}

	@Override
	public void deletePost(int idx, String photo) {
		
		javaclassProvide.deleteFile(photo, "challenge");
		challengeDAO.deletePost(idx);
	}

	@Override
	public List<ChallengeVO> challengeGetLike(int idx) {
		return challengeDAO.challengeGetLike(idx);
	}

	@Override
	public ChallengeLikeVO getMemberDetail(String mid) {
		return challengeDAO.getMemberDetail(mid);
	}

	@Override
	public void setChallengeList(String title, String mid) {
		challengeDAO.setChallengeList(title, mid);
		
	}

	
	
}
