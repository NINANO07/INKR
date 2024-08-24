package com.spring.javaclassS10.vo;

import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	
	@Size(min=4, max=10)
	private String mid;
	
	private String pwd;
	private String firstName;
	private String lastName;
	private String region;
	private String birthday;
	private String email;
	private String tel;
	private String photo;
	private int point;
	private int levelB;
	private int levelC;
	private int levelM;
	private String signUpDate;
	private String lastDate;
	private int visitCnt;
	private boolean visibility;
	private boolean isActive;
	
	private String areaTel;
	
	private int reportCnt;
	
	/* private int heartNum; */

}
