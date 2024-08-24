package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class MeetupVO {
	private int idx;
	private String host;
	private String contentid;
	private String title;
	private String addr;
	private String firstimage;
	private String eventstartdate;
	private String eventenddate;
	private String mapx;
	private String mapy;
	private String meetingDate;
	private String meetingTime;
	private int memNumber;
	private String description;
	private String createDate;
	
	private boolean expired;
	
	private int curNumber;

}
