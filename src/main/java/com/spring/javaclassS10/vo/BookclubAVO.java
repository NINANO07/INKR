package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubAVO {
	private int idx;
	private int clubIdx;
	private int qidx;
	private int clubMidx;
	private int clubToidx;
	private String mid;
	private String toMid;
	private String content;
	private String imgFile;
	private boolean isFeatured;
	private String adate;
	
	private int date_diff;
	private int hour_diff;
	
	private String photo;
	private int levelB;
	
	private String qmid;
	
	private boolean isHit;
}
