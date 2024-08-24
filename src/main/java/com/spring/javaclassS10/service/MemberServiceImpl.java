package com.spring.javaclassS10.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS10.common.JavaclassProvide;
import com.spring.javaclassS10.dao.CodeDAO;
import com.spring.javaclassS10.dao.MemberDAO;
import com.spring.javaclassS10.vo.CountryCodeVO;
import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.MessageVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	CodeDAO codeDao;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired 
	JavaclassProvide javaclassProvide;

	@Override
	public ArrayList<CountryCodeVO> getCountrycodeList() {
		ArrayList<CountryCodeVO> vos = codeDao.getCountrycodeList();
		for(CountryCodeVO vo : vos) {
			String dialCode = vo.getDialCode();
			vo.setEngNm(vo.getEngNm().replace("_", " "));
			if(dialCode.contains("+")) {
				dialCode = dialCode.substring(1, dialCode.indexOf("-"));
				vo.setDialCode(dialCode);
			}
		}
		
		return vos;
	}

	@Override
	public MemberVO getIdCheck(String mid) {
		return memberDAO.getIdCheck(mid);
	}

	@Override
	public MemberVO getEmailCheck(String email) {
		return memberDAO.getEmailCheck(email);
	}

	@Override
	public String fileUpload(MultipartFile file, String mid, String photo) {
		String oFileName = file.getOriginalFilename();
		String sFileName = mid+"_"+javaclassProvide.saveFileName(oFileName);
		
		try {
			javaclassProvide.writeFile(file, sFileName, "member");
			
			if(!photo.equals("noimage.jpg")) javaclassProvide.deleteFile(photo, "member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sFileName;
	}

	@Override
	public int setMemberJoin(MemberVO vo) {
		return memberDAO.setMemberJoin(vo);
	}

	@Override
	public void setUpdateVisitCnt(String mid) {
		memberDAO.setUpdateVisitCnt(mid);
	}

	@Override
	public void memberBlock(String toMid, String mid) {
		memberDAO.memberBlock(toMid, mid);
	}

	@Override
	public void pointUpdate(String mid, int amount, String flag) {
		memberDAO.pointUpdate(mid, amount, flag);
	}

	@Override
	public int pointAmount(String mid) {
		return memberDAO.pointAmount(mid);
	}

	@Override
	public void updateLevel(String mid, int i, String sort) {
		memberDAO.updateLevel(mid, i, sort);	
	}

	@Override
	public int getLevel(String mid, String sort) {
		return memberDAO.getLevel(mid, sort);
	}

	@Override
	public void resetPassword(String mid, String pwd) {
		memberDAO.resetPassword(mid, pwd);
		
	}

	@Override
	public List<MemberVO> getAllMember(int startIndexNo, int pageSize, String sort, String search) {
		return memberDAO.getAllMember(startIndexNo,  pageSize, sort, search);
	}

	@Override
	public int getMemberTotRecCnt(String search) {
		
		return memberDAO.getMemberTotRecCnt(search);
	}

	@Override
	public void updateUserInfo(MemberVO vo) {
		vo.setTel(vo.getAreaTel()+"/"+vo.getTel());
		vo.setBirthday(vo.getBirthday().substring(0,4)+"-"+vo.getBirthday().substring(5,7)+"-"+vo.getBirthday().substring(8,10));
		memberDAO.updateUserInfo(vo);
		
	}

	@Override
	public void sendMessage(MessageVO vo) {
		memberDAO.setMessage(vo);
		
	}

	@Override
	public List<MemberVO> getMemberList() {
		
		return memberDAO.getMemberList() ;
	}

	@Override
	public List<MessageVO> getInMessage(String mid) {
		return memberDAO.getInMessage(mid);
	}

	@Override
	public List<MessageVO> getStMessage(String mid) {
		return memberDAO.getStMessage(mid);
	}

	@Override
	public void changePhoto(MemberVO vo) {
		memberDAO.changePhoto(vo);
		
	}


	
}
