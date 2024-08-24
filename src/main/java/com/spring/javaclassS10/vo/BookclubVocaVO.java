package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubVocaVO {
	private int idx;
	private int clubIdx;
	private int clubMidx;
	private String mid;
	private String word;
	private String transWord;
	private String language;
	private String wordGrade;
	private String pos;
	private String definition;
	private String transDfn;
	private String vocaDate;
	
	private boolean marked;
}
