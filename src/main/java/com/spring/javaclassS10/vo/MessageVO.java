package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class MessageVO {
	private int idx;
	private String toMid;
	private String fromMid;
	private String subject;
	private String sendDate;
	private boolean checked;

}
