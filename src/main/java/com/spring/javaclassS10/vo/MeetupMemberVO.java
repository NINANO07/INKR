package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class MeetupMemberVO {
	private int idx;
	private int meetupIdx;
	private String mid;
	private String joinDate;
	private int point;
	
	private String photo; 
	private int levelM;
	private String tel;
	private String email;
	private String firstName;
	
	private String putDate;
	
	private int hostCnt;
	private int joinCnt;
}
