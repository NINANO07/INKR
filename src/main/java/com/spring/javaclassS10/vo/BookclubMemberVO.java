package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubMemberVO {
	private int idx; 
	private int clubIdx; 
	private String mid;
	private int clubPoint;
	private String joinDate;
	private boolean baned;

	private String firstName;
	private String photo;
	private int levelB;
	
	private int postedCnt;
	private int answeredCnt;
	private int likedCnt;
	private int featuredCnt;
	private int reportedCnt;
	private int hostCnt;
	private int joinCnt;
	
}
