package com.spring.javaclassS10.service;

import java.util.List;

import com.spring.javaclassS10.vo.EventListVO;
import com.spring.javaclassS10.vo.MeetupMemberVO;
import com.spring.javaclassS10.vo.MeetupStatusVO;
import com.spring.javaclassS10.vo.MeetupVO;

public interface MeetupService {

	List<EventListVO> getEventList(String pageNo, String language, String date, String searchStr);

	void meetupCreate(MeetupVO vo);

	MeetupVO getMeetup(String mapX, String mapY);

	List<MeetupVO> getAllMeetup(String member, String mid);

	MeetupVO getMeetupList(int idx);

	MeetupMemberVO getMeetupMember(int idx, String mid);

	void setMeetupMember(int idx, String mid);

	List<MeetupMemberVO> getMeetupMemberAll(int idx);

	void setMeetupWaiting(int idx, String mid);

	int getWaitingList(int idx, String mid);

	List<MeetupStatusVO> getMeetupStatus(int idx);

	void updateStatus(int idx, String content, boolean notice);

	void deleteNotice(int idx);

	void cancelMeetup(int meetupIdx, String mid);

	int getCanceledList(int idx, String mid);

	List<MeetupMemberVO> getWaitedList(int idx);

	String[] updateMeetUpEdit(MeetupVO vo);

	void deleteMeetUp(int idx, String mid);

	MeetupMemberVO getMemberDetail(String mid);

	List<MeetupVO> getMeetupListAll();

	void updateMeetUpExpired();

}
