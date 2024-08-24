package com.spring.javaclassS10.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MeetupStatusVO;
import com.spring.javaclassS10.vo.MeetupVO;

public interface MeetupDAO {

	void meetupCreate(@Param("vo") MeetupVO vo);

	MeetupVO getMeetup(@Param("mapX") String mapX, @Param("mapY") String mapY);

	List<MeetupVO> getAllMeetup(@Param("member") String member,@Param("mid") String mid);

	MeetupVO getMeetupList(@Param("idx") int idx);

	int setMeetupMember(@Param("meetupIdx") int idx, @Param("mid") String mid);

	void pointUpgrade(@Param("meetupIdx") int idx, @Param("mid") String mid, @Param("amount") int i, @Param("flag") String flag);

	MeetupMemberVO getMeetupMember(@Param("idx") int idx, @Param("mid") String mid);

	List<MeetupMemberVO> getMeetupMemberAll(@Param("idx") int idx);

	void setMeetupWaiting(@Param("idx") int idx,@Param("mid") String mid);

	int getWaitingList(@Param("idx") int idx,@Param("mid") String mid);

	void updateStatus(@Param("idx") int idx, @Param("content") String content, @Param("notice") boolean notice);

	List<MeetupStatusVO> getMeetupStatus(@Param("idx") int idx);

	void deleteNotice(@Param("idx") int idx);

	void cancelMeetup(@Param("meetupIdx") int meetupIdx,@Param("mid") String mid);

	int getClubPoint(@Param("mid") String mid);

	int getCanceledList(@Param("idx")int idx, @Param("mid") String mid);

	List<MeetupMemberVO> getWaitedList(@Param("idx")int idx);

	void updateMeetUpEdit(@Param("vo") MeetupVO vo);

	void deleteWaitedList(@Param("idx") int idx,@Param("mid")  String mid);

	void deleteMeetUp(@Param("idx") int idx);

	MeetupMemberVO getMemberDetail(@Param("mid") String mid);

	List<MeetupVO> getMeetupListAll();

	void updateMeetUpExpired(@Param("strToday") String strToday);



}
