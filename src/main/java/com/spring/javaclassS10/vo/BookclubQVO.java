package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubQVO {
	private int idx;
	private int clubIdx;
	private int clubMidx;
	private String mid;
	private String content;
	private Integer page;
	private Integer line;
	private String imgFile;
	private String language;
	private int viewCnt;
	private String qdate;
	private String top;
	
	private int date_diff;
	private int hour_diff;
	
	
	
	
	private String photo;
	private int levelB;
	
	private int replyCnt;
}
