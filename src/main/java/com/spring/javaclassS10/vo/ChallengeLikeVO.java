package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class ChallengeLikeVO {
	private int idx;
	private int chIdx;
	private String mid;
	private String toMid;
	private String hitDate;
	
	private int postedCnt;
	private int likedCnt;
	private int point;
	
}
