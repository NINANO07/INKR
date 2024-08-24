package com.spring.javaclassS10.vo;

import lombok.Data;

@Data
public class BookclubVO {
	private int idx;
	private String host;
	private String title;
	private String isbn;
	private String cover;
	private String author;
	private String engTitle;
	private String engAuthor;
	private String createDate;
	
	private int participant;
	
	private boolean marked;
}
