package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class EventListVO {
	private int idx;
	private String contentId;
	private String title;
	private String firstImage;
	private String addr;
	private String eventStartDate;
	private String eventEndDate;
	private String mapX;
	private String mapY;

}
