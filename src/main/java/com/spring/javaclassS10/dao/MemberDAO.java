package com.spring.javaclassS10.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS10.vo.MemberVO;
import com.spring.javaclassS10.vo.MessageVO;

public interface MemberDAO {

	public MemberVO getIdCheck(@Param("mid") String mid);

	public MemberVO getEmailCheck(@Param("email") String email);

	public int setMemberJoin(@Param("vo") MemberVO vo);

	public void setUpdateVisitCnt(@Param("mid") String mid);

	public void memberBlock(@Param("toMid") String toMid,@Param("mid")  String mid);

	public void pointUpdate(@Param("mid") String mid,@Param("amount") int amount,@Param("flag") String flag);

	public int pointAmount(@Param("mid") String mid);

	public void updateLevel(@Param("mid") String mid, @Param("i") int i, @Param("sort") String sort);

	public int getLevel(@Param("mid") String mid, @Param("sort") String sort);

	public void resetPassword(@Param("mid") String mid,@Param("pwd") String pwd);

	public List<MemberVO> getAllMember(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("sort") String sort,@Param("search") String search);

	public int getMemberTotRecCnt(@Param("search") String search);

	public void updateUserInfo(@Param("vo") MemberVO vo);

	public void setMessage(@Param("vo") MessageVO vo);

	public List<MemberVO> getMemberList();

	public List<MessageVO> getInMessage(@Param("mid") String mid);

	public List<MessageVO> getStMessage(@Param("mid") String mid);

	public void changePhoto(@Param("vo") MemberVO vo);
}
