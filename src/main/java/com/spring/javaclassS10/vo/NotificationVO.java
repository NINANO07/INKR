package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class NotificationVO {
	private int idx;
	private String section;
	private String sort; 
	private int superIdx; 
	private int reIdx;
	private String toMid;
	private String fromMid;
	private boolean checked;
	private String actDate;
}
