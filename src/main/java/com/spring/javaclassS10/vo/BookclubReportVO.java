package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubReportVO {
	private int idx;
	private String sort; 
	private int sortIdx;
	private String offender;
	private String reporter;
	private String reason;
	private String detail;
	private String reportDate;
	private boolean deleted;
	
}
