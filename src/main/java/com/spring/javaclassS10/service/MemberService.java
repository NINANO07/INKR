package com.spring.javaclassS10.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.vo.CountryCodeVO;
import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.MessageVO;

public interface MemberService {

	ArrayList<CountryCodeVO> getCountrycodeList();

	MemberVO getIdCheck(String mid);

	MemberVO getEmailCheck(String email);

	String fileUpload(MultipartFile file, String mid, String photo);

	int setMemberJoin(MemberVO vo);

	void setUpdateVisitCnt(String mid);

	void memberBlock(String toMid, String mid);

	void pointUpdate(String mid, int amount, String flag);

	int pointAmount(String mid);

	void updateLevel(String mid, int i, String sort);

	int getLevel(String mid, String sort);

	void resetPassword(String mid, String pwd);

	List<MemberVO> getAllMember(int startIndexNo, int pageSize, String sort, String search);

	int getMemberTotRecCnt(String search);

	void updateUserInfo(MemberVO vo);

	void sendMessage(MessageVO vo);

	List<MemberVO> getMemberList();

	List<MessageVO> getInMessage(String mid);

	List<MessageVO> getStMessage(String mid);

	void changePhoto(MemberVO vo);



}
