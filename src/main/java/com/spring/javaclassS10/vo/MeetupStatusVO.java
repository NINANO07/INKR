package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class MeetupStatusVO {
	private int idx; 
	private int meetupIdx;
	private String content;
	private String setDate;
	
	private boolean notice;

}
